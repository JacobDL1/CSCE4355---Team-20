# Small Business Expense Tracking Database

CSCE 4355 - Team 20
Rishav Dahal
Jacob Choe
Jacob Lamb

## Overview

This project aims to help small business's track order and expenses data by providing a database to replace the conventional use of spreadsheets in data tracking.
Our database implements schemas, tables, RBAC, indexes, and backups to efficiently support data storage and retrieval.

## Database Setup

1. Connect to PostgreSQL.
2. Create a database named small_business.
3. Connect to the small_business database.
4. Run sql/schemas.sql to create the two schemas.
5. Run sql/tables.sql to create the eight tables.
6. Run sql/roles to create the three roles.
7. Run sql/index to create the fourteen indexes.

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

## Repository Structure

All SQL files are stored in the SQL folder, and the README.md contains instructions for running the the files in the SQL folder.
