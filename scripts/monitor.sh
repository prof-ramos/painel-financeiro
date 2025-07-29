#!/bin/bash

# V0 Project - Monitoring Script
# Comprehensive monitoring with alerting and reporting

set -e

# Configuration
PROJECT_NAME="v0-project"
APP_DIR="/var/www/v0-project"
LOG_FILE="/var/log/v0-project/monitor.log"
ALERT_LOG="/var/log/v0-project/alerts.log"
METRICS_FILE="/var/log/v0-project/metrics.json"
SLACK_WEBHOOK="${SLACK_WEBHOOK_URL:-}"

# Thresholds
CPU_THRESHOLD=80
MEMORY_THRESHOLD=85
DISK_THRESHOLD=90
RESPONSE_TIME_THRESHOLD=5000  # milliseconds
ERROR_RATE_THRESHOLD=5        # percentage

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
    echo -e "${RED}[ERROR]${NC} $1" | tee -a "$LOG_FILE" | tee -a "$ALERT_LOG"
}

success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1" | tee -a "$LOG_FILE"
}

warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1" | tee -a "$LOG_FILE" | tee -a "$ALERT_LOG"
}

# Send alert notification
send_alert() {
    local severity="$1"
    local title="$2"
    local message="$3"
    local color="danger"
    
    case $severity in
        "warning") color="warning" ;;
        "info") color="good" ;;
    esac
    
    # Log alert
    echo "[$(date +'%Y-%m-%d %H:%M:%S')] [$severity] $title: $message" >> "$ALERT_LOG"
    
    # Send Slack notification
    if [ -n "$SLACK_WEBHOOK" ]; then
        curl -X POST -H 'Content-type: application/json' \
            --data "{
                \"attachments\": [{
                    \"color\": \"$color\",
                    \"title\": \"🚨 V0 Project Alert - $title\",
                    \"text\": \"$message\",
                    \"fields\": [
                        {
                            \"title\": \"Severity\",
                            \"value\": \"$severity\",
                            \"short\": true
                        },
                        {
                            \"title\": \"Server\",
                            \"value\": \"$(hostname)\",
                            \"short\": true
                        }
                    ],
                    \"footer\": \"V0 Project Monitor\",
                    \"ts\": $(date +%s)
                }]
            }" \
            "$SLACK_WEBHOOK" > /dev/null 2>&1 || true
    fi
}

# Check system resources
check_system_resources() {
    log "📊 Checking system resources..."
    
    # CPU usage
    local cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print $2}' | sed 's/%us,//')
    cpu_usage=${cpu_usage%.*}  # Remove decimal part
    
    if [ "$cpu_usage" -gt "$CPU_THRESHOLD" ]; then
        send_alert "critical" "High CPU Usage" "CPU usage is ${cpu_usage}% (threshold: ${CPU_THRESHOLD}%)"
    fi
    
    # Memory usage
    local memory_info=$(free | grep Mem)
    local total_memory=$(echo $memory_info | awk '{print $2}')
    local used_memory=$(echo $memory_info | awk '{print $3}')
    local memory_usage=$((used_memory * 100 / total_memory))
    
    if [ "$memory_usage" -gt "$MEMORY_THRESHOLD" ]; then
        send_alert "critical" "High Memory Usage" "Memory usage is ${memory_usage}% (threshold: ${MEMORY_THRESHOLD}%)"
    fi
    
    # Disk usage
    local disk_usage=$(df "$APP_DIR" | awk 'NR==2 {print $5}' | sed 's/%//')
    
    if [ "$disk_usage" -gt "$DISK_THRESHOLD" ]; then
        send_alert "critical" "High Disk Usage" "Disk usage is ${disk_usage}% (threshold: ${DISK_THRESHOLD}%)"
    fi
    
    # Store metrics
    local timestamp=$(date -Iseconds)
    echo "{\"timestamp\":\"$timestamp\",\"cpu\":$cpu_usage,\"memory\":$memory_usage,\"disk\":$disk_usage}" >> "$METRICS_FILE"
    
    log "System resources: CPU: ${cpu_usage}%, Memory: ${memory_usage}%, Disk: ${disk_usage}%"
}

