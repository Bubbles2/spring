-- Change the password for the postgres user
-- Run this in pgAdmin's Query Tool

-- Option 1: Set a simple password for development
ALTER USER postgres WITH PASSWORD 'postgres';

-- Option 2: Set a custom password (uncomment and modify)
-- ALTER USER postgres WITH PASSWORD 'your_password_here';

-- Verify the user exists
SELECT usename FROM pg_user WHERE usename = 'postgres';
