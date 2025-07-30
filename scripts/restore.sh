#!/bin/bash

# V0 Project - Restore Script
# Comprehensive restore solution with verification

set -e

# Configuration
PROJECT_NAME="v0-project"
BACKUP_BASE_DIR="/var/backups/v0-project"
APP_DIR="/var/www/v0-project"
LOG_FILE="/var/log/v0-project/restore.log"
ENCRYPTION_KEY="${BACKUP_ENCRYPTION_KEY:-}"

# Database configuration
DB_HOST="localhost"
DB_PORT="5432"
DB_NAME="v0_tactical_db"
DB_USER="v0_user"
DB_PASSWORD="${DATABASE_PASSWORD:-}"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

# Logging function
log() {
    echo -e "${BLUE}[$(date +'%Y-%m-%d %H:%M:%S')]${NC} $1" | tee -a "$LOG_FILE"
}

error() {
    echo -e "${RED}[ERROR]${NC} $1" | tee -a "$LOG_FILE"
    exit 1
}

success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1" | tee -a "$LOG_FILE"
}

warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1" | tee -a "$LOG_FILE"
}

# Show usage
usage() {
    echo "Usage: $0 [OPTIONS] BACKUP_FILE"
    echo ""
    echo "Options:"
    echo "  --database-only    Restore only the database"
    echo "  --files-only       Restore only application files"
    echo "  --config-only      Restore only configuration files"
    echo "  --verify           Verify backup integrity before restore"
    echo "  --dry-run          Show what would be restored without actually doing it"
    echo "  --force            Skip confirmation prompts"
    echo "  --help             Show this help message"
    echo ""
    echo "Examples:"
    echo "  $0 /var/backups/v0-project/20240115-143022.tar.gz"
    echo "  $0 --database-only --verify backup.tar.gz.enc"
    echo "  $0 --dry-run --force latest-backup.tar.gz"
}

# Parse command line arguments
DATABASE_ONLY=false
FILES_ONLY=false
CONFIG_ONLY=false
VERIFY_BACKUP=false
DRY_RUN=false
FORCE=false
BACKUP_FILE=""

while [[ $# -gt 0 ]]; do
    case $1 in
        --database-only)
            DATABASE_ONLY=true
            shift
            ;;
        --files-only)
            FILES_ONLY=true
            shift
            ;;
        --config-only)
            CONFIG_ONLY=true
            shift
            ;;
        --verify)
            VERIFY_BACKUP=true
            shift
            ;;
        --dry-run)
            DRY_RUN=true
            shift
            ;;
        --force)
            FORCE=true
            shift
            ;;
        --help)
            usage
            exit 0
            ;;
        -*)
            error "Unknown option: $1"
            ;;
        *)
            BACKUP_FILE="$1"
            shift
            ;;
    esac
done

# Validate backup file
if [ -z "$BACKUP_FILE" ]; then
    error "Backup file is required. Use --help for usage information."
fi

if [ ! -f "$BACKUP_FILE" ]; then
    error "Backup file does not exist: $BACKUP_FILE"
fi

# Extract backup
extract_backup() {
    local backup_file="$1"
    local extract_dir=$(mktemp -d)
    
    log "📦 Extracting backup: $(basename "$backup_file")"
    
    # Check if backup is encrypted
    if [[ "$backup_file" == *.enc ]]; then
        if [ -z "$ENCRYPTION_KEY" ]; then
            error "Backup is encrypted but no encryption key provided"
        fi
        
        log "🔓 Decrypting backup..."
        openssl enc -aes-256-cbc -d -salt -k "$ENCRYPTION_KEY" -in "$backup_file" | \
            tar -xzf - -C "$extract_dir" || error "Failed to decrypt and extract backup"
    else
        tar -xzf "$backup_file" -C "$extract_dir" || error "Failed to extract backup"
    fi
    
    # Find the backup directory (should be the only directory in extract_dir)
    local backup_dir=$(find "$extract_dir" -maxdepth 1 -type d ! -path "$extract_dir" | head -1)
    
    if [ -z "$backup_dir" ]; then
        error "Invalid backup structure"
    fi
    
    echo "$backup_dir"
}

