CREATE TABLE expenses.payroll (
    payroll_id SERIAL PRIMARY KEY,
    employee_name VARCHAR(100) NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    payment_date DATE NOT NULL
);
