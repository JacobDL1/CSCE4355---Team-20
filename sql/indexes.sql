-- Orders indexes

-- Good for queries searching for orders across a date range
CREATE INDEX ord_date ON orders.orders (order_date);

-- Good for searching for information on a specific customer
CREATE INDEX ord_customer_name ON orders.customers (customer_name);

-- Good for searching for information on a specific product
CREATE INDEX ord_product_name ON orders.products (product_name);

-- Foreign key indexes, good for joins and lookups to find who specifically ordered what items
CREATE INDEX ord_foreign_customer_id ON orders.orders (customer_id);
CREATE INDEX ord_foreign_order_id ON orders.order_items (order_id);
CREATE INDEX ord_foreign_product_id ON orders.order_items (product_id);

-- Expenses indexes

-- Good for queries searching for expense data across a date range
CREATE INDEX exp_payroll_range ON expenses.payroll (payment_date);
CREATE INDEX exp_rent_range ON expenses.rent (payment_date);
CREATE INDEX exp_utilities_range ON expenses.utilities (payment_date);
CREATE INDEX exp_vendors_range ON expenses.vendors (payment_date);

-- Good for searching expenses by who money is going to
CREATE INDEX exp_payroll_name ON expenses.payroll (employee_name);
CREATE INDEX exp_rent_name ON expenses.rent (property_name);
CREATE INDEX exp_utilities_name ON expenses.utilities (utility_type);
CREATE INDEX exp_vendors_name ON expenses.vendors (vendor_name);

-- Update planner statistics after index creation
ANALYZE;