# Verify backup integrity
verify_backup() {
    local backup_dir="$1"
    
    log "🔍 Verifying backup integrity..."
    
    # Check manifest file
    if [ ! -f "$backup_dir/manifest.json" ]; then
        warning "Manifest file not found, skipping integrity check"
        return
    fi
    
    # Parse manifest
    local backup_date=$(jq -r '.backup_date' "$backup_dir/manifest.json" 2>/dev/null || echo "unknown")
    local project_name=$(jq -r '.project_name' "$backup_dir/manifest.json" 2>/dev/null || echo "unknown")
    
    log "Backup Date: $backup_date"
    log "Project Name: $project_name"
    
    # Verify expected directories exist
    local expected_dirs=("database" "application" "config")
    for dir in "${expected_dirs[@]}"; do
        if [ ! -d "$backup_dir/$dir" ]; then
            warning "Expected directory not found: $dir"
        fi
    done
    
    # Verify database backup
    if [ -f "$backup_dir/database/database.sql.gz" ]; then
        log "✅ Database backup found"
        # Test gzip integrity
        gzip -t "$backup_dir/database/database.sql.gz" || error "Database backup is corrupted"
    else
        warning "Database backup not found"
    fi
    
    # Verify application backup
    if [ -f "$backup_dir/application/app-files.tar.gz" ]; then
        log "✅ Application backup found"
        # Test tar integrity
        tar -tzf "$backup_dir/application/app-files.tar.gz" > /dev/null || error "Application backup is corrupted"
    else
        warning "Application backup not found"
    fi
    
    success "Backup integrity verification completed"
}

# Create pre-restore backup
create_pre_restore_backup() {
    if [ "$DRY_RUN" = true ]; then
        log "DRY RUN: Would create pre-restore backup"
        return
    fi
    
    log "💾 Creating pre-restore backup..."
    
    local pre_restore_backup="$BACKUP_BASE_DIR/pre-restore-$(date +%Y%m%d-%H%M%S)"
    mkdir -p "$pre_restore_backup"
    
    # Backup current database
    if [ "$FILES_ONLY" = false ] && [ "$CONFIG_ONLY" = false ]; then
        export PGPASSWORD="$DB_PASSWORD"
        pg_dump -h "$DB_HOST" -p "$DB_PORT" -U "$DB_USER" -d "$DB_NAME" \
            > "$pre_restore_backup/current-database.sql" || warning "Failed to backup current database"
        unset PGPASSWORD
    fi
    
    # Backup current application files
    if [ "$DATABASE_ONLY" = false ] && [ "$CONFIG_ONLY" = false ]; then
        tar -czf "$pre_restore_backup/current-app-files.tar.gz" \
            -C "$APP_DIR" \
            --exclude='node_modules' \
            --exclude='.git' \
            --exclude='.next' \
            . || warning "Failed to backup current application files"
    fi
    
    success "Pre-restore backup created: $pre_restore_backup"
}

# Restore database
restore_database() {
    local backup_dir="$1"
    local db_backup_file="$backup_dir/database/database.sql.gz"
    
    if [ ! -f "$db_backup_file" ]; then
        warning "Database backup not found, skipping database restore"
        return
    fi
    
    if [ "$DRY_RUN" = true ]; then
        log "DRY RUN: Would restore database from $db_backup_file"
        return
    fi
    
    log "🗄️ Restoring database..."
    
    # Stop application to prevent database connections
    pm2 stop "$PROJECT_NAME" > /dev/null 2>&1 || true
    
    # Set password for psql
    export PGPASSWORD="$DB_PASSWORD"
    
    # Drop existing connections
    psql -h "$DB_HOST" -p "$DB_PORT" -U "$DB_USER" -d postgres -c "
        SELECT pg_terminate_backend(pid) 
        FROM pg_stat_activity 
        WHERE datname = '$DB_NAME' AND pid <> pg_backend_pid();
    " > /dev/null 2>&1 || true
    
    # Restore database
    gunzip -c "$db_backup_file" | psql -h "$DB_HOST" -p "$DB_PORT" -U "$DB_USER" -d postgres || \
        error "Failed to restore database"
    
    unset PGPASSWORD
    
    success "Database restored successfully"
}

