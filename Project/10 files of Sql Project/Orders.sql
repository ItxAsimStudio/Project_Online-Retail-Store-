use OnlineRetailStore;
-- Orders Table
CREATE TABLE Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10, 2),
    status VARCHAR(50),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);
-- Insert values into Orders table
INSERT INTO Orders (customer_id, order_date, total_amount, status)
VALUES (1, '2024-05-25', 39.98, 'Pending'),
       (2, '2024-05-24', 59.98, 'Completed'),
       (3, '2024-05-23', 29.97, 'Shipped'),
       (4, '2024-05-25', 44.97, 'Pending');
       
-- Query 4: Retrieve orders with total amount greater than average total amount
SELECT *
FROM Orders
WHERE total_amount > (SELECT AVG(total_amount) FROM Orders);


-- Query 6: Retrieve order details along with product information
SELECT o.order_id, oi.product_id, p.name AS product_name, oi.quantity, oi.unit_price
FROM Orders o
JOIN Order_Items oi ON o.order_id = oi.order_id
JOIN Products p ON oi.product_id = p.product_id;

-- Query 7: Retrieve orders placed in May 2024
SELECT *
FROM Orders
WHERE MONTH(order_date) = 5 AND YEAR(order_date) = 2024;

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

-- Query 27: Find the oldest and newest order dates
SELECT MIN(order_date) AS oldest_order_date, MAX(order_date) AS newest_order_date
FROM Orders;

-- Query 34: Retrieve orders placed by specific customers
SELECT *
FROM Orders
WHERE customer_id IN (1, 2, 3);

-- Query 36: Retrieve the top 3 most recent orders
SELECT *
FROM Orders
ORDER BY order_date DESC
LIMIT 3;
-- Query 38: Retrieve orders placed on weekends (Saturday or Sunday)
SELECT *
FROM Orders
WHERE DAYOFWEEK(order_date) IN (1, 7);