
DROP TABLE IF EXISTS customers_usa;
DROP TABLE IF EXISTS customers_colombia;

CREATE TABLE customers_colombia (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    country VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO customers_colombia
(first_name, last_name, email, country)
VALUES
('Juan', 'Perez', 'juan@test.com', 'Colombia'),
('Ana', 'Gomez', 'ana@test.com', 'Colombia'),
('Carlos', 'Lopez', 'carlos@test.com', 'Colombia');

CREATE TABLE customers_usa (
    customer_id INT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    country VARCHAR(50),
    created_at TIMESTAMP
)
ENGINE=FEDERATED
CONNECTION='mysql://root:123456@db_2:3306/customers/customers_usa';

-- Testeando ando
SELECT * FROM customers_colombia
UNION
SELECT * FROM customers_usa;