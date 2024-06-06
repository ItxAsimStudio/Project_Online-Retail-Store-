use OnlineRetailStore;
-- Payments Table
CREATE TABLE Payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    payment_date DATETIME,
    payment_method VARCHAR(100),
    amount DECIMAL(10, 2),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);

-- Insert values into Payments table
INSERT INTO Payments (order_id, payment_date, payment_method, amount)
VALUES (1, '2024-05-25 10:00:00', 'Credit Card', 39.98),
       (2, '2024-05-24 15:00:00', 'PayPal', 59.98),
       (3, '2024-05-23 12:00:00', 'Credit Card', 29.97),
       (4, '2024-05-25 13:00:00', 'Google Pay', 44.97);
       
-- Query 50: Retrieve payments made using 'Credit Card'
SELECT payment_id FROM Payments WHERE payment_method = 'Credit Card';