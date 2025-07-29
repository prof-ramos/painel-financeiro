#!/bin/bash

# V0 Project - Backup Script
# Comprehensive backup solution with encryption and rotation

set -e

# Configuration
PROJECT_NAME="v0-project"
BACKUP_BASE_DIR="/var/backups/v0-project"
APP_DIR="/var/www/v0-project"
LOG_FILE="/var/log/v0-project/backup.log"
RETENTION_DAYS=30
ENCRYPTION_KEY="${BACKUP_ENCRYPTION_KEY:-}"
SLACK_WEBHOOK="${SLACK_WEBHOOK_URL:-}"

# Database configuration
DB_HOST="localhost"
DB_PORT="5432"
DB_NAME="v0_tactical_db"
DB_USER="v0_user"
DB_PASSWORD="${DATABASE_PASSWORD:-}"

# S3 configuration (optional)
S3_BUCKET="${BACKUP_S3_BUCKET:-}"
S3_REGION="${BACKUP_S3_REGION:-us-east-1}"
AWS_ACCESS_KEY_ID="${AWS_ACCESS_KEY_ID:-}"
AWS_SECRET_ACCESS_KEY="${AWS_SECRET_ACCESS_KEY:-}"

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
    send_notification "❌ Backup Failed" "$1" "danger"
    exit 1
}

success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1" | tee -a "$LOG_FILE"
}

warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1" | tee -a "$LOG_FILE"
}

# Send Slack notification
send_notification() {
    local title="$1"
    local message="$2"
    local color="${3:-good}"
    
    if [ -n "$SLACK_WEBHOOK" ]; then
        curl -X POST -H 'Content-type: application/json' \
            --data "{
                \"attachments\": [{
                    \"color\": \"$color\",
                    \"title\": \"$title\",
                    \"text\": \"$message\",
                    \"footer\": \"V0 Project Backup\",
                    \"ts\": $(date +%s)
                }]
            }" \
            "$SLACK_WEBHOOK" > /dev/null 2>&1 || true
    fi
}

# Create backup directory structure
create_backup_structure() {
    local backup_date="$1"
    local backup_dir="$BACKUP_BASE_DIR/$backup_date"
    
    mkdir -p "$backup_dir"/{database,application,logs,config}
    echo "$backup_dir"
}

# Backup database
backup_database() {
    local backup_dir="$1"
    local db_backup_file="$backup_dir/database/database.sql"
    
    log "📊 Backing up database..."
    
    # Set password for pg_dump
    export PGPASSWORD="$DB_PASSWORD"
    
    # Create database backup
    pg_dump -h "$DB_HOST" -p "$DB_PORT" -U "$DB_USER" -d "$DB_NAME" \
        --verbose --clean --if-exists --create \
        > "$db_backup_file" || error "Failed to backup database"
    
    # Compress database backup
    gzip "$db_backup_file" || error "Failed to compress database backup"
    
    # Get backup size
    local backup_size=$(du -h "$db_backup_file.gz" | cut -f1)
    log "Database backup completed: $backup_size"
    
    # Unset password
    unset PGPASSWORD
}

# Backup application files
backup_application() {
    local backup_dir="$1"
    local app_backup_file="$backup_dir/application/app-files.tar.gz"
    
    log "📁 Backing up application files..."
    
    # Create application backup excluding unnecessary files
    tar -czf "$app_backup_file" \
        -C "$APP_DIR" \
        --exclude='node_modules' \
        --exclude='.git' \
        --exclude='.next' \
        --exclude='logs' \
        --exclude='*.log' \
        --exclude='uploads/temp' \
        . || error "Failed to backup application files"
    
    local backup_size=$(du -h "$app_backup_file" | cut -f1)
    log "Application backup completed: $backup_size"
}

# Backup logs
backup_logs() {
    local backup_dir="$1"
    local logs_backup_file="$backup_dir/logs/logs.tar.gz"
    
    log "📋 Backing up logs..."
    
    if [ -d "/var/log/v0-project" ]; then
        tar -czf "$logs_backup_file" \
            -C "/var/log" \
            "v0-project" || warning "Failed to backup logs"
        
        local backup_size=$(du -h "$logs_backup_file" | cut -f1)
        log "Logs backup completed: $backup_size"
    else
        warning "Logs directory not found, skipping logs backup"
    fi
}

# Backup configuration files
backup_config() {
    local backup_dir="$1"
    local config_backup_file="$backup_dir/config/config.tar.gz"
    
    log "⚙️ Backing up configuration files..."
    
    # Create temporary directory for config files
    local temp_config_dir=$(mktemp -d)
    
    # Copy configuration files
    cp "$APP_DIR/.env.local" "$temp_config_dir/" 2>/dev/null || true
    cp "$APP_DIR/ecosystem.config.js" "$temp_config_dir/" 2>/dev/null || true
    cp "/etc/nginx/sites-available/v0-project" "$temp_config_dir/nginx.conf" 2>/dev/null || true
    
    # PM2 configuration
    pm2 save > /dev/null 2>&1 || true
    cp ~/.pm2/dump.pm2 "$temp_config_dir/" 2>/dev/null || true
    
    # Create config backup
    if [ "$(ls -A $temp_config_dir)" ]; then
        tar -czf "$config_backup_file" -C "$temp_config_dir" . || warning "Failed to backup configuration"
        local backup_size=$(du -h "$config_backup_file" | cut -f1)
        log "Configuration backup completed: $backup_size"
    else
        warning "No configuration files found to backup"
    fi
    
    # Clean up temporary directory
    rm -rf "$temp_config_dir"
}

