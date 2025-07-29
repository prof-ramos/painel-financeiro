#!/bin/bash

# V0 Project - Server Setup Script
# Ubuntu 22.04 LTS Production Server Configuration

set -e

echo "🚀 Starting V0 Project Server Setup..."

# Update system packages
echo "📦 Updating system packages..."
sudo apt update && sudo apt upgrade -y

# Install essential packages
echo "🔧 Installing essential packages..."
sudo apt install -y curl wget git unzip software-properties-common apt-transport-https ca-certificates gnupg lsb-release

# Install Node.js 20.x
echo "📦 Installing Node.js 20.x..."
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
sudo apt install -y nodejs

# Verify Node.js installation
node_version=$(node --version)
npm_version=$(npm --version)
echo "✅ Node.js installed: $node_version"
echo "✅ NPM installed: $npm_version"

# Install PM2 globally
echo "🔄 Installing PM2 process manager..."
sudo npm install -g pm2

# Install PostgreSQL 14
echo "🗄️ Installing PostgreSQL 14..."
sudo apt install -y postgresql postgresql-contrib postgresql-client

# Start and enable PostgreSQL
sudo systemctl start postgresql
sudo systemctl enable postgresql

# Install Redis
echo "📊 Installing Redis..."
sudo apt install -y redis-server

# Configure Redis
sudo systemctl start redis-server
sudo systemctl enable redis-server

# Install Nginx
echo "🌐 Installing Nginx..."
sudo apt install -y nginx

# Start and enable Nginx
sudo systemctl start nginx
sudo systemctl enable nginx

# Install Certbot for SSL
echo "🔒 Installing Certbot for SSL certificates..."
sudo apt install -y certbot python3-certbot-nginx

# Create application user
echo "👤 Creating application user..."
sudo useradd -m -s /bin/bash v0app
sudo usermod -aG sudo v0app

# Create application directories
echo "📁 Creating application directories..."
sudo mkdir -p /var/www/v0-project
sudo mkdir -p /var/log/v0-project
sudo mkdir -p /var/backups/v0-project

# Set permissions
sudo chown -R v0app:v0app /var/www/v0-project
sudo chown -R v0app:v0app /var/log/v0-project
sudo chown -R v0app:v0app /var/backups/v0-project

# Configure firewall
echo "🔥 Configuring UFW firewall..."
sudo ufw allow OpenSSH
sudo ufw allow 'Nginx Full'
sudo ufw allow 5432/tcp  # PostgreSQL
sudo ufw allow 6379/tcp  # Redis
sudo ufw --force enable

# Install Docker (optional for containerized services)
echo "🐳 Installing Docker..."
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin

# Add v0app user to docker group
sudo usermod -aG docker v0app

# Configure system limits
echo "⚙️ Configuring system limits..."
sudo tee /etc/security/limits.conf << EOF
v0app soft nofile 65536
v0app hard nofile 65536
v0app soft nproc 32768
v0app hard nproc 32768
EOF

# Configure sysctl for better performance
sudo tee /etc/sysctl.d/99-v0-performance.conf << EOF
# Network performance tuning
net.core.somaxconn = 65535
net.core.netdev_max_backlog = 5000
net.ipv4.tcp_max_syn_backlog = 65535
net.ipv4.tcp_keepalive_time = 600
net.ipv4.tcp_keepalive_intvl = 60
net.ipv4.tcp_keepalive_probes = 10

# Memory management
vm.swappiness = 10
vm.dirty_ratio = 15
vm.dirty_background_ratio = 5

# File system
fs.file-max = 2097152
EOF

sudo sysctl -p /etc/sysctl.d/99-v0-performance.conf

# Install monitoring tools
echo "📊 Installing monitoring tools..."
sudo apt install -y htop iotop nethogs ncdu

# Create log rotation configuration
sudo tee /etc/logrotate.d/v0-project << EOF
/var/log/v0-project/*.log {
    daily
    missingok
    rotate 30
    compress
    delaycompress
    notifempty
    create 0644 v0app v0app
    postrotate
        pm2 reloadLogs
    endscript
}
EOF

echo "✅ Server setup completed successfully!"
echo "📋 Next steps:"
echo "   1. Configure PostgreSQL database"
echo "   2. Set up SSL certificates"
echo "   3. Deploy the application"
echo "   4. Configure monitoring"
