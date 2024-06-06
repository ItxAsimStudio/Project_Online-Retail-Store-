use OnlineRetailStore;
-- Customers Table
CREATE TABLE Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    phone_number VARCHAR(20),
    registration_date DATE
);

-- Insert values into Customers table
INSERT INTO Customers (name, email, phone_number, registration_date)
VALUES ('Alice Smith', 'alice@example.com', '111-222-3333', '2024-05-23'),
       ('Bob Johnson', 'bob@example.com', '444-555-6666', '2024-05-24'),
       ('Eva Brown', 'eva@example.com', '777-888-9999', '2024-05-25'),
       ('David Lee', 'david@example.com', '123-456-7890', '2024-05-25');
       
-- Query 1: Retrieve customer details along with their orders
SELECT c.name, c.email, o.order_id, o.order_date
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id;

-- Query 3: Count the number of orders for each customer
SELECT c.name, COUNT(o.order_id) AS num_orders
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id;

-- Query 8: Search for customers with 'John' in their name
SELECT *
FROM Customers
WHERE name LIKE '%John%';

-- Query 14: Find customers who have not placed any orders
SELECT *
FROM Customers
WHERE customer_id NOT IN (SELECT DISTINCT customer_id FROM Orders);

-- Query 22: Find customers who have submitted reviews
SELECT DISTINCT c.customer_id, c.name
FROM Customers c
WHERE EXISTS (
    SELECT 1
    FROM Reviews r
    WHERE r.customer_id = c.customer_id
);

-- Query 35: Retrieve top 3 customers with highest total order amount
SELECT c.customer_id, c.name, SUM(o.total_amount) AS total_order_amount
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id
ORDER BY total_order_amount DESC
LIMIT 3;

-- Query 41: Convert customer names to lowercase
SELECT LOWER(name) AS lower_customer_name
FROM Customers;

-- Query 42: Concatenate customer names and email addresses
SELECT CONCAT(name, ' - ', email) AS customer_info
FROM Customers;

-- Query 43: Retrieve the index of the '@' symbol in email addresses
SELECT email, LOCATE('@', email) AS at_symbol_index
FROM Customers;
FROM Customers;