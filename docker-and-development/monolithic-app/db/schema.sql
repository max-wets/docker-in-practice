-- Creates a new role with named 'max'
CREATE ROLE max 
LOGIN
PASSWORD 'Postgr@s321!';

-- creates a schema
CREATE SCHEMA scm 
    CREATE TABLE deliveries(
        id SERIAL NOT NULL, 
        customer_id INT NOT NULL, 
        ship_date DATE NOT NULL
    )
    CREATE VIEW delivery_due_list AS 
        SELECT ID, ship_date 
        FROM deliveries 
        WHERE ship_date <= CURRENT_DATE;