# Small Business Expense Tracking Database

CSCE 4355 - Team 20
Rishav Dahal
Jacob Choe
Jacob Lamb

## Overview

This project aims to help small business's track order and expenses data by providing a database to replace the conventional use of spreadsheets in data tracking.
Our database implements schemas, tables, RBAC, indexes, and backups to efficiently support data storage and retrieval.

## Database Setup and Execution Instructions

1. Clone the Repository:
```bash
git clone https://github.com/JacobDL1/CSCE4355---Team-20.git
```

2. After navigating to the folder where the repo was cloned to, create the database:
```bash
psql -U postgres -c "CREATE DATABASE small_business;"
```

3. Run the following commands to execute the SQL files:
```bash
psql -U postgres -d small_business -f sql/schemas.sql
psql -U postgres -d small_business -f sql/tables.sql
psql -U postgres -d small_business -f sql/data.sql
psql -U postgres -d small_business -f sql/roles.sql
psql -U postgres -d small_business -f sql/indexes.sql
```

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

Expenses Schema:
- ord_date
- ord_customer_name
- ord_product_name
- ord_foreign_customer_id
- ord_foreign_order_id
- ord_foreign_product_id

Orders Schema:
- exp_payroll_range
- exp_rent_range
- exp_utilities_range
- exp_vendors_range
- exp_payroll_name
- exp_rent_name
- exp_utilities_name
- exp_vendors_name

## Backups

The backups.txt file outlines what commands to use for different backup-related scenarios. we use pg_dump to create backups and pg_restore to restore the database to a backup.

## Repository Structure

All SQL files are stored in the SQL folder, and the backup text file is stored in the backup folder. The README.md contains instructions for running the the files in the SQL folder.