# Encrypt backup
encrypt_backup() {
    local backup_dir="$1"
    
    if [ -n "$ENCRYPTION_KEY" ]; then
        log "🔒 Encrypting backup..."
        
        # Create encrypted archive
        local encrypted_file="$backup_dir.tar.gz.enc"
        tar -czf - -C "$BACKUP_BASE_DIR" "$(basename "$backup_dir")" | \
            openssl enc -aes-256-cbc -salt -k "$ENCRYPTION_KEY" > "$encrypted_file" || \
            error "Failed to encrypt backup"
        
        # Remove unencrypted backup
        rm -rf "$backup_dir"
        
        local backup_size=$(du -h "$encrypted_file" | cut -f1)
        log "Backup encrypted: $backup_size"
        
        echo "$encrypted_file"
    else
        # Just compress the backup
        local compressed_file="$backup_dir.tar.gz"
        tar -czf "$compressed_file" -C "$BACKUP_BASE_DIR" "$(basename "$backup_dir")" || \
            error "Failed to compress backup"
        
        rm -rf "$backup_dir"
        
        local backup_size=$(du -h "$compressed_file" | cut -f1)
        log "Backup compressed: $backup_size"
        
        echo "$compressed_file"
    fi
}

# Upload to S3 (optional)
upload_to_s3() {
    local backup_file="$1"
    
    if [ -n "$S3_BUCKET" ] && [ -n "$AWS_ACCESS_KEY_ID" ] && [ -n "$AWS_SECRET_ACCESS_KEY" ]; then
        log "☁️ Uploading backup to S3..."
        
        # Install AWS CLI if not present
        if ! command -v aws &> /dev/null; then
            warning "AWS CLI not found, skipping S3 upload"
            return
        fi
        
        # Upload to S3
        aws s3 cp "$backup_file" "s3://$S3_BUCKET/v0-project-backups/" \
            --region "$S3_REGION" || warning "Failed to upload backup to S3"
        
        success "Backup uploaded to S3"
    fi
}

# Clean old backups
cleanup_old_backups() {
    log "🧹 Cleaning up old backups..."
    
    # Remove local backups older than retention period
    find "$BACKUP_BASE_DIR" -name "*.tar.gz*" -type f -mtime +$RETENTION_DAYS -delete || true
    
    # Clean up S3 backups if configured
    if [ -n "$S3_BUCKET" ] && command -v aws &> /dev/null; then
        local cutoff_date=$(date -d "$RETENTION_DAYS days ago" +%Y-%m-%d)
        aws s3 ls "s3://$S3_BUCKET/v0-project-backups/" | \
            awk '$1 < "'$cutoff_date'" {print $4}' | \
            while read -r file; do
                aws s3 rm "s3://$S3_BUCKET/v0-project-backups/$file" || true
            done
    fi
    
    log "Old backups cleaned up"
}

# Generate backup report
generate_report() {
    local backup_file="$1"
    local start_time="$2"
    local end_time="$3"
    
    local duration=$((end_time - start_time))
    local backup_size=$(du -h "$backup_file" | cut -f1)
    local backup_name=$(basename "$backup_file")
    
    cat > "$BACKUP_BASE_DIR/last-backup-report.txt" << EOF
V0 Project Backup Report
========================

Backup Name: $backup_name
Backup Size: $backup_size
Start Time: $(date -d @$start_time)
End Time: $(date -d @$end_time)
Duration: ${duration} seconds
Status: SUCCESS

Components Backed Up:
- Database (PostgreSQL)
- Application Files
- Configuration Files
- Log Files

Backup Location: $backup_file
$([ -n "$S3_BUCKET" ] && echo "S3 Location: s3://$S3_BUCKET/v0-project-backups/")

Next Backup: $(date -d "tomorrow" +"%Y-%m-%d %H:%M:%S")
EOF

    log "📊 Backup report generated"
}

# Main backup function
main() {
    local start_time=$(date +%s)
    local backup_date=$(date +%Y%m%d-%H%M%S)
    
    log "🚀 Starting backup process: $backup_date"
    send_notification "🔄 Backup Started" "Starting backup process for V0 Project" "warning"
    
    # Create backup directory structure
    local backup_dir=$(create_backup_structure "$backup_date")
    
    # Perform backups
    backup_database "$backup_dir"
    backup_application "$backup_dir"
    backup_logs "$backup_dir"
    backup_config "$backup_dir"
    
    # Create backup manifest
    cat > "$backup_dir/manifest.json" << EOF
{
    "backup_date": "$backup_date",
    "created_at": "$(date -Iseconds)",
    "project_name": "$PROJECT_NAME",
    "git_commit": "$(cd "$APP_DIR" 2>/dev/null && git rev-parse HEAD 2>/dev/null || echo 'unknown')",
    "node_version": "$(node --version)",
    "database_name": "$DB_NAME",
    "encrypted": $([ -n "$ENCRYPTION_KEY" ] && echo "true" || echo "false")
}
EOF
    
    # Encrypt/compress backup
    local final_backup_file=$(encrypt_backup "$backup_dir")
    
    # Upload to S3 if configured
    upload_to_s3 "$final_backup_file"
    
    # Clean up old backups
    cleanup_old_backups
    
    local end_time=$(date +%s)
    
    # Generate report
    generate_report "$final_backup_file" "$start_time" "$end_time"
    
    success "✅ Backup completed successfully: $(basename "$final_backup_file")"
    send_notification "✅ Backup Completed" "Backup completed successfully: $(basename "$final_backup_file")" "good"
    
    log "🎉 Backup process finished"
}

# Check if running as correct user
if [ "$EUID" -eq 0 ]; then
    error "This script should not be run as root"
fi

# Create necessary directories
mkdir -p "$BACKUP_BASE_DIR"
mkdir -p "$(dirname "$LOG_FILE")"

# Run main backup function
main "$@"
