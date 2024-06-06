use OnlineRetailStore;
-- Promotions Table
CREATE TABLE Promotions (
    promotion_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    start_date DATE,
    end_date DATE,
    discount_percentage DECIMAL(5, 2)
);

-- Insert values into Promotions table
INSERT INTO Promotions (name, start_date, end_date, discount_percentage)
VALUES ('Spring Sale', '2024-05-20', '2024-06-20', 15.00),
       ('Back to School Sale', '2024-08-01', '2024-08-31', 20.00),
       ('Holiday Promotion', '2024-12-01', '2024-12-31', 10.00);