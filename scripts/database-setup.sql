-- V0 Project - Database Setup Script
-- PostgreSQL 14+ Database Schema and Configuration

-- Create database if it doesn't exist
SELECT 'CREATE DATABASE v0_tactical_db'
WHERE NOT EXISTS (SELECT FROM pg_database WHERE datname = 'v0_tactical_db')\gexec

-- Connect to the database
\c v0_tactical_db;

-- Enable required extensions
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
CREATE EXTENSION IF NOT EXISTS "pgcrypto";
CREATE EXTENSION IF NOT EXISTS "pg_stat_statements";
CREATE EXTENSION IF NOT EXISTS "btree_gin";

-- Create custom types
CREATE TYPE user_role AS ENUM ('admin', 'operator', 'analyst', 'viewer');
CREATE TYPE system_status AS ENUM ('online', 'offline', 'maintenance', 'error');
CREATE TYPE alert_severity AS ENUM ('low', 'medium', 'high', 'critical');
CREATE TYPE operation_status AS ENUM ('pending', 'running', 'completed', 'failed', 'cancelled');

-- Create users table
CREATE TABLE IF NOT EXISTS users (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    role user_role DEFAULT 'viewer',
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    avatar_url TEXT,
    is_active BOOLEAN DEFAULT true,
    last_login TIMESTAMP WITH TIME ZONE,
    failed_login_attempts INTEGER DEFAULT 0,
    locked_until TIMESTAMP WITH TIME ZONE,
    two_factor_enabled BOOLEAN DEFAULT false,
    two_factor_secret VARCHAR(32),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Create sessions table
CREATE TABLE IF NOT EXISTS user_sessions (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    session_token VARCHAR(255) UNIQUE NOT NULL,
    refresh_token VARCHAR(255) UNIQUE,
    ip_address INET,
    user_agent TEXT,
    expires_at TIMESTAMP WITH TIME ZONE NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    last_accessed TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Create systems table
CREATE TABLE IF NOT EXISTS systems (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name VARCHAR(100) NOT NULL,
    description TEXT,
    system_type VARCHAR(50) NOT NULL,
    status system_status DEFAULT 'offline',
    endpoint_url TEXT,
    api_key_hash VARCHAR(255),
    configuration JSONB DEFAULT '{}',
    health_check_url TEXT,
    last_health_check TIMESTAMP WITH TIME ZONE,
    health_status BOOLEAN DEFAULT false,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Create agents table
CREATE TABLE IF NOT EXISTS agents (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name VARCHAR(100) NOT NULL,
    agent_type VARCHAR(50) NOT NULL,
    status system_status DEFAULT 'offline',
    system_id UUID REFERENCES systems(id) ON DELETE SET NULL,
    capabilities JSONB DEFAULT '[]',
    configuration JSONB DEFAULT '{}',
    last_heartbeat TIMESTAMP WITH TIME ZONE,
    version VARCHAR(20),
    location JSONB,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Create operations table
CREATE TABLE IF NOT EXISTS operations (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name VARCHAR(200) NOT NULL,
    description TEXT,
    operation_type VARCHAR(50) NOT NULL,
    status operation_status DEFAULT 'pending',
    priority INTEGER DEFAULT 5 CHECK (priority >= 1 AND priority <= 10),
    assigned_to UUID REFERENCES users(id) ON DELETE SET NULL,
    system_id UUID REFERENCES systems(id) ON DELETE SET NULL,
    agent_id UUID REFERENCES agents(id) ON DELETE SET NULL,
    parameters JSONB DEFAULT '{}',
    result JSONB,
    error_message TEXT,
    started_at TIMESTAMP WITH TIME ZONE,
    completed_at TIMESTAMP WITH TIME ZONE,
    estimated_duration INTERVAL,
    actual_duration INTERVAL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Create alerts table
CREATE TABLE IF NOT EXISTS alerts (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    title VARCHAR(200) NOT NULL,
    message TEXT NOT NULL,
    severity alert_severity DEFAULT 'medium',
    source VARCHAR(100),
    system_id UUID REFERENCES systems(id) ON DELETE SET NULL,
    agent_id UUID REFERENCES agents(id) ON DELETE SET NULL,
    operation_id UUID REFERENCES operations(id) ON DELETE SET NULL,
    acknowledged BOOLEAN DEFAULT false,
    acknowledged_by UUID REFERENCES users(id) ON DELETE SET NULL,
    acknowledged_at TIMESTAMP WITH TIME ZONE,
    resolved BOOLEAN DEFAULT false,
    resolved_by UUID REFERENCES users(id) ON DELETE SET NULL,
    resolved_at TIMESTAMP WITH TIME ZONE,
    metadata JSONB DEFAULT '{}',
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Create intelligence_reports table
CREATE TABLE IF NOT EXISTS intelligence_reports (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    title VARCHAR(200) NOT NULL,
    content TEXT NOT NULL,
    report_type VARCHAR(50) NOT NULL,
    classification VARCHAR(20) DEFAULT 'unclassified',
    source VARCHAR(100),
    author_id UUID REFERENCES users(id) ON DELETE SET NULL,
    tags TEXT[],
    attachments JSONB DEFAULT '[]',
    metadata JSONB DEFAULT '{}',
    published BOOLEAN DEFAULT false,
    published_at TIMESTAMP WITH TIME ZONE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Create financial_data table
CREATE TABLE IF NOT EXISTS financial_data (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    symbol VARCHAR(20) NOT NULL,
    data_type VARCHAR(50) NOT NULL,
    period VARCHAR(20) NOT NULL,
    value DECIMAL(20,4),
    currency VARCHAR(3) DEFAULT 'USD',
    timestamp TIMESTAMP WITH TIME ZONE NOT NULL,
    source VARCHAR(100),
    metadata JSONB DEFAULT '{}',
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    UNIQUE(symbol, data_type, period, timestamp)
);

-- Create audit_logs table
CREATE TABLE IF NOT EXISTS audit_logs (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID REFERENCES users(id) ON DELETE SET NULL,
    action VARCHAR(100) NOT NULL,
    resource_type VARCHAR(50),
    resource_id UUID,
    old_values JSONB,
    new_values JSONB,
    ip_address INET,
    user_agent TEXT,
    success BOOLEAN DEFAULT true,
    error_message TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Create webhooks table
CREATE TABLE IF NOT EXISTS webhooks (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name VARCHAR(100) NOT NULL,
    url TEXT NOT NULL,
    secret VARCHAR(255),
    events TEXT[] NOT NULL,
    active BOOLEAN DEFAULT true,
    retry_count INTEGER DEFAULT 3,
    timeout_seconds INTEGER DEFAULT 30,
    last_triggered TIMESTAMP WITH TIME ZONE,
    last_success TIMESTAMP WITH TIME ZONE,
    failure_count INTEGER DEFAULT 0,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Create webhook_deliveries table
CREATE TABLE IF NOT EXISTS webhook_deliveries (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    webhook_id UUID NOT NULL REFERENCES webhooks(id) ON DELETE CASCADE,
    event_type VARCHAR(50) NOT NULL,
    payload JSONB NOT NULL,
    response_status INTEGER,
    response_body TEXT,
    response_time_ms INTEGER,
    success BOOLEAN DEFAULT false,
    attempt_number INTEGER DEFAULT 1,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Create system_metrics table
CREATE TABLE IF NOT EXISTS system_metrics (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    system_id UUID REFERENCES systems(id) ON DELETE CASCADE,
    metric_name VARCHAR(100) NOT NULL,
    metric_value DECIMAL(20,4) NOT NULL,
    unit VARCHAR(20),
    tags JSONB DEFAULT '{}',
    timestamp TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Create indexes for performance
CREATE INDEX IF NOT EXISTS idx_users_username ON users(username);
CREATE INDEX IF NOT EXISTS idx_users_email ON users(email);
CREATE INDEX IF NOT EXISTS idx_users_role ON users(role);
CREATE INDEX IF NOT EXISTS idx_users_active ON users(is_active);

CREATE INDEX IF NOT EXISTS idx_sessions_user_id ON user_sessions(user_id);
CREATE INDEX IF NOT EXISTS idx_sessions_token ON user_sessions(session_token);
CREATE INDEX IF NOT EXISTS idx_sessions_expires ON user_sessions(expires_at);

CREATE INDEX IF NOT EXISTS idx_systems_status ON systems(status);
CREATE INDEX IF NOT EXISTS idx_systems_type ON systems(system_type);
CREATE INDEX IF NOT EXISTS idx_systems_health ON systems(health_status);

CREATE INDEX IF NOT EXISTS idx_agents_status ON agents(status);
CREATE INDEX IF NOT EXISTS idx_agents_type ON agents(agent_type);
CREATE INDEX IF NOT EXISTS idx_agents_system ON agents(system_id);
CREATE INDEX IF NOT EXISTS idx_agents_heartbeat ON agents(last_heartbeat);

CREATE INDEX IF NOT EXISTS idx_operations_status ON operations(status);
CREATE INDEX IF NOT EXISTS idx_operations_type ON operations(operation_type);
CREATE INDEX IF NOT EXISTS idx_operations_assigned ON operations(assigned_to);
CREATE INDEX IF NOT EXISTS idx_operations_system ON operations(system_id);
CREATE INDEX IF NOT EXISTS idx_operations_priority ON operations(priority);
CREATE INDEX IF NOT EXISTS idx_operations_created ON operations(created_at);

CREATE INDEX IF NOT EXISTS idx_alerts_severity ON alerts(severity);
CREATE INDEX IF NOT EXISTS idx_alerts_acknowledged ON alerts(acknowledged);
CREATE INDEX IF NOT EXISTS idx_alerts_resolved ON alerts(resolved);
CREATE INDEX IF NOT EXISTS idx_alerts_system ON alerts(system_id);
CREATE INDEX IF NOT EXISTS idx_alerts_created ON alerts(created_at);

CREATE INDEX IF NOT EXISTS idx_intelligence_type ON intelligence_reports(report_type);
CREATE INDEX IF NOT EXISTS idx_intelligence_classification ON intelligence_reports(classification);
CREATE INDEX IF NOT EXISTS idx_intelligence_published ON intelligence_reports(published);
CREATE INDEX IF NOT EXISTS idx_intelligence_author ON intelligence_reports(author_id);
CREATE INDEX IF NOT EXISTS idx_intelligence_tags ON intelligence_reports USING GIN(tags);

CREATE INDEX IF NOT EXISTS idx_financial_symbol ON financial_data(symbol);
CREATE INDEX IF NOT EXISTS idx_financial_type ON financial_data(data_type);
CREATE INDEX IF NOT EXISTS idx_financial_timestamp ON financial_data(timestamp);
CREATE INDEX IF NOT EXISTS idx_financial_symbol_type_period ON financial_data(symbol, data_type, period);

CREATE INDEX IF NOT EXISTS idx_audit_user ON audit_logs(user_id);
CREATE INDEX IF NOT EXISTS idx_audit_action ON audit_logs(action);
CREATE INDEX IF NOT EXISTS idx_audit_resource ON audit_logs(resource_type, resource_id);
CREATE INDEX IF NOT EXISTS idx_audit_created ON audit_logs(created_at);

CREATE INDEX IF NOT EXISTS idx_webhooks_active ON webhooks(active);
CREATE INDEX IF NOT EXISTS idx_webhooks_events ON webhooks USING GIN(events);

CREATE INDEX IF NOT EXISTS idx_webhook_deliveries_webhook ON webhook_deliveries(webhook_id);
CREATE INDEX IF NOT EXISTS idx_webhook_deliveries_event ON webhook_deliveries(event_type);
CREATE INDEX IF NOT EXISTS idx_webhook_deliveries_success ON webhook_deliveries(success);
CREATE INDEX IF NOT EXISTS idx_webhook_deliveries_created ON webhook_deliveries(created_at);

CREATE INDEX IF NOT EXISTS idx_metrics_system ON system_metrics(system_id);
CREATE INDEX IF NOT EXISTS idx_metrics_name ON system_metrics(metric_name);
CREATE INDEX IF NOT EXISTS idx_metrics_timestamp ON system_metrics(timestamp);
CREATE INDEX IF NOT EXISTS idx_metrics_system_name_timestamp ON system_metrics(system_id, metric_name, timestamp);

-- Create functions for updated_at triggers
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;
$$ language 'plpgsql';

-- Create triggers for updated_at
CREATE TRIGGER update_users_updated_at BEFORE UPDATE ON users
    FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_systems_updated_at BEFORE UPDATE ON systems
    FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_agents_updated_at BEFORE UPDATE ON agents
    FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_operations_updated_at BEFORE UPDATE ON operations
    FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_alerts_updated_at BEFORE UPDATE ON alerts
    FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_intelligence_reports_updated_at BEFORE UPDATE ON intelligence_reports
    FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_webhooks_updated_at BEFORE UPDATE ON webhooks
    FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

-- Create database roles
DO $$
BEGIN
    -- Create application user
    IF NOT EXISTS (SELECT FROM pg_catalog.pg_roles WHERE rolname = 'v0_user') THEN
        CREATE ROLE v0_user WITH LOGIN PASSWORD 'v0_secure_password_2024!';
    END IF;
    
    -- Create read-only user
    IF NOT EXISTS (SELECT FROM pg_catalog.pg_roles WHERE rolname = 'v0_readonly') THEN
        CREATE ROLE v0_readonly WITH LOGIN PASSWORD 'v0_readonly_password_2024!';
    END IF;
    
    -- Create backup user
    IF NOT EXISTS (SELECT FROM pg_catalog.pg_roles WHERE rolname = 'v0_backup') THEN
        CREATE ROLE v0_backup WITH LOGIN PASSWORD 'v0_backup_password_2024!';
    END IF;
END
$$;

-- Grant permissions to application user
GRANT CONNECT ON DATABASE v0_tactical_db TO v0_user;
GRANT USAGE ON SCHEMA public TO v0_user;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO v0_user;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO v0_user;
GRANT EXECUTE ON ALL FUNCTIONS IN SCHEMA public TO v0_user;

-- Grant permissions to read-only user
GRANT CONNECT ON DATABASE v0_tactical_db TO v0_readonly;
GRANT USAGE ON SCHEMA public TO v0_readonly;
GRANT SELECT ON ALL TABLES IN SCHEMA public TO v0_readonly;

-- Grant permissions to backup user
GRANT CONNECT ON DATABASE v0_tactical_db TO v0_backup;
GRANT USAGE ON SCHEMA public TO v0_backup;
GRANT SELECT ON ALL TABLES IN SCHEMA public TO v0_backup;

-- Set default privileges for future tables
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL ON TABLES TO v0_user;
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL ON SEQUENCES TO v0_user;
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT EXECUTE ON FUNCTIONS TO v0_user;
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT SELECT ON TABLES TO v0_readonly;
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT SELECT ON TABLES TO v0_backup;

-- Insert default admin user (password: admin123! - CHANGE IN PRODUCTION)
INSERT INTO users (
    username, 
    email, 
    password_hash, 
    role, 
    first_name, 
    last_name,
    is_active
) VALUES (
    'admin',
    'admin@v0-tactical.com',
    '$2b$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/LewdBPj/RK.PJ/...',  -- admin123!
    'admin',
    'System',
    'Administrator',
    true
) ON CONFLICT (username) DO NOTHING;

-- Insert sample systems
INSERT INTO systems (name, description, system_type, status, configuration) VALUES
    ('Primary Command Center', 'Main tactical command and control system', 'command', 'online', '{"priority": "high", "location": "HQ"}'),
    ('Intelligence Hub', 'Central intelligence gathering and analysis system', 'intelligence', 'online', '{"classification": "secret", "region": "global"}'),
    ('Operations Network', 'Field operations coordination system', 'operations', 'online', '{"coverage": "worldwide", "capacity": 1000}'),
    ('Agent Network', 'Distributed agent communication system', 'agents', 'online', '{"encryption": "AES-256", "protocols": ["secure", "stealth"]}'
) ON CONFLICT DO NOTHING;

-- Insert sample agents
INSERT INTO agents (name, agent_type, status, capabilities, configuration) VALUES
    ('Alpha-001', 'field', 'online', '["surveillance", "reconnaissance", "communication"]', '{"clearance": "top-secret", "region": "north"}'),
    ('Beta-002', 'cyber', 'online', '["network-analysis", "intrusion-detection", "data-mining"]', '{"specialization": "cyber-warfare", "tools": ["nmap", "wireshark"]}'),
    ('Gamma-003', 'intelligence', 'online', '["data-analysis", "pattern-recognition", "reporting"]', '{"focus": "financial-intelligence", "languages": ["en", "es", "fr"]}'),
    ('Delta-004', 'support', 'offline', '["logistics", "coordination", "backup"]', '{"role": "support", "availability": "24/7"}'
) ON CONFLICT DO NOTHING;

-- Create views for common queries
CREATE OR REPLACE VIEW active_operations AS
SELECT 
    o.*,
    u.username as assigned_username,
    s.name as system_name,
    a.name as agent_name
FROM operations o
LEFT JOIN users u ON o.assigned_to = u.id
LEFT JOIN systems s ON o.system_id = s.id
LEFT JOIN agents a ON o.agent_id = a.id
WHERE o.status IN ('pending', 'running');

CREATE OR REPLACE VIEW unresolved_alerts AS
SELECT 
    a.*,
    s.name as system_name,
    ag.name as agent_name,
    u.username as acknowledged_by_username
FROM alerts a
LEFT JOIN systems s ON a.system_id = s.id
LEFT JOIN agents ag ON a.agent_id = ag.id
LEFT JOIN users u ON a.acknowledged_by = u.id
WHERE a.resolved = false;

CREATE OR REPLACE VIEW system_health_summary AS
SELECT 
    s.id,
    s.name,
    s.status,
    s.health_status,
    s.last_health_check,
    COUNT(a.id) as agent_count,
    COUNT(CASE WHEN a.status = 'online' THEN 1 END) as online_agents,
    COUNT(CASE WHEN al.resolved = false THEN 1 END) as unresolved_alerts
FROM systems s
LEFT JOIN agents a ON s.id = a.system_id
LEFT JOIN alerts al ON s.id = al.system_id AND al.resolved = false
GROUP BY s.id, s.name, s.status, s.health_status, s.last_health_check;

-- Create stored procedures for common operations
CREATE OR REPLACE FUNCTION create_alert(
    p_title VARCHAR(200),
    p_message TEXT,
    p_severity alert_severity DEFAULT 'medium',
    p_source VARCHAR(100) DEFAULT NULL,
    p_system_id UUID DEFAULT NULL,
    p_agent_id UUID DEFAULT NULL,
    p_metadata JSONB DEFAULT '{}'
) RETURNS UUID AS $$
DECLARE
    alert_id UUID;
BEGIN
    INSERT INTO alerts (title, message, severity, source, system_id, agent_id, metadata)
    VALUES (p_title, p_message, p_severity, p_source, p_system_id, p_agent_id, p_metadata)
    RETURNING id INTO alert_id;
    
    RETURN alert_id;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION acknowledge_alert(
    p_alert_id UUID,
    p_user_id UUID
) RETURNS BOOLEAN AS $$
BEGIN
    UPDATE alerts 
    SET acknowledged = true, 
        acknowledged_by = p_user_id, 
        acknowledged_at = NOW()
    WHERE id = p_alert_id AND acknowledged = false;
    
    RETURN FOUND;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION resolve_alert(
    p_alert_id UUID,
    p_user_id UUID
) RETURNS BOOLEAN AS $$
BEGIN
    UPDATE alerts 
    SET resolved = true, 
        resolved_by = p_user_id, 
        resolved_at = NOW(),
        acknowledged = true,
        acknowledged_by = COALESCE(acknowledged_by, p_user_id),
        acknowledged_at = COALESCE(acknowledged_at, NOW())
    WHERE id = p_alert_id AND resolved = false;
    
    RETURN FOUND;
END;
$$ LANGUAGE plpgsql;

-- Create function to clean old data
CREATE OR REPLACE FUNCTION cleanup_old_data() RETURNS VOID AS $$
BEGIN
    -- Clean old audit logs (older than 1 year)
    DELETE FROM audit_logs WHERE created_at < NOW() - INTERVAL '1 year';
    
    -- Clean old webhook deliveries (older than 3 months)
    DELETE FROM webhook_deliveries WHERE created_at < NOW() - INTERVAL '3 months';
    
    -- Clean old system metrics (older than 6 months)
    DELETE FROM system_metrics WHERE created_at < NOW() - INTERVAL '6 months';
    
    -- Clean old resolved alerts (older than 6 months)
    DELETE FROM alerts WHERE resolved = true AND resolved_at < NOW() - INTERVAL '6 months';
    
    -- Clean expired sessions
    DELETE FROM user_sessions WHERE expires_at < NOW();
END;
$$ LANGUAGE plpgsql;

-- Configure PostgreSQL settings for performance
ALTER SYSTEM SET shared_preload_libraries = 'pg_stat_statements';
ALTER SYSTEM SET max_connections = 200;
ALTER SYSTEM SET shared_buffers = '256MB';
ALTER SYSTEM SET effective_cache_size = '1GB';
ALTER SYSTEM SET maintenance_work_mem = '64MB';
ALTER SYSTEM SET checkpoint_completion_target = 0.9;
ALTER SYSTEM SET wal_buffers = '16MB';
ALTER SYSTEM SET default_statistics_target = 100;
ALTER SYSTEM SET random_page_cost = 1.1;
ALTER SYSTEM SET effective_io_concurrency = 200;

-- Create backup and maintenance scripts
CREATE OR REPLACE FUNCTION create_backup_info() RETURNS TABLE(
    table_name TEXT,
    row_count BIGINT,
    size_pretty TEXT
) AS $$
BEGIN
    RETURN QUERY
    SELECT 
        schemaname||'.'||tablename as table_name,
        n_tup_ins + n_tup_upd as row_count,
        pg_size_pretty(pg_total_relation_size(schemaname||'.'||tablename)) as size_pretty
    FROM pg_stat_user_tables 
    ORDER BY pg_total_relation_size(schemaname||'.'||tablename) DESC;
END;
$$ LANGUAGE plpgsql;

-- Utility function to reset a user's password
CREATE OR REPLACE FUNCTION reset_user_password(
    p_username VARCHAR,
    p_new_password VARCHAR
) RETURNS VOID AS $$
BEGIN
    UPDATE users
    SET password_hash = crypt(p_new_password, gen_salt('bf')),
        updated_at = NOW()
    WHERE username = p_username;

    IF NOT FOUND THEN
        RAISE EXCEPTION 'User % not found', p_username;
    END IF;
END;
$$ LANGUAGE plpgsql;

-- Final message
DO $$
BEGIN
    RAISE NOTICE 'V0 Tactical Database setup completed successfully!';
    RAISE NOTICE 'Default admin user created: admin / admin123! (CHANGE PASSWORD IN PRODUCTION)';
    RAISE NOTICE 'Database roles created: v0_user, v0_readonly, v0_backup';
    RAISE NOTICE 'Sample data inserted for systems and agents';
    RAISE NOTICE 'Performance indexes and triggers configured';
    RAISE NOTICE 'Views and stored procedures created';
    RAISE NOTICE 'Remember to run ANALYZE; after initial data load';
END $$;

-- Analyze tables for query optimization
ANALYZE;
