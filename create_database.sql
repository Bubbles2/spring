-- Create the database for Spring Boot application
-- Run this script in PostgreSQL before starting the application

-- Connect to PostgreSQL and run:
-- psql -U postgres -f create_database.sql

CREATE DATABASE "DB_ORDERS_SPRING"
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    CONNECTION LIMIT = -1;

-- Verify the database was created
\l DB_ORDERS8SPRING
