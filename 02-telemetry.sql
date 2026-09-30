-- Step 1 — Create the Database
-- ============================================   
CREATE DATABASE axion_db;


-- Step 2 — Connect to the Database and create table
-- ============================================   
CREATE TABLE telemetry (
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

-- Step 3 — To set device is as indexes
-- ============================================   

-- Indexes for telemetry queries
CREATE INDEX idx_telemetry_device_id
ON telemetry(device_id);

CREATE INDEX idx_telemetry_timestamp
ON telemetry(timestamp DESC);


-- Step 4 — Verify the Data
-- ============================================   
SELECT * FROM telemetry;

SELECT COUNT(*) FROM telemetry;
