use OnlineRetailStore;
-- Categories Table
CREATE TABLE Categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100)
);

-- Insert values into Categories table
INSERT INTO Categories (name)
VALUES ('Electronics'), ('Clothing'), ('Books'), ('Toys');

-- Query 5: List unique categories
SELECT DISTINCT name
FROM Categories;