-- Create roles

CREATE ROLE owner;
CREATE ROLE accounting;
CREATE ROLE sales;

-- Owner permissions

GRANT ALL PRIVILEGES ON SCHEMA expenses, orders TO owner;

GRANT ALL PRIVILEGES ON ALL TABLES
IN SCHEMA expenses, orders TO owner;

GRANT ALL PRIVILEGES ON ALL SEQUENCES
IN SCHEMA expenses, orders TO owner;

-- Accounting permissions

GRANT USAGE ON SCHEMA expenses TO accounting;

GRANT SELECT, INSERT, UPDATE ON ALL TABLES
IN SCHEMA expenses TO accounting;

GRANT USAGE ON ALL SEQUENCES
IN SCHEMA expenses TO accounting;

-- Sales permissions

GRANT USAGE ON SCHEMA orders TO sales;

GRANT SELECT, INSERT, UPDATE ON ALL TABLES
IN SCHEMA orders TO sales;

GRANT USAGE ON ALL SEQUENCES
IN SCHEMA orders TO sales;
