# Example: Connecting to PostgreSQL on a Different Host

## Scenario 1: Remote PostgreSQL Server

If your PostgreSQL database is running on a different machine (e.g., IP: 192.168.1.100):

### Windows PowerShell:
```powershell
$env:DB_HOST="192.168.1.100"
$env:DB_PORT="5432"
$env:DB_NAME="DB_ORDERS_SPRIN"
$env:DB_USERNAME="postgres"
$env:DB_PASSWORD="yourpassword"
mvn spring-boot:run
```

### Linux/Mac:
```bash
export DB_HOST=192.168.1.100
export DB_PORT=5432
export DB_NAME=demo_db
export DB_USERNAME=postgres
export DB_PASSWORD=yourpassword
mvn spring-boot:run
```

## Scenario 2: Docker Container

If PostgreSQL is running in a Docker container:

### Start PostgreSQL Container:
```bash
docker run --name postgres-demo \
  -e POSTGRES_DB=DB_ORDERS_SPRIN \
  -e POSTGRES_USER=postgres \
  -e POSTGRES_PASSWORD=postgres \
  -p 5432:5432 \
  -d postgres:15
```

### Connect from Host Machine:
```bash
# Use localhost since port is mapped
export DB_HOST=localhost
export DB_PORT=5432
export DB_NAME=demo_db
export DB_USERNAME=postgres
export DB_PASSWORD=postgres
mvn spring-boot:run
```

## Scenario 3: Cloud Database (AWS RDS, Azure, etc.)

For cloud-hosted PostgreSQL:

```bash
export DB_HOST=mydb.abc123.us-east-1.rds.amazonaws.com
export DB_PORT=5432
export DB_NAME=production_db
export DB_USERNAME=admin
export DB_PASSWORD=securepassword
mvn spring-boot:run
```

## Scenario 4: Using application-{profile}.yml

Create `src/main/resources/application-production.yml`:

```yaml
spring:
  datasource:
    url: jdbc:postgresql://prod-server.example.com:5432/prod_db
    username: prod_user
    password: prod_password
```

Run with profile:
```bash
mvn spring-boot:run -Dspring-boot.run.profiles=production
```

## Verifying Connection

After starting the application, check the console output for:

```
Hibernate: create table customers (...)
Hibernate: create table orders (...)
Loading sample data...
Sample data loaded successfully!
Created 3 customers
Created 6 orders
```

This confirms successful database connection and schema creation.
