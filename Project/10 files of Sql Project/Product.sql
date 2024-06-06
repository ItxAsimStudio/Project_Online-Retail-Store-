use OnlineRetailStore;
-- Products Table
CREATE TABLE Products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    description TEXT,
    price DECIMAL(10, 2),
    stock_quantity INT,
    last_updated DATETIME
);

-- Insert values into Products table
INSERT INTO Products (name, description, price, stock_quantity, last_updated)
VALUES ('Product A', 'Description of Product A', 19.99, 50, '2024-05-25 08:00:00'),
       ('Product B', 'Description of Product B', 29.99, 30, '2024-05-24 12:00:00'),
       ('Product C', 'Description of Product C', 9.99, 100, '2024-05-23 09:00:00'),
       ('Product D', 'Description of Product D', 14.99, 80, '2024-05-25 10:00:00');
       
-- Query 2: Retrieve product details along with their categories
SELECT p.name AS product_name, p.price, c.name AS category_name
FROM Products p
JOIN Categories c ON p.category_id = c.category_id;

-- Query 9: Find the latest product update date
SELECT MAX(last_updated) AS latest_update
FROM Products;

-- Query 23: Round product prices to two decimal places
SELECT name, ROUND(price, 2) AS rounded_price
FROM Products;

-- Query 29: Extract first 3 characters of product name
SELECT product_id, SUBSTRING(name, 1, 3) AS short_name
FROM Products;

-- Query 32: Combine results of two queries
(SELECT product_id, name FROM Products WHERE price > 50)
UNION
(SELECT product_id, name FROM Products WHERE stock_quantity < 10);

-- Query 33: Retrieve the latest review for each product
SELECT p.product_id, p.name AS product_name, r.rating, r.review_text, r.review_date
FROM Products p
JOIN Reviews r ON p.product_id = r.product_id
ORDER BY r.review_date DESC;

-- Query 37: Retrieve products with a price greater than $50 and a stock quantity less than 10
SELECT *
FROM Products
WHERE price > 1000 AND stock_quantity < 20;


-- Query 39: Retrieve products with a description longer than 100 characters
SELECT *
FROM Products
WHERE LENGTH(description) > 20;

-- Query 40: Convert product names to uppercase
SELECT UPPER(name) AS upper_product_name
FROM Products;

-- Query 44: Retrieve the index of the first occurrence of 'o' in product names
SELECT name, LOCATE('o', name) AS o_index
FROM Products;


