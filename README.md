# Small Business Expense Tracking Database

## Team and Members
CSCE 4355 - Team 20
- Rishav Dahal
- Jacob Choe
- Jacob Lamb

## Overview

This project aims to help small businesses track order and expenses data by providing a database to replace the conventional use of spreadsheets in data tracking.
Our database implements schemas, tables, RBAC, indexes, and backups to efficiently support data storage and retrieval.

## Prerequisites

- Updated version of PostgreSQL (version 18.0 or newer, tested on 18.0)
- Know your postgres user login
- Git locally installed
- Correct PATH setup for PostgreSQL (A path to PostgreSQL's bin folder must be in your system variables)

## Database Setup and Execution Instructions

1. Clone the Repository:
```bash
git clone https://github.com/JacobDL1/CSCE4355---Team-20.git
cd CSCE4355---Team-20
```

2. After navigating to the folder where the repo was cloned to, create the database:
```bash
psql -U postgres -c "CREATE DATABASE small_business;"
```

Side note: If psql commands fail, then make sure to add a PATH to PostgreSQL's bin folder in your system variables. The default file path to add to system variables is "C:\Program Files\PostgreSQL\18\bin".

3. Run the following commands to execute the SQL files:
```bash
psql -U postgres -d small_business -f sql/schemas.sql
psql -U postgres -d small_business -f sql/tables.sql
psql -U postgres -d small_business -f sql/data.sql
psql -U postgres -d small_business -f sql/roles.sql
psql -U postgres -d small_business -f sql/indexes.sql
```

4. Navigate to your PostgreSQL installation, then connect to the database
```bash
psql -U postgres -d small_business
```

5. Connect to your desired role:
For owner:
```SQL
SET ROLE owner;
```
For accounting:
```SQL
SET ROLE accounting;
```
For sales:
```SQL
SET ROLE sales;
```

6. Run whatever queries or commands you desire within the scope of your granted role

## Schemas

- expenses
- orders

## Tables

Expenses Schema:
- payroll
- rent
- utilities
- vendors

Orders Schema:
- customers
- products
- orders
- order_items

## Indexes

Orders Schema:
- ord_date
- ord_customer_name
- ord_product_name
- ord_foreign_customer_id
- ord_foreign_order_id
- ord_foreign_product_id

Expenses Schema:
- exp_payroll_range
- exp_rent_range
- exp_utilities_range
- exp_vendors_range
- exp_payroll_name
- exp_rent_name
- exp_utilities_name
- exp_vendors_name

## Backups

The backup_commands.txt file outlines what commands to use for different backup-related scenarios. We use pg_dump to create backups and pg_restore to restore the database to a backup.

## Demonstration Scenarios
Note: All of these scenarios assume that the user has followed the setup and execution directions above.

Indexes:
- Before and after using EXPLAIN ANALYZE, comparing statistics with a particular focus on execution time and buffers hit.
```SQL
DROP INDEX orders.ord_date;

EXPLAIN (ANALYZE, BUFFERS)
SELECT * FROM orders.orders WHERE order_date BETWEEN '2024-01-01' AND '2024-03-01';

CREATE INDEX ord_date ON orders.orders (order_date);
ANALYZE orders.orders;

EXPLAIN (ANALYZE, BUFFERS)
SELECT * FROM orders.orders WHERE order_date BETWEEN '2024-01-01' AND '2024-03-01';
```

Backups:
- Restoring to a backup created with pg_dump using pg_restore.

RBAC:
- Ensure each role can only access the schemas and tables they are granted permission to, and that they only have the ability to execute commands in those schemas and tables that they have been granted.
```SQL
SET ROLE accounting;

-- Fail
SELECT * FROM orders.orders;
DELETE FROM expenses.payroll WHERE payroll_id = 1;

-- Succeed
SELECT * FROM expenses.payroll LIMIT 5;


SET ROLE sales;

-- Fail
SELECT * FROM expenses.payroll;
DELETE FROM orders.order_items WHERE order_item_id = 1;

-- Succeed
SELECT * FROM orders.orders LIMIT 5;

SET ROLE owner;

-- Can run any command
SELECT * FROM orders.orders LIMIT 5;
SELECT * FROM expenses.payroll LIMIT 5;

BEGIN;
DELETE FROM expenses.payroll WHERE payroll_id = 1;
DELETE FROM orders.order_items WHERE order_item_id = 1;
ROLLBACK;
```

## Repository Structure

All SQL files are stored in the SQL folder, and the backup text file is stored in the backup folder. The README.md contains instructions for running the files in the SQL folder.
```
|--- backup folder ---
|                    |
|                    |--- backup_commands.txt
|
|--- sql folder ---
|                  |
|                  |--- data.sql
|                  |--- indexes.sql
|                  |--- roles.sql
|                  |--- schemas.sql
|                  |--- tables.sql
|
|--- README.md
```