# Restore application files
restore_application() {
    local backup_dir="$1"
    local app_backup_file="$backup_dir/application/app-files.tar.gz"
    
    if [ ! -f "$app_backup_file" ]; then
        warning "Application backup not found, skipping application restore"
        return
    fi
    
    if [ "$DRY_RUN" = true ]; then
        log "DRY RUN: Would restore application files from $app_backup_file"
        return
    fi
    
    log "📁 Restoring application files..."
    
    # Stop application
    pm2 stop "$PROJECT_NAME" > /dev/null 2>&1 || true
    
    # Create temporary directory for extraction
    local temp_dir=$(mktemp -d)
    
    # Extract application files
    tar -xzf "$app_backup_file" -C "$temp_dir" || error "Failed to extract application files"
    
    # Backup current .env.local if it exists
    if [ -f "$APP_DIR/.env.local" ]; then
        cp "$APP_DIR/.env.local" "$temp_dir/.env.local.current" || true
    fi
    
    # Remove current application directory (except .env.local)
    find "$APP_DIR" -mindepth 1 -maxdepth 1 ! -name '.env.local' -exec rm -rf {} + || \
        error "Failed to clean current application directory"
    
    # Move restored files to application directory
    cp -r "$temp_dir"/* "$APP_DIR"/ || error "Failed to copy restored files"
    
    # Restore current .env.local if it was backed up
    if [ -f "$temp_dir/.env.local.current" ]; then
        mv "$temp_dir/.env.local.current" "$APP_DIR/.env.local" || true
    fi
    
    # Set correct permissions
    chown -R v0app:v0app "$APP_DIR" || warning "Failed to set file permissions"
    
    # Clean up temporary directory
    rm -rf "$temp_dir"
    
    success "Application files restored successfully"
}

# Restore configuration files
restore_config() {
    local backup_dir="$1"
    local config_backup_file="$backup_dir/config/config.tar.gz"
    
    if [ ! -f "$config_backup_file" ]; then
        warning "Configuration backup not found, skipping configuration restore"
        return
    fi
    
    if [ "$DRY_RUN" = true ]; then
        log "DRY RUN: Would restore configuration files from $config_backup_file"
        return
    fi
    
    log "⚙️ Restoring configuration files..."
    
    # Create temporary directory for extraction
    local temp_dir=$(mktemp -d)
    
    # Extract configuration files
    tar -xzf "$config_backup_file" -C "$temp_dir" || error "Failed to extract configuration files"
    
    # Restore .env.local (with confirmation)
    if [ -f "$temp_dir/.env.local" ]; then
        if [ "$FORCE" = false ]; then
            read -p "Restore .env.local? This will overwrite current environment variables (y/N): " -n 1 -r
            echo
            if [[ $REPLY =~ ^[Yy]$ ]]; then
                cp "$temp_dir/.env.local" "$APP_DIR/.env.local" || warning "Failed to restore .env.local"
            fi
        else
            cp "$temp_dir/.env.local" "$APP_DIR/.env.local" || warning "Failed to restore .env.local"
        fi
    fi
    
    # Restore ecosystem.config.js
    if [ -f "$temp_dir/ecosystem.config.js" ]; then
        cp "$temp_dir/ecosystem.config.js" "$APP_DIR/ecosystem.config.js" || warning "Failed to restore PM2 config"
    fi
    
    # Restore Nginx configuration (requires sudo)
    if [ -f "$temp_dir/nginx.conf" ]; then
        if [ "$FORCE" = false ]; then
            read -p "Restore Nginx configuration? (y/N): " -n 1 -r
            echo
            if [[ $REPLY =~ ^[Yy]$ ]]; then
                sudo cp "$temp_dir/nginx.conf" "/etc/nginx/sites-available/v0-project" || warning "Failed to restore Nginx config"
                sudo nginx -t && sudo systemctl reload nginx || warning "Failed to reload Nginx"
            fi
        else
            sudo cp "$temp_dir/nginx.conf" "/etc/nginx/sites-available/v0-project" || warning "Failed to restore Nginx config"
            sudo nginx -t && sudo systemctl reload nginx || warning "Failed to reload Nginx"
        fi
    fi
    
    # Restore PM2 dump
    if [ -f "$temp_dir/dump.pm2" ]; then
        cp "$temp_dir/dump.pm2" ~/.pm2/dump.pm2 || warning "Failed to restore PM2 dump"
    fi
    
    # Clean up temporary directory
    rm -rf "$temp_dir"
    
    success "Configuration files restored successfully"
}

# Post-restore tasks
post_restore_tasks() {
    if [ "$DRY_RUN" = true ]; then
        log "DRY RUN: Would perform post-restore tasks"
        return
    fi
    
    log "🔧 Performing post-restore tasks..."
    
    # Install dependencies if application files were restored
    if [ "$DATABASE_ONLY" = false ] && [ "$CONFIG_ONLY" = false ]; then
        cd "$APP_DIR"
        log "📦 Installing dependencies..."
        npm ci --production || warning "Failed to install dependencies"
        
        log "🔨 Building application..."
        npm run build || warning "Failed to build application"
    fi
    
    # Start application
    log "🚀 Starting application..."
    pm2 start "$APP_DIR/ecosystem.config.js" || pm2 restart "$PROJECT_NAME" || \
        warning "Failed to start application"
    
    # Wait for application to start
    sleep 10
    
    # Health check
    log "🏥 Performing health check..."
    local max_attempts=30
    local attempt=1
    
    while [ $attempt -le $max_attempts ]; do
        if curl -f -s http://localhost:3000/health > /dev/null; then
            success "Health check passed"
            break
        fi
        
        if [ $attempt -eq $max_attempts ]; then
            error "Health check failed after $max_attempts attempts"
        fi
        
        log "Health check attempt $attempt/$max_attempts failed, retrying in 2 seconds..."
        sleep 2
        ((attempt++))
    done
    
    # Save PM2 configuration
    pm2 save || warning "Failed to save PM2 configuration"
    
    success "Post-restore tasks completed"
}

# Generate restore report
generate_restore_report() {
    local backup_file="$1"
    local start_time="$2"
    local end_time="$3"
    
    local duration=$((end_time - start_time))
    local backup_name=$(basename "$backup_file")
    
    cat > "$BACKUP_BASE_DIR/last-restore-report.txt" << EOF
V0 Project Restore Report
=========================

Backup File: $backup_name
Start Time: $(date -d @$start_time)
End Time: $(date -d @$end_time)
Duration: ${duration} seconds
Status: SUCCESS

Restore Options:
- Database Only: $DATABASE_ONLY
- Files Only: $FILES_ONLY
- Config Only: $CONFIG_ONLY
- Dry Run: $DRY_RUN
- Force: $FORCE

Components Restored:
$([ "$DATABASE_ONLY" = true ] || [ "$FILES_ONLY" = false ] && [ "$CONFIG_ONLY" = false ] && echo "- Database (PostgreSQL)")
$([ "$FILES_ONLY" = true ] || [ "$DATABASE_ONLY" = false ] && [ "$CONFIG_ONLY" = false ] && echo "- Application Files")
$([ "$CONFIG_ONLY" = true ] || [ "$DATABASE_ONLY" = false ] && [ "$FILES_ONLY" = false ] && echo "- Configuration Files")

Application Status: $(pm2 list | grep "$PROJECT_NAME" | awk '{print $10}' || echo "Unknown")
Health Check: $(curl -f -s http://localhost:3000/health > /dev/null && echo "PASSED" || echo "FAILED")
EOF

    log "📊 Restore report generated"
}

# Confirmation prompt
confirm_restore() {
    if [ "$FORCE" = true ] || [ "$DRY_RUN" = true ]; then
        return
    fi
    
    echo
    echo "⚠️  WARNING: This will restore data from the backup and may overwrite current data."
    echo
    echo "Backup File: $(basename "$BACKUP_FILE")"
    echo "Restore Options:"
    echo "  - Database: $([ "$DATABASE_ONLY" = true ] || [ "$FILES_ONLY" = false ] && [ "$CONFIG_ONLY" = false ] && echo "YES" || echo "NO")"
    echo "  - Application Files: $([ "$FILES_ONLY" = true ] || [ "$DATABASE_ONLY" = false ] && [ "$CONFIG_ONLY" = false ] && echo "YES" || echo "NO")"
    echo "  - Configuration: $([ "$CONFIG_ONLY" = true ] || [ "$DATABASE_ONLY" = false ] && [ "$FILES_ONLY" = false ] && echo "YES" || echo "NO")"
    echo
    read -p "Are you sure you want to continue? (y/N): " -n 1 -r
    echo
    
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        log "Restore cancelled by user"
        exit 0
    fi
}

# Main restore function
main() {
    local start_time=$(date +%s)
    
    log "🚀 Starting restore process: $(basename "$BACKUP_FILE")"
    
    # Confirmation
    confirm_restore
    
    # Extract backup
    local backup_dir=$(extract_backup "$BACKUP_FILE")
    
    # Verify backup if requested
    if [ "$VERIFY_BACKUP" = true ]; then
        verify_backup "$backup_dir"
    fi
    
    # Create pre-restore backup
    create_pre_restore_backup
    
    # Perform restore based on options
    if [ "$DATABASE_ONLY" = true ]; then
        restore_database "$backup_dir"
    elif [ "$FILES_ONLY" = true ]; then
        restore_application "$backup_dir"
    elif [ "$CONFIG_ONLY" = true ]; then
        restore_config "$backup_dir"
    else
        # Restore everything
        restore_database "$backup_dir"
        restore_application "$backup_dir"
        restore_config "$backup_dir"
    fi
    
    # Post-restore tasks
    post_restore_tasks
    
    local end_time=$(date +%s)
    
    # Generate report
    if [ "$DRY_RUN" = false ]; then
        generate_restore_report "$BACKUP_FILE" "$start_time" "$end_time"
    fi
    
    # Clean up extracted backup
    rm -rf "$backup_dir"
    
    if [ "$DRY_RUN" = true ]; then
        success "✅ Dry run completed successfully"
    else
        success "✅ Restore completed successfully"
    fi
    
    log "🎉 Restore process finished"
}

# Check if running as correct user
if [ "$EUID" -eq 0 ]; then
    error "This script should not be run as root"
fi

# Create necessary directories
mkdir -p "$BACKUP_BASE_DIR"
mkdir -p "$(dirname "$LOG_FILE")"

# Run main restore function
main "$@"
