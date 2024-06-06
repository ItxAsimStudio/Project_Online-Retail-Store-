use OnlineRetailStore;
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


-- Insert values into Reviews table
INSERT INTO Reviews (product_id, customer_id, rating, review_text, review_date)
VALUES (1, 1, 5, 'Excellent product!', '2024-05-25 10:00:00'),
       (2, 2, 4, 'Great product, fast delivery', '2024-05-24 14:00:00'),
       (3, 3, 3, 'Average product, could be better', '2024-05-23 11:00:00'),
       (4, 4, 5, 'Awesome product, highly recommended', '2024-05-25 12:00:00');
       
-- Query 45: Retrieve products with an average rating greater than 4
SELECT product_id, AVG(rating) AS avg_rating
FROM Reviews
GROUP BY product_id
HAVING avg_rating > 4;

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

-- Query 51: Retrieve reviews with a rating of 5
SELECT review_id FROM Reviews WHERE rating = 5;

       
-- Query 24: Calculate average product rating
SELECT product_id, AVG(rating) AS avg_rating
FROM Reviews
GROUP BY product_id;