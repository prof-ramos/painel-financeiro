// V0 Project - PM2 Ecosystem Configuration
// Production-ready process management configuration

module.exports = {
  apps: [
    {
      // Main application
      name: "v0-project",
      script: "npm",
      args: "start",
      cwd: "/var/www/v0-project",
      instances: "max", // Use all available CPU cores
      exec_mode: "cluster",

      // Environment variables
      env: {
        NODE_ENV: "production",
        PORT: 3000,
        NEXT_TELEMETRY_DISABLED: 1,
      },

      // Memory and CPU management
      max_memory_restart: "1G",
      min_uptime: "10s",
      max_restarts: 10,

      // Logging configuration
      log_file: "/var/log/v0-project/combined.log",
      out_file: "/var/log/v0-project/out.log",
      error_file: "/var/log/v0-project/error.log",
      log_date_format: "YYYY-MM-DD HH:mm:ss Z",
      merge_logs: true,

      // Process monitoring
      watch: false, // Disable in production
      ignore_watch: ["node_modules", ".next", "logs", "*.log"],

      // Restart configuration
      restart_delay: 4000,
      autorestart: true,

      // Health monitoring
      health_check_grace_period: 3000,
      health_check_fatal_exceptions: true,

      // Advanced PM2 features
      instance_var: "INSTANCE_ID",
      source_map_support: true,

      // Kill timeout
      kill_timeout: 5000,

      // Listen timeout
      listen_timeout: 8000,

      // Graceful shutdown
      shutdown_with_message: true,

      // Node.js specific options
      node_args: ["--max-old-space-size=1024", "--optimize-for-size"],

      // Environment specific configuration
      env_production: {
        NODE_ENV: "production",
        PORT: 3000,
        INSTANCE_ID: 0,
      },

      env_staging: {
        NODE_ENV: "staging",
        PORT: 3000,
        INSTANCE_ID: 0,
      },
    },

    // Background worker for scheduled tasks
    {
      name: "v0-worker",
      script: "./scripts/worker.js",
      cwd: "/var/www/v0-project",
      instances: 1,
      exec_mode: "fork",

      env: {
        NODE_ENV: "production",
        WORKER_TYPE: "scheduler",
      },

      // Worker-specific settings
      max_memory_restart: "512M",
      min_uptime: "10s",
      max_restarts: 5,
      restart_delay: 10000,

      // Logging
      log_file: "/var/log/v0-project/worker-combined.log",
      out_file: "/var/log/v0-project/worker-out.log",
      error_file: "/var/log/v0-project/worker-error.log",
      log_date_format: "YYYY-MM-DD HH:mm:ss Z",

      // Cron restart (restart daily at 3 AM)
      cron_restart: "0 3 * * *",

      // Auto restart on file changes (disabled in production)
      watch: false,

      // Kill timeout
      kill_timeout: 10000,
    },

    // Monitoring and metrics collector
    {
      name: "v0-monitor",
      script: "./scripts/monitor-daemon.js",
      cwd: "/var/www/v0-project",
      instances: 1,
      exec_mode: "fork",

      env: {
        NODE_ENV: "production",
        MONITOR_INTERVAL: 30000,
        METRICS_RETENTION: "7d",
      },

      // Monitor-specific settings
      max_memory_restart: "256M",
      min_uptime: "30s",
      max_restarts: 3,
      restart_delay: 15000,

      // Logging
      log_file: "/var/log/v0-project/monitor-combined.log",
      out_file: "/var/log/v0-project/monitor-out.log",
      error_file: "/var/log/v0-project/monitor-error.log",
      log_date_format: "YYYY-MM-DD HH:mm:ss Z",

      // Auto restart
      autorestart: true,
      watch: false,

      // Kill timeout
      kill_timeout: 5000,
    },
  ],

  // Deployment configuration
  deploy: {
    production: {
      user: "v0app",
      host: ["your-server-ip"],
      ref: "origin/main",
      repo: "https://github.com/your-username/v0-project.git",
      path: "/var/www/v0-project",

      // Pre-deploy commands
      "pre-deploy-local": "",
      "pre-deploy": "git fetch --all",

      // Post-deploy commands
      "post-deploy":
        "npm ci --production && npm run build && pm2 reload ecosystem.config.js --env production && pm2 save",

      // Environment variables for deployment
      env: {
        NODE_ENV: "production",
      },
    },

    staging: {
      user: "v0app",
      host: ["staging-server-ip"],
      ref: "origin/develop",
      repo: "https://github.com/your-username/v0-project.git",
      path: "/var/www/v0-project-staging",

      "pre-deploy-local": "",
      "pre-deploy": "git fetch --all",
      "post-deploy": "npm ci && npm run build && pm2 reload ecosystem.config.js --env staging && pm2 save",

      env: {
        NODE_ENV: "staging",
      },
    },
  },
}
