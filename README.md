# Spring Boot PostgreSQL Application

A Spring Boot application demonstrating integration with PostgreSQL database, featuring Customer and Order entities with JPA relationships.

## Prerequisites

- Java 17 or higher
- Maven 3.6+
- PostgreSQL 12 or higher

## Project Structure

```
spring-postgres-demo/
├── src/
│   ├── main/
│   │   ├── java/com/example/demo/
│   │   │   ├── entity/
│   │   │   │   ├── Customer.java
│   │   │   │   └── Order.java
│   │   │   ├── repository/
│   │   │   │   ├── CustomerRepository.java
│   │   │   │   └── OrderRepository.java
│   │   │   ├── DataLoader.java
│   │   │   └── DemoApplication.java
│   │   └── resources/
│   │       └── application.yml
│   └── test/
└── pom.xml
```

## Database Configuration

### Default Configuration (Localhost)

By default, the application connects to PostgreSQL on `localhost:5432` with database `demo_db`:

```yaml
spring:
  datasource:
    url: jdbc:postgresql://localhost:5432/demo_db
    username: postgres
    password: postgres
```

### Changing Database Host

You can override the database configuration using environment variables **without modifying code**:

#### Option 1: Environment Variables

Set the following environment variables before running the application:

**Windows (PowerShell):**
```powershell
$env:DB_HOST="localhost"
$env:DB_PORT="5432"
$env:DB_NAME="DB_ORDERS_SPRIN"
$env:DB_USERNAME="postgres"
$env:DB_PASSWORD="postgres"
```

**Windows (Command Prompt):**
```cmd
set DB_HOST=localhost
set DB_PORT=5432
set DB_NAME=DB_ORDERS_SPRIN
set DB_USERNAME=postgres
set DB_PASSWORD=postgres
```

**Linux/Mac:**
```bash
export DB_HOST=localhost
export DB_PORT=5432
export DB_NAME=DB_ORDERS_SPRIN
export DB_USERNAME=postgres
export DB_PASSWORD=postgres
```

#### Option 2: Command Line Arguments

```bash
mvn spring-boot:run -Dspring-boot.run.arguments="--DB_HOST=localhost --DB_PORT=5432 --DB_NAME=DB_ORDERS_SPRIN --DB_USERNAME=postgres --DB_PASSWORD=postgres"
```

#### Option 3: Create application-dev.yml

Create `src/main/resources/application-dev.yml` for development settings:

```yaml
spring:
  datasource:
    url: jdbc:postgresql://localhost:5432/DB_ORDERS_SPRIN
    username: postgres
    password: postgres
```

Then run with the `dev` profile:
```bash
mvn spring-boot:run -Dspring-boot.run.profiles=dev
```

## Database Schema

The application automatically creates the following schema:

### Customers Table
- `id` (BIGINT, Primary Key, Auto-increment)
- `name` (VARCHAR, NOT NULL)
- `address` (VARCHAR, NOT NULL)

### Orders Table
- `id` (BIGINT, Primary Key, Auto-increment)
- `order_number` (VARCHAR, NOT NULL)
- `line_number` (INTEGER, NOT NULL)
- `product_code` (VARCHAR, NOT NULL)
- `quantity` (INTEGER, NOT NULL)
- `price` (DECIMAL(10,2), NOT NULL)
- `customer_id` (BIGINT, Foreign Key → customers.id)

## Running the Application

### Step 1: Create PostgreSQL Database

Connect to PostgreSQL and create the database:

```sql
CREATE DATABASE DB_ORDERS_SPRIN;
```

### Step 2: Build the Application

```bash
mvn clean install
```

### Step 3: Run the Application

**Using Maven:**
```bash
mvn spring-boot:run
```

**Using Java:**
```bash
java -jar target/spring-postgres-demo-0.0.1-SNAPSHOT.jar
```

### Step 4: Verify

The application will:
1. Connect to PostgreSQL
2. Create the `customers` and `orders` tables
3. Load sample data (3 customers with 6 orders total)
4. Display the loaded data in the console

## Sample Data

The `DataLoader` component automatically creates sample data on first run:

**Customer 1:** Acme Corporation
- Order ORD-001, Line 1: 5x PROD-100 @ $29.99
- Order ORD-001, Line 2: 3x PROD-101 @ $49.99
- Order ORD-002, Line 1: 10x PROD-102 @ $15.50

**Customer 2:** TechStart Inc
- Order ORD-003, Line 1: 2x PROD-200 @ $199.99
- Order ORD-003, Line 2: 1x PROD-201 @ $299.99

**Customer 3:** Global Traders Ltd
- Order ORD-004, Line 1: 100x PROD-300 @ $5.99

## Key Features

✅ **Configurable Database Connection** - Use environment variables to change host/credentials  
✅ **JPA Entity Relationships** - Proper `@OneToMany` / `@ManyToOne` bidirectional mapping  
✅ **Automatic Schema Creation** - Hibernate DDL auto-update creates tables  
✅ **Referential Integrity** - Foreign key constraints ensure data consistency  
✅ **Spring Data JPA Repositories** - Simple CRUD operations with custom queries  
✅ **Sample Data Loader** - Demonstrates creating customers with multiple orders  

## Troubleshooting

### Connection Refused
- Ensure PostgreSQL is running: `pg_ctl status` or check services
- Verify PostgreSQL is listening on the correct port (default 5432)
- Check firewall settings if connecting to remote host

### Authentication Failed
- Verify username and password are correct
- Check `pg_hba.conf` for authentication method (md5 or trust)

### Database Does Not Exist
- Create the database manually: `CREATE DATABASE demo_db;`
- Or change `DB_NAME` environment variable to an existing database (e.g. `DB_ORDERS_SPRIN`)

## Technologies Used

- **Spring Boot 3.2.1**
- **Spring Data JPA**
- **PostgreSQL Driver**
- **Hibernate ORM**
- **Maven**
