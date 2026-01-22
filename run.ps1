# PowerShell script to set environment variables and run Spring Boot application

Write-Host "Setting database environment variables..." -ForegroundColor Green

$env:DB_HOST = "localhost"
$env:DB_PORT = "5432"
$env:DB_NAME = "DB_ORDERS_SPRIN"
$env:DB_USERNAME = "postgres"
$env:DB_PASSWORD = "postgres"

Write-Host ""
Write-Host "Environment variables set:" -ForegroundColor Yellow
Write-Host "  DB_HOST=$env:DB_HOST"
Write-Host "  DB_PORT=$env:DB_PORT"
Write-Host "  DB_NAME=$env:DB_NAME"
Write-Host "  DB_USERNAME=$env:DB_USERNAME"
Write-Host "  DB_PASSWORD=****** (hidden)"
Write-Host ""

Write-Host "Starting Spring Boot application..." -ForegroundColor Green
Write-Host ""
mvn spring-boot:run
