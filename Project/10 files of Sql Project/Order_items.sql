use OnlineRetailStore;
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

-- Insert values into Order_Items table
INSERT INTO Order_Items (order_id, product_id, quantity, unit_price)
VALUES (1, 1, 2, 19.99),
       (2, 2, 2, 29.99),
       (3, 3, 3, 9.99),
       (4, 4, 3, 14.99);
-- Query 10: Retrieve top 5 best-selling products
SELECT product_id, SUM(quantity) AS total_sold
FROM Order_Items;

-- Query 31: Calculate total sales for May 2024
SELECT SUM(oi.quantity * oi.unit_price) AS total_sales
FROM Order_Items oi
JOIN Orders o ON oi.order_id = o.order_id
WHERE YEAR(o.order_date) = 2024 AND MONTH(o.order_date) = 5;
-- Query 46: Retrieve products that have been ordered more than 5 times
SELECT product_id, COUNT(order_item_id) AS times_ordered
FROM Order_Items
GROUP BY product_id
HAVING times_ordered > 5;
GROUP BY product_id
ORDER BY total_sold DESC
LIMIT 5;

-- Query 19: Calculate total sales amount for each product
SELECT oi.product_id, p.name AS product_name, SUM(oi.quantity * oi.unit_price) AS total_sales
FROM Order_Items oi
JOIN Products p ON oi.product_id = p.product_id
GROUP BY oi.product_id;

-- Query 26: Count the number of unique products sold
SELECT COUNT(DISTINCT product_id) AS num_products_sold
FROM Order_Items;

-- Query 30: Concatenate product names for each order
SELECT order_id, GROUP_CONCAT(p.name SEPARATOR ', ') AS product_names
FROM Order_Items oi
JOIN Products p ON oi.product_id = p.product_id
GROUP BY order_id;