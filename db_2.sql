-- =========================================
-- DB2 - USA Fragment
-- =========================================

DROP TABLE IF EXISTS customers_colombia;
DROP TABLE IF EXISTS customers_usa;

-- TABLA
CREATE TABLE customers_usa (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    country VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Daticos de los gringos
INSERT INTO customers_usa
(first_name, last_name, email, country)
VALUES
('John', 'Smith', 'john@test.com', 'USA'),
('Mike', 'Brown', 'mike@test.com', 'USA'),
('Sarah', 'White', 'sarah@test.com', 'USA');

-- Coneccion con la tabla DB1
CREATE TABLE customers_colombia (
    customer_id INT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    country VARCHAR(50),
    created_at TIMESTAMP
)
ENGINE=FEDERATED
CONNECTION='mysql://root:123456@db_1:3306/customers/customers_colombia';

-- Test de esta vaina
SELECT * FROM customers_colombia
UNION
SELECT * FROM customers_usa;