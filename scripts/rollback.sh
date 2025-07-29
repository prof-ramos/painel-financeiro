#!/bin/bash

# V0 Project - Rollback Script
# Quick rollback to previous deployment or specific commit

set -e

# Configuration
PROJECT_NAME="v0-project"
DEPLOY_USER="v0app"
DEPLOY_PATH="/var/www/v0-project"
BACKUP_PATH="/var/backups/v0-project"
LOG_FILE="/var/log/v0-project/rollback.log"

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
    echo "Usage: $0 [OPTIONS] [TARGET]"
    echo ""
    echo "Options:"
    echo "  --list             List available rollback targets"
    echo "  --commit HASH      Rollback to specific commit"
    echo "  --backup NAME      Rollback from backup"
    echo "  --previous         Rollback to previous deployment (default)"
    echo "  --force            Skip confirmation prompts"
    echo "  --dry-run          Show what would be done without executing"
    echo "  --help             Show this help message"
    echo ""
    echo "Examples:"
    echo "  $0                           # Rollback to previous commit"
    echo "  $0 --commit abc123           # Rollback to specific commit"
    echo "  $0 --backup 20240115-143022  # Rollback from backup"
    echo "  $0 --list                    # List available targets"
}

# Parse command line arguments
ROLLBACK_TYPE="previous"
TARGET=""
FORCE=false
DRY_RUN=false
LIST_TARGETS=false

while [[ $# -gt 0 ]]; do
    case $1 in
        --list)
            LIST_TARGETS=true
            shift
            ;;
        --commit)
            ROLLBACK_TYPE="commit"
            TARGET="$2"
            shift 2
            ;;
        --backup)
            ROLLBACK_TYPE="backup"
            TARGET="$2"
            shift 2
            ;;
        --previous)
            ROLLBACK_TYPE="previous"
            shift
            ;;
        --force)
            FORCE=true
            shift
            ;;
        --dry-run)
            DRY_RUN=true
            shift
            ;;
        --help)
            usage
            exit 0
            ;;
        *)
            error "Unknown option: $1"
            ;;
    esac
done

# Check if running as correct user
if [ "$USER" != "$DEPLOY_USER" ]; then
    error "This script must be run as $DEPLOY_USER user"
fi

# List available rollback targets
list_targets() {
    log "📋 Available rollback targets:"
    echo
    
    # Git commits
    echo -e "${BLUE}Recent Git Commits:${NC}"
    cd "$DEPLOY_PATH" 2>/dev/null || error "Cannot access deployment directory"
    git log --oneline -10 --decorate --graph || warning "Cannot access git history"
    echo
    
    # Available backups
    echo -e "${BLUE}Available Backups:${NC}"
    if [ -d "$BACKUP_PATH" ]; then
        find "$BACKUP_PATH" -name "*.tar.gz*" -type f -printf '%T@ %p\n' 2>/dev/null | \
            sort -nr | head -10 | \
            while read timestamp filepath; do
                local date_str=$(date -d @${timestamp%.*} '+%Y-%m-%d %H:%M:%S')
                local filename=$(basename "$filepath")
                echo "  $date_str - $filename"
            done
    else
        echo "  No backups found in $BACKUP_PATH"
    fi
    echo
    
    # Current deployment info
    echo -e "${BLUE}Current Deployment:${NC}"
    echo "  Commit: $(git rev-parse HEAD 2>/dev/null || echo 'unknown')"
    echo "  Branch: $(git branch --show-current 2>/dev/null || echo 'unknown')"
    echo "  Date: $(git log -1 --format=%cd 2>/dev/null || echo 'unknown')"
    echo "  PM2 Status: $(pm2 list | grep "$PROJECT_NAME" | awk '{print $10}' || echo 'unknown')"
}

# Get previous commit
get_previous_commit() {
    cd "$DEPLOY_PATH"
    local current_commit=$(git rev-parse HEAD)
    local previous_commit=$(git rev-parse HEAD~1 2>/dev/null)
    
    if [ -z "$previous_commit" ] || [ "$current_commit" = "$previous_commit" ]; then
        error "Cannot determine previous commit"
    fi
    
    echo "$previous_commit"
}

