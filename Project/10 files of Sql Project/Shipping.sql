use OnlineRetailStore;
-- Shipping Table
CREATE TABLE Shipping (
    shipping_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    shipping_date DATETIME,
    tracking_number VARCHAR(100),
    shipping_method VARCHAR(100),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);

-- Insert values into Shipping table
INSERT INTO Shipping (order_id, shipping_date, tracking_number, shipping_method)
VALUES (1, '2024-05-25 12:00:00', '1234567890', 'Standard Shipping'),
       (2, '2024-05-24 16:00:00', '9876543210', 'Express Shipping'),
       (3, '2024-05-23 14:00:00', '1112223334', 'Standard Shipping'),
       (4, '2024-05-25 14:00:00', '4445556667', 'Express Shipping');