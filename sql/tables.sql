-- Expenses schema

CREATE TABLE expenses.payroll (
    payroll_id SERIAL PRIMARY KEY,
    employee_name VARCHAR(100) NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    payment_date DATE NOT NULL
);

CREATE TABLE expenses.rent (
    rent_id SERIAL PRIMARY KEY,
    property_name VARCHAR(100) NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    payment_date DATE NOT NULL
);

CREATE TABLE expenses.utilities (
    utility_id SERIAL PRIMARY KEY,
    utility_type VARCHAR(100) NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    payment_date DATE NOT NULL
);

CREATE TABLE expenses.vendors (
    vendor_id SERIAL PRIMARY KEY,
    vendor_name VARCHAR(100) NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    payment_date DATE NOT NULL
);

-- Orders schema

CREATE TABLE orders.customers (
    customer_id SERIAL PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    email VARCHAR(100)
);

CREATE TABLE orders.products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) NOT NULL
);

CREATE TABLE orders.orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INT NOT NULL REFERENCES orders.customers(customer_id),
    order_date DATE NOT NULL
);

CREATE TABLE orders.order_items (
    order_item_id SERIAL PRIMARY KEY,
    order_id INT NOT NULL REFERENCES orders.orders(order_id),
    product_id INT NOT NULL REFERENCES orders.products(product_id),
    quantity INT NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL
);