# Validate commit hash
validate_commit() {
    local commit_hash="$1"
    cd "$DEPLOY_PATH"
    
    if ! git cat-file -e "$commit_hash^{commit}" 2>/dev/null; then
        error "Invalid commit hash: $commit_hash"
    fi
    
    # Check if commit is different from current
    local current_commit=$(git rev-parse HEAD)
    if [ "$commit_hash" = "$current_commit" ]; then
        warning "Target commit is the same as current commit"
        return 1
    fi
    
    return 0
}

# Validate backup
validate_backup() {
    local backup_name="$1"
    local backup_file=""
    
    # Try different backup file extensions
    for ext in ".tar.gz" ".tar.gz.enc"; do
        if [ -f "$BACKUP_PATH/$backup_name$ext" ]; then
            backup_file="$BACKUP_PATH/$backup_name$ext"
            break
        fi
    done
    
    if [ -z "$backup_file" ]; then
        error "Backup not found: $backup_name"
    fi
    
    echo "$backup_file"
}

# Create pre-rollback backup
create_pre_rollback_backup() {
    if [ "$DRY_RUN" = true ]; then
        log "DRY RUN: Would create pre-rollback backup"
        return
    fi
    
    log "💾 Creating pre-rollback backup..."
    
    local backup_name="pre-rollback-$(date +%Y%m%d-%H%M%S)"
    local backup_script="$DEPLOY_PATH/scripts/backup.sh"
    
    if [ -f "$backup_script" ]; then
        "$backup_script" || warning "Failed to create pre-rollback backup"
    else
        warning "Backup script not found, skipping pre-rollback backup"
    fi
}

# Health check
health_check() {
    log "🏥 Performing health check..."
    
    local max_attempts=30
    local attempt=1
    
    while [ $attempt -le $max_attempts ]; do
        if curl -f -s http://localhost:3000/health > /dev/null; then
            success "Health check passed"
            return 0
        fi
        
        if [ $attempt -eq $max_attempts ]; then
            error "Health check failed after $max_attempts attempts"
        fi
        
        log "Health check attempt $attempt/$max_attempts failed, retrying in 2 seconds..."
        sleep 2
        ((attempt++))
    done
    
    return 1
}

# Rollback to commit
rollback_to_commit() {
    local target_commit="$1"
    
    log "🔄 Rolling back to commit: $target_commit"
    
    if [ "$DRY_RUN" = true ]; then
        log "DRY RUN: Would rollback to commit $target_commit"
        return
    fi
    
    cd "$DEPLOY_PATH"
    
    # Validate commit
    validate_commit "$target_commit" || return 1
    
    # Show commit info
    log "Target commit info:"
    git show --stat "$target_commit" | head -10
    
    # Checkout target commit
    git checkout "$target_commit" || error "Failed to checkout commit $target_commit"
    
    # Install dependencies
    log "📦 Installing dependencies..."
    npm ci --production || error "Failed to install dependencies"
    
    # Build application
    log "🔨 Building application..."
    npm run build || error "Failed to build application"
    
    # Restart application
    log "🔄 Restarting application..."
    pm2 restart "$PROJECT_NAME" || error "Failed to restart application"
    
    # Wait for application to start
    sleep 15
    
    # Health check
    health_check || error "Health check failed after rollback"
    
    success "✅ Successfully rolled back to commit: $target_commit"
}

# Rollback from backup
rollback_from_backup() {
    local backup_name="$1"
    
    log "🔄 Rolling back from backup: $backup_name"
    
    local backup_file=$(validate_backup "$backup_name")
    local restore_script="$DEPLOY_PATH/scripts/restore.sh"
    
    if [ ! -f "$restore_script" ]; then
        error "Restore script not found: $restore_script"
    fi
    
    if [ "$DRY_RUN" = true ]; then
        log "DRY RUN: Would restore from backup $backup_file"
        return
    fi
    
    # Run restore script
    if [ "$FORCE" = true ]; then
        "$restore_script" --force "$backup_file" || error "Failed to restore from backup"
    else
        "$restore_script" "$backup_file" || error "Failed to restore from backup"
    fi
    
    success "✅ Successfully rolled back from backup: $backup_name"
}

