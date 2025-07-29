#!/bin/bash

# V0 Project - Deployment Script
# Automated deployment with rollback capability

set -e

# Configuration
PROJECT_NAME="v0-project"
DEPLOY_USER="v0app"
DEPLOY_PATH="/var/www/v0-project"
BACKUP_PATH="/var/backups/v0-project"
LOG_FILE="/var/log/v0-project/deploy.log"
REPO_URL="https://github.com/your-username/v0-project.git"
BRANCH="main"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

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

# Check if running as correct user
if [ "$USER" != "$DEPLOY_USER" ]; then
    error "This script must be run as $DEPLOY_USER user"
fi

# Parse command line arguments
FORCE_DEPLOY=false
SKIP_TESTS=false
ROLLBACK=false
TARGET_COMMIT=""

while [[ $# -gt 0 ]]; do
    case $1 in
        --force)
            FORCE_DEPLOY=true
            shift
            ;;
        --skip-tests)
            SKIP_TESTS=true
            shift
            ;;
        --rollback)
            ROLLBACK=true
            TARGET_COMMIT="$2"
            shift 2
            ;;
        *)
            error "Unknown option: $1"
            ;;
    esac
done

# Rollback function
rollback() {
    local commit_hash="$1"
    log "🔄 Starting rollback to commit: $commit_hash"
    
    cd "$DEPLOY_PATH"
    
    # Verify commit exists
    if ! git cat-file -e "$commit_hash^{commit}" 2>/dev/null; then
        error "Commit $commit_hash does not exist"
    fi
    
    # Create backup of current state
    local backup_name="pre-rollback-$(date +%Y%m%d-%H%M%S)"
    create_backup "$backup_name"
    
    # Checkout target commit
    git checkout "$commit_hash" || error "Failed to checkout commit $commit_hash"
    
    # Install dependencies
    npm ci --production || error "Failed to install dependencies"
    
    # Build application
    npm run build || error "Failed to build application"
    
    # Restart application
    pm2 restart "$PROJECT_NAME" || error "Failed to restart application"
    
    # Wait for application to start
    sleep 10
    
    # Health check
    if ! health_check; then
        error "Health check failed after rollback"
    fi
    
    success "✅ Rollback completed successfully"
    exit 0
}

# Health check function
health_check() {
    log "🏥 Performing health check..."
    
    local max_attempts=30
    local attempt=1
    
    while [ $attempt -le $max_attempts ]; do
        if curl -f -s http://localhost:3000/health > /dev/null; then
            success "Health check passed"
            return 0
        fi
        
        log "Health check attempt $attempt/$max_attempts failed, retrying in 2 seconds..."
        sleep 2
        ((attempt++))
    done
    
    error "Health check failed after $max_attempts attempts"
    return 1
}

# Create backup function
create_backup() {
    local backup_name="${1:-$(date +%Y%m%d-%H%M%S)}"
    local backup_dir="$BACKUP_PATH/$backup_name"
    
    log "📦 Creating backup: $backup_name"
    
    mkdir -p "$backup_dir"
    
    # Backup application files
    if [ -d "$DEPLOY_PATH" ]; then
        tar -czf "$backup_dir/app-files.tar.gz" -C "$DEPLOY_PATH" . || warning "Failed to backup application files"
    fi
    
    # Backup database
    if command -v pg_dump &> /dev/null; then
        pg_dump -h localhost -U v0_user v0_tactical_db > "$backup_dir/database.sql" || warning "Failed to backup database"
    fi
    
    # Backup PM2 configuration
    pm2 save || warning "Failed to save PM2 configuration"
    cp ~/.pm2/dump.pm2 "$backup_dir/pm2-dump.pm2" 2>/dev/null || warning "Failed to backup PM2 dump"
    
    # Create backup manifest
    cat > "$backup_dir/manifest.json" << EOF
{
    "backup_name": "$backup_name",
    "created_at": "$(date -Iseconds)",
    "git_commit": "$(cd "$DEPLOY_PATH" 2>/dev/null && git rev-parse HEAD 2>/dev/null || echo 'unknown')",
    "node_version": "$(node --version)",
    "npm_version": "$(npm --version)"
}
EOF
    
    success "Backup created: $backup_dir"
}

