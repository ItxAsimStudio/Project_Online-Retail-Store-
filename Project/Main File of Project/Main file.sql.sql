CREATE DATABASE OnlineRetailStore;
USE OnlineRetailStore;

-- Customers Table
CREATE TABLE Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    phone_number VARCHAR(20),
    registration_date DATE
);

-- Products Table
CREATE TABLE Products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    description TEXT,
    price DECIMAL(10, 2),
    stock_quantity INT,
    last_updated DATETIME
);

-- Categories Table
CREATE TABLE Categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100)
);

-- Orders Table
CREATE TABLE Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10, 2),
    status VARCHAR(50),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- Order_Items Table
CREATE TABLE Order_Items (
    order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    unit_price DECIMAL(10, 2),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

-- Reviews Table
CREATE TABLE Reviews (
    review_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    customer_id INT,
    rating INT,
    review_text TEXT,
    review_date DATETIME,
    FOREIGN KEY (product_id) REFERENCES Products(product_id),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- Accounts Table
CREATE TABLE Accounts (
    account_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    username VARCHAR(100),
    password VARCHAR(100),
    account_created_date DATETIME,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- Payments Table
CREATE TABLE Payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    payment_date DATETIME,
    payment_method VARCHAR(100),
    amount DECIMAL(10, 2),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);

-- Promotions Table
CREATE TABLE Promotions (
    promotion_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    start_date DATE,
    end_date DATE,
    discount_percentage DECIMAL(5, 2)
);

-- Shipping Table
CREATE TABLE Shipping (
    shipping_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    shipping_date DATETIME,
    tracking_number VARCHAR(100),
    shipping_method VARCHAR(100),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);

-- Insert values into Customers table
INSERT INTO Customers (name, email, phone_number, registration_date)
VALUES ('Alice Smith', 'alice@example.com', '111-222-3333', '2024-05-23'),
       ('Bob Johnson', 'bob@example.com', '444-555-6666', '2024-05-24'),
       ('Eva Brown', 'eva@example.com', '777-888-9999', '2024-05-25'),
       ('David Lee', 'david@example.com', '123-456-7890', '2024-05-25');

-- Insert values into Products table
INSERT INTO Products (name, description, price, stock_quantity, last_updated)
VALUES ('Product A', 'Description of Product A', 19.99, 50, '2024-05-25 08:00:00'),
       ('Product B', 'Description of Product B', 29.99, 30, '2024-05-24 12:00:00'),
       ('Product C', 'Description of Product C', 9.99, 100, '2024-05-23 09:00:00'),
       ('Product D', 'Description of Product D', 14.99, 80, '2024-05-25 10:00:00');

-- Insert values into Categories table
INSERT INTO Categories (name)
VALUES ('Electronics'), ('Clothing'), ('Books'), ('Toys');

-- Insert values into Orders table
INSERT INTO Orders (customer_id, order_date, total_amount, status)
VALUES (1, '2024-05-25', 39.98, 'Pending'),
       (2, '2024-05-24', 59.98, 'Completed'),
       (3, '2024-05-23', 29.97, 'Shipped'),
       (4, '2024-05-25', 44.97, 'Pending');

-- Insert values into Order_Items table
INSERT INTO Order_Items (order_id, product_id, quantity, unit_price)
VALUES (1, 1, 2, 19.99),
       (2, 2, 2, 29.99),
       (3, 3, 3, 9.99),
       (4, 4, 3, 14.99);

-- Insert values into Reviews table
INSERT INTO Reviews (product_id, customer_id, rating, review_text, review_date)
VALUES (1, 1, 5, 'Excellent product!', '2024-05-25 10:00:00'),
       (2, 2, 4, 'Great product, fast delivery', '2024-05-24 14:00:00'),
       (3, 3, 3, 'Average product, could be better', '2024-05-23 11:00:00'),
       (4, 4, 5, 'Awesome product, highly recommended', '2024-05-25 12:00:00');

-- Insert values into Accounts table
INSERT INTO Accounts (customer_id, username, password, account_created_date)
VALUES (1, 'alicesmith', 'password123', '2024-05-23 08:00:00'),
       (2, 'bobjohnson', 'securepwd', '2024-05-24 10:00:00'),
       (3, 'evabrown', 'password567', '2024-05-25 09:00:00'),
       (4, 'davidlee', 'david123', '2024-05-25 11:00:00');

-- Insert values into Payments table
INSERT INTO Payments (order_id, payment_date, payment_method, amount)
VALUES (1, '2024-05-25 10:00:00', 'Credit Card', 39.98),
       (2, '2024-05-24 15:00:00', 'PayPal', 59.98),
       (3, '2024-05-23 12:00:00', 'Credit Card', 29.97),
       (4, '2024-05-25 13:00:00', 'Google Pay', 44.97);

-- Insert values into Promotions table
INSERT INTO Promotions (name, start_date, end_date, discount_percentage)
VALUES ('Spring Sale', '2024-05-20', '2024-06-20', 15.00),
       ('Back to School Sale', '2024-08-01', '2024-08-31', 20.00),
       ('Holiday Promotion', '2024-12-01', '2024-12-31', 10.00);

-- Insert values into Shipping table
INSERT INTO Shipping (order_id, shipping_date, tracking_number, shipping_method)
VALUES (1, '2024-05-25 12:00:00', '1234567890', 'Standard Shipping'),
       (2, '2024-05-24 16:00:00', '9876543210', 'Express Shipping'),
       (3, '2024-05-23 14:00:00', '1112223334', 'Standard Shipping'),
       (4, '2024-05-25 14:00:00', '4445556667', 'Express Shipping');
       
  #Queries#
  -- Query 1: Retrieve customer details along with their orders
SELECT c.name, c.email, o.order_id, o.order_date
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id;

-- Query 2: Retrieve product details along with their categories
SELECT p.name AS product_name, p.price, c.name AS category_name
FROM Products p
JOIN Categories c ON p.category_id = c.category_id;

-- Query 3: Count the number of orders for each customer
SELECT c.name, COUNT(o.order_id) AS num_orders
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id;

-- Query 4: Retrieve orders with total amount greater than average total amount
SELECT *
FROM Orders
WHERE total_amount > (SELECT AVG(total_amount) FROM Orders);

-- Query 5: List unique categories
SELECT DISTINCT name
FROM Categories;

-- Query 6: Retrieve order details along with product information
SELECT o.order_id, oi.product_id, p.name AS product_name, oi.quantity, oi.unit_price
FROM Orders o
JOIN Order_Items oi ON o.order_id = oi.order_id
JOIN Products p ON oi.product_id = p.product_id;

-- Query 7: Retrieve orders placed in May 2024
SELECT *
FROM Orders
WHERE MONTH(order_date) = 5 AND YEAR(order_date) = 2024;

-- Query 8: Search for customers with 'John' in their name
SELECT *
FROM Customers
WHERE name LIKE '%John%';

-- Query 9: Find the latest product update date
SELECT MAX(last_updated) AS latest_update
FROM Products;

-- Query 10: Retrieve top 5 best-selling products
SELECT product_id, SUM(quantity) AS total_sold
FROM Order_Items
GROUP BY product_id
ORDER BY total_sold DESC
LIMIT 5;

-- Query 11: Retrieve detailed order information including customer and product details
SELECT o.order_id, c.name AS customer_name, p.name AS product_name, oi.quantity, oi.unit_price
FROM Orders o
JOIN Customers c ON o.customer_id = c.customer_id
JOIN Order_Items oi ON o.order_id = oi.order_id
JOIN Products p ON oi.product_id = p.product_id;

-- Query 12: Retrieve orders with formatted order dates
SELECT order_id, DATE_FORMAT(order_date, '%Y-%m-%d') AS formatted_order_date
FROM Orders;

-- Query 13: Count the number of unique customers
SELECT COUNT(DISTINCT customer_id) AS num_customers
FROM Orders;

-- Query 14: Find customers who have not placed any orders
SELECT *
FROM Customers
WHERE customer_id NOT IN (SELECT DISTINCT customer_id FROM Orders);

-- Query 15: Find customers with more than 2 orders
SELECT customer_id, COUNT(*) AS num_orders
FROM Orders
GROUP BY customer_id
HAVING num_orders > 2;

-- Query 16: Retrieve payment details along with order information
SELECT o.order_id, o.order_date, p.payment_date, p.payment_method, p.amount
FROM Orders o
JOIN Payments p ON o.order_id = p.order_id;


-- Query 18: Retrieve orders along with payment information (including those without payments)
SELECT o.order_id, o.order_date, p.payment_date, p.payment_method, p.amount
FROM Orders o
LEFT JOIN Payments p ON o.order_id = p.order_id;

-- Query 19: Calculate total sales amount for each product
SELECT oi.product_id, p.name AS product_name, SUM(oi.quantity * oi.unit_price) AS total_sales
FROM Order_Items oi
JOIN Products p ON oi.product_id = p.product_id
GROUP BY oi.product_id;

-- Query 20: Calculate delivery date by adding 3 days to order date
SELECT order_id, order_date, DATE_ADD(order_date, INTERVAL 3 DAY) AS delivery_date
FROM Orders;

-- Query 21: Categorize orders as 'High' if total amount > 50, 'Medium' if > 20, else 'Low'
SELECT order_id, total_amount,
    CASE
        WHEN total_amount > 50 THEN 'High'
        WHEN total_amount > 20 THEN 'Medium'
        ELSE 'Low'
    END AS order_category
FROM Orders;

-- Query 22: Find customers who have submitted reviews
SELECT DISTINCT c.customer_id, c.name
FROM Customers c
WHERE EXISTS (
    SELECT 1
    FROM Reviews r
    WHERE r.customer_id = c.customer_id
);

-- Query 23: Round product prices to two decimal places
SELECT name, ROUND(price, 2) AS rounded_price
FROM Products;

-- Query 24: Calculate average product rating
SELECT product_id, AVG(rating) AS avg_rating
FROM Reviews
GROUP BY product_id;

-- Query 25: Retrieve orders placed by customers named 'Alice'

-- Query 26: Count the number of unique products sold
SELECT COUNT(DISTINCT product_id) AS num_products_sold
FROM Order_Items;

-- Query 27: Find the oldest and newest order dates
SELECT MIN(order_date) AS oldest_order_date, MAX(order_date) AS newest_order_date
FROM Orders;


-- Query 29: Extract first 3 characters of product name
SELECT product_id, SUBSTRING(name, 1, 3) AS short_name
FROM Products;

-- Query 30: Concatenate product names for each order
SELECT order_id, GROUP_CONCAT(p.name SEPARATOR ', ') AS product_names
FROM Order_Items oi
JOIN Products p ON oi.product_id = p.product_id
GROUP BY order_id;

-- Query 31: Calculate total sales for May 2024
SELECT SUM(oi.quantity * oi.unit_price) AS total_sales
FROM Order_Items oi
JOIN Orders o ON oi.order_id = o.order_id
WHERE YEAR(o.order_date) = 2024 AND MONTH(o.order_date) = 5;

-- Query 32: Combine results of two queries
(SELECT product_id, name FROM Products WHERE price > 50)
UNION
(SELECT product_id, name FROM Products WHERE stock_quantity < 10);

-- Query 33: Retrieve the latest review for each product
SELECT p.product_id, p.name AS product_name, r.rating, r.review_text, r.review_date
FROM Products p
JOIN Reviews r ON p.product_id = r.product_id
ORDER BY r.review_date DESC;

-- Query 34: Retrieve orders placed by specific customers
SELECT *
FROM Orders
WHERE customer_id IN (1, 2, 3);

-- Query 35: Retrieve top 3 customers with highest total order amount
SELECT c.customer_id, c.name, SUM(o.total_amount) AS total_order_amount
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id
ORDER BY total_order_amount DESC
LIMIT 3;
-- Query 36: Retrieve the top 3 most recent orders
SELECT *
FROM Orders
ORDER BY order_date DESC
LIMIT 3;

-- Query 37: Retrieve products with a price greater than $50 and a stock quantity less than 10
SELECT *
FROM Products
WHERE price > 1000 AND stock_quantity < 20;

-- Query 38: Retrieve orders placed on weekends (Saturday or Sunday)
SELECT *
FROM Orders
WHERE DAYOFWEEK(order_date) IN (1, 7);
-- Query 39: Retrieve products with a description longer than 100 characters
SELECT *
FROM Products
WHERE LENGTH(description) > 20;

-- Query 40: Convert product names to uppercase
SELECT UPPER(name) AS upper_product_name
FROM Products;

-- Query 41: Convert customer names to lowercase
SELECT LOWER(name) AS lower_customer_name
FROM Customers;

-- Query 42: Concatenate customer names and email addresses
SELECT CONCAT(name, ' - ', email) AS customer_info
FROM Customers;

-- Query 43: Retrieve the index of the '@' symbol in email addresses
SELECT email, LOCATE('@', email) AS at_symbol_index
FROM Customers;

-- Query 44: Retrieve the index of the first occurrence of 'o' in product names
SELECT name, LOCATE('o', name) AS o_index
FROM Products;

-- Query 45: Retrieve products with an average rating greater than 4
SELECT product_id, AVG(rating) AS avg_rating
FROM Reviews
GROUP BY product_id
HAVING avg_rating > 4;

-- Query 46: Retrieve products that have been ordered more than 5 times
SELECT product_id, COUNT(order_item_id) AS times_ordered
FROM Order_Items
GROUP BY product_id
HAVING times_ordered > 5;

-- Query 47: Retrieve the count of reviews per product
SELECT product_id, COUNT(review_id) AS num_reviews
FROM Reviews
GROUP BY product_id;

-- Query 48: Retrieve the average rating per product
SELECT product_id, AVG(rating) AS avg_rating
FROM Reviews
GROUP BY product_id;

-- Query 49: Retrieve the count of reviews per product
SELECT product_id, COUNT(review_id) AS num_reviews
FROM Reviews
GROUP BY product_id;

-- Query 50: Retrieve payments made using 'Credit Card'
SELECT payment_id FROM Payments WHERE payment_method = 'Credit Card';

-- Query 51: Retrieve reviews with a rating of 5
SELECT review_id FROM Reviews WHERE rating = 5;

       