# Confirmation prompt
confirm_rollback() {
    if [ "$FORCE" = true ] || [ "$DRY_RUN" = true ]; then
        return
    fi
    
    echo
    echo "⚠️  WARNING: This will rollback the application and may cause downtime."
    echo
    echo "Rollback Details:"
    echo "  Type: $ROLLBACK_TYPE"
    echo "  Target: $TARGET"
    echo "  Current Status: $(pm2 list | grep "$PROJECT_NAME" | awk '{print $10}' || echo 'unknown')"
    echo
    read -p "Are you sure you want to continue? (y/N): " -n 1 -r
    echo
    
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        log "Rollback cancelled by user"
        exit 0
    fi
}

# Generate rollback report
generate_report() {
    local start_time="$1"
    local end_time="$2"
    local target="$3"
    
    local duration=$((end_time - start_time))
    
    cat > "$BACKUP_PATH/last-rollback-report.txt" << EOF
V0 Project Rollback Report
==========================

Rollback Type: $ROLLBACK_TYPE
Target: $target
Start Time: $(date -d @$start_time)
End Time: $(date -d @$end_time)
Duration: ${duration} seconds
Status: SUCCESS

Current State:
- Commit: $(cd "$DEPLOY_PATH" && git rev-parse HEAD 2>/dev/null || echo 'unknown')
- Branch: $(cd "$DEPLOY_PATH" && git branch --show-current 2>/dev/null || echo 'unknown')
- PM2 Status: $(pm2 list | grep "$PROJECT_NAME" | awk '{print $10}' || echo 'unknown')
- Health Check: $(curl -f -s http://localhost:3000/health > /dev/null && echo "PASSED" || echo "FAILED")

Options Used:
- Force: $FORCE
- Dry Run: $DRY_RUN

Pre-rollback backup created: $(ls -t "$BACKUP_PATH"/pre-rollback-* 2>/dev/null | head -1 | xargs basename 2>/dev/null || echo "none")
EOF

    log "📊 Rollback report generated"
}

# Main rollback function
main() {
    local start_time=$(date +%s)
    
    # Handle list targets request
    if [ "$LIST_TARGETS" = true ]; then
        list_targets
        exit 0
    fi
    
    log "🚀 Starting rollback process..."
    
    # Determine target based on rollback type
    case $ROLLBACK_TYPE in
        "previous")
            TARGET=$(get_previous_commit)
            log "Target: Previous commit ($TARGET)"
            ;;
        "commit")
            if [ -z "$TARGET" ]; then
                error "Commit hash is required for commit rollback"
            fi
            log "Target: Commit $TARGET"
            ;;
        "backup")
            if [ -z "$TARGET" ]; then
                error "Backup name is required for backup rollback"
            fi
            log "Target: Backup $TARGET"
            ;;
        *)
            error "Invalid rollback type: $ROLLBACK_TYPE"
            ;;
    esac
    
    # Confirmation
    confirm_rollback
    
    # Create pre-rollback backup
    create_pre_rollback_backup
    
    # Perform rollback based on type
    case $ROLLBACK_TYPE in
        "previous"|"commit")
            rollback_to_commit "$TARGET"
            ;;
        "backup")
            rollback_from_backup "$TARGET"
            ;;
    esac
    
    local end_time=$(date +%s)
    
    # Generate report
    if [ "$DRY_RUN" = false ]; then
        generate_report "$start_time" "$end_time" "$TARGET"
    fi
    
    if [ "$DRY_RUN" = true ]; then
        success "✅ Dry run completed successfully"
    else
        success "✅ Rollback completed successfully"
    fi
    
    log "🎉 Rollback process finished"
}

# Create necessary directories
mkdir -p "$BACKUP_PATH"
mkdir -p "$(dirname "$LOG_FILE")"

# Run main rollback function
main "$@"
