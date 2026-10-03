-- Step 1: Create the Database if it doesn't exist
-- Note: If running this via psql, ensure you are initially connected to the 'postgres' database.
SELECT 'CREATE DATABASE axion_db' 
WHERE NOT EXISTS (SELECT FROM pg_database WHERE datname = 'axion_db') \gexec

-- Switch connection context to the new database
\c axion_db

-- Step 2: Create the telemetry table
CREATE TABLE IF NOT EXISTS telemetry ( 
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(), 
    device_id VARCHAR(50) NOT NULL, 
    device_type VARCHAR(20) NOT NULL, 
    refinery_region VARCHAR(50) NOT NULL, 
    timestamp TIMESTAMP NOT NULL, 
    temperature DOUBLE PRECISION NOT NULL, 
    vibration DOUBLE PRECISION NOT NULL, 
    current DOUBLE PRECISION NOT NULL, 
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP 
); 

-- Step 3: Create indexes for optimized telemetry queries 
CREATE INDEX IF NOT EXISTS idx_telemetry_device_id ON telemetry(device_id); 
CREATE INDEX IF NOT EXISTS idx_telemetry_timestamp ON telemetry(timestamp DESC); 

-- Step 4: Insert 50 Rows of realistic Dummy Data
INSERT INTO telemetry (device_id, device_type, refinery_region, timestamp, temperature, vibration, current) VALUES
('DEV-001', 'PUMP', 'North America', NOW() - INTERVAL '10 minutes', 72.4, 0.15, 14.2),
('DEV-002', 'TURBINE', 'Europe', NOW() - INTERVAL '12 minutes', 154.8, 0.42, 45.1),
('DEV-003', 'COMPRESSOR', 'Asia-Pacific', NOW() - INTERVAL '15 minutes', 98.2, 0.28, 28.7),
('DEV-001', 'PUMP', 'North America', NOW() - INTERVAL '20 minutes', 73.1, 0.16, 14.5),
('DEV-004', 'MOTOR', 'Middle East', NOW() - INTERVAL '22 minutes', 65.0, 0.08, 8.9),
('DEV-002', 'TURBINE', 'Europe', NOW() - INTERVAL '24 minutes', 156.1, 0.45, 45.8),
('DEV-005', 'BOILER', 'South America', NOW() - INTERVAL '30 minutes', 210.5, 0.62, 60.3),
('DEV-003', 'COMPRESSOR', 'Asia-Pacific', NOW() - INTERVAL '35 minutes', 97.9, 0.27, 28.1),
('DEV-004', 'MOTOR', 'Middle East', NOW() - INTERVAL '40 minutes', 66.2, 0.09, 9.1),
('DEV-001', 'PUMP', 'North America', NOW() - INTERVAL '45 minutes', 71.9, 0.14, 14.0),
('DEV-002', 'TURBINE', 'Europe', NOW() - INTERVAL '48 minutes', 153.2, 0.39, 44.5),
('DEV-005', 'BOILER', 'South America', NOW() - INTERVAL '50 minutes', 208.3, 0.58, 59.7),
('DEV-003', 'COMPRESSOR', 'Asia-Pacific', NOW() - INTERVAL '55 minutes', 99.1, 0.31, 29.2),
('DEV-006', 'GENERATOR', 'Africa', NOW() - INTERVAL '60 minutes', 85.6, 0.22, 120.5),
('DEV-004', 'MOTOR', 'Middle East', NOW() - INTERVAL '65 minutes', 64.7, 0.07, 8.8),
('DEV-001', 'PUMP', 'North America', NOW() - INTERVAL '70 minutes', 72.8, 0.15, 14.3),
('DEV-002', 'TURBINE', 'Europe', NOW() - INTERVAL '72 minutes', 155.0, 0.41, 45.2),
('DEV-007', 'CHILLER', 'North America', NOW() - INTERVAL '75 minutes', 42.1, 0.11, 18.4),
('DEV-003', 'COMPRESSOR', 'Asia-Pacific', NOW() - INTERVAL '80 minutes', 98.5, 0.29, 28.9),
('DEV-005', 'BOILER', 'South America', NOW() - INTERVAL '85 minutes', 212.0, 0.65, 61.0),
('DEV-006', 'GENERATOR', 'Africa', NOW() - INTERVAL '90 minutes', 86.4, 0.24, 122.1),
('DEV-004', 'MOTOR', 'Middle East', NOW() - INTERVAL '95 minutes', 65.3, 0.08, 9.0),
('DEV-007', 'CHILLER', 'North America', NOW() - INTERVAL '100 minutes', 41.8, 0.10, 18.1),
('DEV-002', 'TURBINE', 'Europe', NOW() - INTERVAL '105 minutes', 154.2, 0.40, 44.9),
('DEV-001', 'PUMP', 'North America', NOW() - INTERVAL '110 minutes', 72.2, 0.14, 14.1),
('DEV-003', 'COMPRESSOR', 'Asia-Pacific', NOW() - INTERVAL '115 minutes', 97.6, 0.26, 28.0),
('DEV-005', 'BOILER', 'South America', NOW() - INTERVAL '120 minutes', 209.7, 0.60, 60.0),
('DEV-006', 'GENERATOR', 'Africa', NOW() - INTERVAL '125 minutes', 84.9, 0.21, 119.3),
('DEV-004', 'MOTOR', 'Middle East', NOW() - INTERVAL '130 minutes', 66.0, 0.09, 9.2),
('DEV-007', 'CHILLER', 'North America', NOW() - INTERVAL '135 minutes', 42.5, 0.12, 18.6),
('DEV-001', 'PUMP', 'North America', NOW() - INTERVAL '140 minutes', 73.5, 0.17, 14.6),
('DEV-002', 'TURBINE', 'Europe', NOW() - INTERVAL '144 minutes', 157.3, 0.48, 46.2),
('DEV-003', 'COMPRESSOR', 'Asia-Pacific', NOW() - INTERVAL '150 minutes', 99.8, 0.33, 29.5),
('DEV-005', 'BOILER', 'South America', NOW() - INTERVAL '155 minutes', 214.1, 0.68, 61.8),
('DEV-006', 'GENERATOR', 'Africa', NOW() - INTERVAL '160 minutes', 87.1, 0.25, 123.4),
('DEV-004', 'MOTOR', 'Middle East', NOW() - INTERVAL '165 minutes', 64.5, 0.07, 8.7),
('DEV-007', 'CHILLER', 'North America', NOW() - INTERVAL '170 minutes', 41.5, 0.09, 17.9),
('DEV-001', 'PUMP', 'North America', NOW() - INTERVAL '175 minutes', 72.0, 0.14, 14.0),
('DEV-002', 'TURBINE', 'Europe', NOW() - INTERVAL '180 minutes', 153.8, 0.38, 44.7),
('DEV-003', 'COMPRESSOR', 'Asia-Pacific', NOW() - INTERVAL '185 minutes', 98.0, 0.27, 28.4),
('DEV-005', 'BOILER', 'South America', NOW() - INTERVAL '190 minutes', 207.9, 0.57, 59.4),
('DEV-006', 'GENERATOR', 'Africa', NOW() - INTERVAL '195 minutes', 85.3, 0.22, 120.1),
('DEV-004', 'MOTOR', 'Middle East', NOW() - INTERVAL '200 minutes', 65.8, 0.08, 9.1),
('DEV-007', 'CHILLER', 'North America', NOW() - INTERVAL '205 minutes', 42.9, 0.13, 18.8),
('DEV-001', 'PUMP', 'North America', NOW() - INTERVAL '210 minutes', 72.6, 0.15, 14.3),
('DEV-002', 'TURBINE', 'Europe', NOW() - INTERVAL '215 minutes', 155.5, 0.43, 45.5),
('DEV-003', 'COMPRESSOR', 'Asia-Pacific', NOW() - INTERVAL '220 minutes', 98.9, 0.30, 29.0),
('DEV-005', 'BOILER', 'South America', NOW() - INTERVAL '225 minutes', 211.2, 0.63, 60.7),
('DEV-006', 'GENERATOR', 'Africa', NOW() - INTERVAL '230 minutes', 86.8, 0.24, 122.9),
('DEV-004', 'MOTOR', 'Middle East', NOW() - INTERVAL '235 minutes', 65.1, 0.08, 8.9);

-- Step 5: Verify the Data 
SELECT * FROM telemetry LIMIT 5; 
SELECT COUNT(*) FROM telemetry;

-- ============================

-- PGPASSWORD='your_rds_password' psql -h <://rds.com> -U <admin> -d postgres -f test.sql

