-- Setup database and user permissions for Spring Boot application
-- Run this in pgAdmin Query Tool (connect to postgres database first)

-- Step 1: Create the database if it doesn't exist
-- Note: You may need to run this as the postgres superuser
CREATE DATABASE "DB_ORDERS_SPRING"
    WITH 
    OWNER = donncha
    ENCODING = 'UTF8'
    CONNECTION LIMIT = -1;

-- Step 2: Connect to the new database (in pgAdmin, switch to DB_ORDERS_SPRING)
-- Then run the following:

-- Grant all privileges on the database to donncha
GRANT ALL PRIVILEGES ON DATABASE "DB_ORDERS_SPRING" TO donncha;

-- Grant privileges on the public schema
GRANT ALL ON SCHEMA public TO donncha;

-- Allow donncha to create tables in the public schema
GRANT CREATE ON SCHEMA public TO donncha;

-- Grant usage on the public schema
GRANT USAGE ON SCHEMA public TO donncha;

-- Set default privileges for future tables created by donncha
ALTER DEFAULT PRIVILEGES IN SCHEMA public 
GRANT ALL ON TABLES TO donncha;

-- Verify the user has access
SELECT 
    datname as database,
    usename as user,
    has_database_privilege(usename, datname, 'CONNECT') as can_connect,
    has_database_privilege(usename, datname, 'CREATE') as can_create
FROM pg_database, pg_user
WHERE datname = 'DB_ORDERS_SPRING' 
  AND usename = 'donncha';