# Check application health
check_application_health() {
    log "🏥 Checking application health..."
    
    # Check if PM2 process is running
    if ! pm2 list | grep -q "$PROJECT_NAME.*online"; then
        send_alert "critical" "Application Down" "PM2 process $PROJECT_NAME is not running"
        return 1
    fi
    
    # Check HTTP response
    local start_time=$(date +%s%3N)
    local http_status=$(curl -s -o /dev/null -w "%{http_code}" http://localhost:3000/health || echo "000")
    local end_time=$(date +%s%3N)
    local response_time=$((end_time - start_time))
    
    if [ "$http_status" != "200" ]; then
        send_alert "critical" "Application Unhealthy" "Health check returned HTTP $http_status"
        return 1
    fi
    
    if [ "$response_time" -gt "$RESPONSE_TIME_THRESHOLD" ]; then
        send_alert "warning" "Slow Response Time" "Health check took ${response_time}ms (threshold: ${RESPONSE_TIME_THRESHOLD}ms)"
    fi
    
    log "Application health: HTTP $http_status, Response time: ${response_time}ms"
    return 0
}

# Check database connectivity
check_database() {
    log "🗄️ Checking database connectivity..."
    
    # Check PostgreSQL service
    if ! systemctl is-active --quiet postgresql; then
        send_alert "critical" "Database Service Down" "PostgreSQL service is not running"
        return 1
    fi
    
    # Check database connection
    export PGPASSWORD="${DATABASE_PASSWORD:-}"
    if ! pg_isready -h localhost -p 5432 -U v0_user > /dev/null 2>&1; then
        send_alert "critical" "Database Connection Failed" "Cannot connect to PostgreSQL database"
        unset PGPASSWORD
        return 1
    fi
    
    # Check database query performance
    local start_time=$(date +%s%3N)
    psql -h localhost -U v0_user -d v0_tactical_db -c "SELECT 1;" > /dev/null 2>&1
    local end_time=$(date +%s%3N)
    local query_time=$((end_time - start_time))
    
    unset PGPASSWORD
    
    if [ "$query_time" -gt 1000 ]; then  # 1 second
        send_alert "warning" "Slow Database Query" "Database query took ${query_time}ms"
    fi
    
    log "Database: Connected, Query time: ${query_time}ms"
    return 0
}

# Check SSL certificate
check_ssl_certificate() {
    log "🔒 Checking SSL certificate..."
    
    local domain="your-domain.com"  # Replace with your actual domain
    local cert_file="/etc/letsencrypt/live/$domain/cert.pem"
    
    if [ ! -f "$cert_file" ]; then
        warning "SSL certificate file not found: $cert_file"
        return 1
    fi
    
    # Check certificate expiration
    local expiry_date=$(openssl x509 -enddate -noout -in "$cert_file" | cut -d= -f2)
    local expiry_timestamp=$(date -d "$expiry_date" +%s)
    local current_timestamp=$(date +%s)
    local days_until_expiry=$(( (expiry_timestamp - current_timestamp) / 86400 ))
    
    if [ "$days_until_expiry" -lt 7 ]; then
        send_alert "critical" "SSL Certificate Expiring" "SSL certificate expires in $days_until_expiry days"
    elif [ "$days_until_expiry" -lt 30 ]; then
        send_alert "warning" "SSL Certificate Expiring Soon" "SSL certificate expires in $days_until_expiry days"
    fi
    
    log "SSL certificate: Valid, expires in $days_until_expiry days"
    return 0
}

# Check log files for errors
check_error_logs() {
    log "📋 Checking error logs..."
    
    local error_log="/var/log/v0-project/error.log"
    local nginx_error_log="/var/log/nginx/v0-error.log"
    
    # Check application error logs (last 5 minutes)
    if [ -f "$error_log" ]; then
        local recent_errors=$(find "$error_log" -newermt "5 minutes ago" -exec grep -c "ERROR\|FATAL" {} \; 2>/dev/null || echo "0")
        
        if [ "$recent_errors" -gt 10 ]; then
            send_alert "warning" "High Error Rate" "Found $recent_errors errors in the last 5 minutes"
        fi
    fi
    
    # Check Nginx error logs
    if [ -f "$nginx_error_log" ]; then
        local nginx_errors=$(tail -n 100 "$nginx_error_log" | grep "$(date '+%Y/%m/%d %H:%M')" | wc -l)
        
        if [ "$nginx_errors" -gt 5 ]; then
            send_alert "warning" "Nginx Errors" "Found $nginx_errors Nginx errors in the last minute"
        fi
    fi
    
    log "Error logs: Application errors: $recent_errors, Nginx errors: $nginx_errors"
}

# Check disk space for critical directories
check_disk_space() {
    log "💾 Checking disk space..."
    
    local critical_dirs=("/" "/var" "/var/log" "/var/backups")
    
    for dir in "${critical_dirs[@]}"; do
        if [ -d "$dir" ]; then
            local usage=$(df "$dir" | awk 'NR==2 {print $5}' | sed 's/%//')
            
            if [ "$usage" -gt 95 ]; then
                send_alert "critical" "Critical Disk Space" "$dir is ${usage}% full"
            elif [ "$usage" -gt 85 ]; then
                send_alert "warning" "Low Disk Space" "$dir is ${usage}% full"
            fi
        fi
    done
}

# Check network connectivity
check_network() {
    log "🌐 Checking network connectivity..."
    
    # Check external connectivity
    if ! ping -c 1 8.8.8.8 > /dev/null 2>&1; then
        send_alert "critical" "Network Connectivity Lost" "Cannot reach external networks"
        return 1
    fi
    
    # Check DNS resolution
    if ! nslookup google.com > /dev/null 2>&1; then
        send_alert "warning" "DNS Resolution Issues" "DNS resolution is not working properly"
    fi
    
    log "Network: Connected"
    return 0
}

# Check backup status
check_backup_status() {
    log "💾 Checking backup status..."
    
    local backup_dir="/var/backups/v0-project"
    local latest_backup=$(find "$backup_dir" -name "*.tar.gz*" -type f -printf '%T@ %p\n' 2>/dev/null | sort -n | tail -1 | cut -d' ' -f2-)
    
    if [ -z "$latest_backup" ]; then
        send_alert "warning" "No Backups Found" "No backup files found in $backup_dir"
        return 1
    fi
    
    # Check backup age
    local backup_age=$(find "$latest_backup" -mtime +1 2>/dev/null | wc -l)
    
    if [ "$backup_age" -gt 0 ]; then
        send_alert "warning" "Backup Outdated" "Latest backup is older than 24 hours"
    fi
    
    log "Backup: Latest backup found: $(basename "$latest_backup")"
    return 0
}

# Generate monitoring report
generate_report() {
    local timestamp=$(date -Iseconds)
    local report_file="/var/log/v0-project/monitor-report-$(date +%Y%m%d).json"
    
    # Get system info
    local uptime=$(uptime -p)
    local load_avg=$(uptime | awk -F'load average:' '{print $2}')
    local memory_info=$(free -h | grep Mem | awk '{print "Total: "$2", Used: "$3", Free: "$4}')
    local disk_info=$(df -h "$APP_DIR" | awk 'NR==2 {print "Total: "$2", Used: "$3", Available: "$4", Usage: "$5}')
    
    # Create report
    cat > "$report_file" << EOF
{
    "timestamp": "$timestamp",
    "system": {
        "uptime": "$uptime",
        "load_average": "$load_avg",
        "memory": "$memory_info",
        "disk": "$disk_info"
    },
    "application": {
        "status": "$(pm2 list | grep "$PROJECT_NAME" | awk '{print $10}' || echo 'unknown')",
        "pid": "$(pm2 list | grep "$PROJECT_NAME" | awk '{print $6}' || echo 'unknown')",
        "uptime": "$(pm2 list | grep "$PROJECT_NAME" | awk '{print $11}' || echo 'unknown')",
        "restarts": "$(pm2 list | grep "$PROJECT_NAME" | awk '{print $9}' || echo 'unknown')"
    },
    "database": {
        "status": "$(systemctl is-active postgresql)",
        "connections": "$(sudo -u postgres psql -c "SELECT count(*) FROM pg_stat_activity;" -t 2>/dev/null | xargs || echo 'unknown')"
    },
    "checks_performed": [
        "system_resources",
        "application_health",
        "database_connectivity",
        "ssl_certificate",
        "error_logs",
        "disk_space",
        "network_connectivity",
        "backup_status"
    ]
}
EOF
    
    log "📊 Monitoring report generated: $report_file"
}

# Main monitoring function
main() {
    log "🚀 Starting monitoring checks..."
    
    local failed_checks=0
    
    # Run all checks
    check_system_resources || ((failed_checks++))
    check_application_health || ((failed_checks++))
    check_database || ((failed_checks++))
    check_ssl_certificate || ((failed_checks++))
    check_error_logs || ((failed_checks++))
    check_disk_space || ((failed_checks++))
    check_network || ((failed_checks++))
    check_backup_status || ((failed_checks++))
    
    # Generate report
    generate_report
    
    # Summary
    if [ "$failed_checks" -eq 0 ]; then
        success "✅ All monitoring checks passed"
        send_alert "info" "Monitoring Complete" "All system checks passed successfully"
    else
        warning "⚠️ $failed_checks monitoring checks failed"
        send_alert "warning" "Monitoring Issues" "$failed_checks system checks failed"
    fi
    
    log "🎉 Monitoring checks completed"
}

# Parse command line arguments
case "${1:-}" in
    --system)
        check_system_resources
        ;;
    --app)
        check_application_health
        ;;
    --database)
        check_database
        ;;
    --ssl)
        check_ssl_certificate
        ;;
    --logs)
        check_error_logs
        ;;
    --disk)
        check_disk_space
        ;;
    --network)
        check_network
        ;;
    --backup)
        check_backup_status
        ;;
    --report)
        generate_report
        ;;
    --help)
        echo "Usage: $0 [OPTION]"
        echo ""
        echo "Options:"
        echo "  --system     Check system resources only"
        echo "  --app        Check application health only"
        echo "  --database   Check database connectivity only"
        echo "  --ssl        Check SSL certificate only"
        echo "  --logs       Check error logs only"
        echo "  --disk       Check disk space only"
        echo "  --network    Check network connectivity only"
        echo "  --backup     Check backup status only"
        echo "  --report     Generate monitoring report only"
        echo "  --help       Show this help message"
        echo ""
        echo "If no option is provided, all checks will be performed."
        ;;
    *)
        main
        ;;
esac
