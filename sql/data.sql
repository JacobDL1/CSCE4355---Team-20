-- Orders Schema Data
INSERT INTO orders.customers (customer_name, email) 
SELECT 'Customer ' || g, 'customer' || g || '@email.com' 
FROM generate_series(1, 1000) AS g;

INSERT INTO orders.products (product_name, price) 
SELECT 'Product ' || g, (10 + (g % 50))::numeric(10,2) 
FROM generate_series(1, 100) AS g;

INSERT INTO orders.orders (customer_id, order_date) 
SELECT (g % 1000) + 1, DATE '2024-01-01' + (g % 1000) 
FROM generate_series(1, 10000) AS g;

INSERT INTO orders.order_items (order_id, product_id, quantity, unit_price) 
SELECT (g % 10000) + 1, (g % 100) + 1, (g % 5) + 1, (10 + (g % 50))::numeric(10,2) 
FROM generate_series(1, 50000) AS g;

-- Expenses Schema Data
INSERT INTO expenses.payroll (employee_name, amount, payment_date) 
SELECT 'Employee ' || g, 3000.00, DATE '2024-01-01' + (g % 365) 
FROM generate_series(1, 500) AS g;

INSERT INTO expenses.rent (property_name, amount, payment_date) 
SELECT 'Property ' || g, 2500.00, DATE '2024-01-01' + (g % 365) 
FROM generate_series(1, 100) AS g;

INSERT INTO expenses.utilities (utility_type, amount, payment_date) 
SELECT 'Utility ' || g, (150 + (g % 100))::numeric(10,2), DATE '2024-01-01' + (g % 365) 
FROM generate_series(1, 200) AS g;

INSERT INTO expenses.vendors (vendor_name, amount, payment_date) 
SELECT 'Vendor ' || g, (100 + (g % 500))::numeric(10,2), DATE '2024-01-01' + (g % 365) 
FROM generate_series(1, 500) AS g;