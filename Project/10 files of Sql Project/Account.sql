use OnlineRetailStore;
-- Accounts Table
CREATE TABLE Accounts (
    account_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    username VARCHAR(100),
    password VARCHAR(100),
    account_created_date DATETIME,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- Insert values into Accounts table
INSERT INTO Accounts (customer_id, username, password, account_created_date)
VALUES (1, 'alicesmith', 'password123', '2024-05-23 08:00:00'),
       (2, 'bobjohnson', 'securepwd', '2024-05-24 10:00:00'),
       (3, 'evabrown', 'password567', '2024-05-25 09:00:00'),
       (4, 'davidlee', 'david123', '2024-05-25 11:00:00');