# Pre-deployment checks
pre_deployment_checks() {
    log "🔍 Running pre-deployment checks..."
    
    # Check disk space
    local available_space=$(df "$DEPLOY_PATH" | awk 'NR==2 {print $4}')
    if [ "$available_space" -lt 1048576 ]; then # Less than 1GB
        error "Insufficient disk space. Available: ${available_space}KB"
    fi
    
    # Check memory
    local available_memory=$(free -m | awk 'NR==2{printf "%.0f", $7}')
    if [ "$available_memory" -lt 512 ]; then
        warning "Low available memory: ${available_memory}MB"
    fi
    
    # Check if PM2 is running
    if ! pm2 list > /dev/null 2>&1; then
        error "PM2 is not running or not accessible"
    fi
    
    # Check database connectivity
    if ! pg_isready -h localhost -p 5432 -U v0_user > /dev/null 2>&1; then
        error "Database is not accessible"
    fi
    
    success "Pre-deployment checks passed"
}

# Main deployment function
deploy() {
    log "🚀 Starting deployment of $PROJECT_NAME"
    
    # Pre-deployment checks
    pre_deployment_checks
    
    # Create backup before deployment
    create_backup "pre-deploy-$(date +%Y%m%d-%H%M%S)"
    
    # Clone or update repository
    if [ ! -d "$DEPLOY_PATH/.git" ]; then
        log "📥 Cloning repository..."
        git clone "$REPO_URL" "$DEPLOY_PATH" || error "Failed to clone repository"
        cd "$DEPLOY_PATH"
    else
        log "📥 Updating repository..."
        cd "$DEPLOY_PATH"
        git fetch origin || error "Failed to fetch from origin"
    fi
    
    # Get current commit for rollback reference
    local previous_commit=$(git rev-parse HEAD 2>/dev/null || echo "")
    
    # Checkout target branch
    git checkout "$BRANCH" || error "Failed to checkout branch $BRANCH"
    git pull origin "$BRANCH" || error "Failed to pull latest changes"
    
    local current_commit=$(git rev-parse HEAD)
    log "📝 Deploying commit: $current_commit"
    
    # Install dependencies
    log "📦 Installing dependencies..."
    npm ci --production || error "Failed to install dependencies"
    
    # Run tests (unless skipped)
    if [ "$SKIP_TESTS" = false ]; then
        log "🧪 Running tests..."
        npm test || error "Tests failed"
    else
        warning "Skipping tests as requested"
    fi
    
    # Build application
    log "🔨 Building application..."
    npm run build || error "Failed to build application"
    
    # Database migrations (if any)
    if [ -f "scripts/migrate.sh" ]; then
        log "🗄️ Running database migrations..."
        ./scripts/migrate.sh || error "Database migration failed"
    fi
    
    # Update PM2 configuration
    if [ -f "ecosystem.config.js" ]; then
        log "🔄 Updating PM2 configuration..."
        pm2 startOrRestart ecosystem.config.js --update-env || error "Failed to update PM2 configuration"
    else
        # Restart existing PM2 process
        if pm2 list | grep -q "$PROJECT_NAME"; then
            log "🔄 Restarting PM2 process..."
            pm2 restart "$PROJECT_NAME" || error "Failed to restart PM2 process"
        else
            log "🚀 Starting new PM2 process..."
            pm2 start npm --name "$PROJECT_NAME" -- start || error "Failed to start PM2 process"
        fi
    fi
    
    # Wait for application to start
    log "⏳ Waiting for application to start..."
    sleep 15
    
    # Health check
    if ! health_check; then
        warning "Health check failed, attempting rollback..."
        if [ -n "$previous_commit" ]; then
            rollback "$previous_commit"
        else
            error "Health check failed and no previous commit available for rollback"
        fi
    fi
    
    # Reload Nginx configuration
    log "🌐 Reloading Nginx configuration..."
    sudo nginx -t && sudo systemctl reload nginx || warning "Failed to reload Nginx"
    
    # Save PM2 configuration
    pm2 save || warning "Failed to save PM2 configuration"
    
    # Clean up old backups (keep last 10)
    log "🧹 Cleaning up old backups..."
    find "$BACKUP_PATH" -maxdepth 1 -type d -name "*-*" | sort -r | tail -n +11 | xargs rm -rf 2>/dev/null || true
    
    success "✅ Deployment completed successfully!"
    log "📊 Deployment summary:"
    log "   - Commit: $current_commit"
    log "   - Branch: $BRANCH"
    log "   - Build time: $(date)"
    log "   - Application URL: https://your-domain.com"
}

# Handle rollback request
if [ "$ROLLBACK" = true ]; then
    if [ -z "$TARGET_COMMIT" ]; then
        error "Rollback requires a target commit hash"
    fi
    rollback "$TARGET_COMMIT"
fi

# Main deployment
deploy

log "🎉 Deployment process completed!"
