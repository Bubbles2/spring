-- Run this in pgAdmin Query Tool to see all users and their settings
-- This will help identify which user to use

-- List all users/roles
SELECT 
    usename as username,
    usesuper as is_superuser,
    usecreatedb as can_create_db,
    useconfig as config
FROM pg_user
ORDER BY usename;

-- List all databases and their owners
SELECT 
    datname as database_name,
    pg_catalog.pg_get_userbyid(datdba) as owner
FROM pg_database
WHERE datname NOT IN ('template0', 'template1')
ORDER BY datname;

-- Check if specific users exist
SELECT usename FROM pg_user WHERE usename IN ('postgres', 'antig', 'donncha');
