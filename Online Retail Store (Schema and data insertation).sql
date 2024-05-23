CREATE DATABASE OnlineRetailStore;
USE OnlineRetailStore;

-- Customers Table
CREATE TABLE Customers (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100) UNIQUE,
    Password VARCHAR(255),
    Address VARCHAR(255),
    City VARCHAR(50),
    State VARCHAR(50),
    ZipCode VARCHAR(10),
    Country VARCHAR(50),
    RegistrationDate DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Products Table
CREATE TABLE Products (
    ProductID INT AUTO_INCREMENT PRIMARY KEY,
    ProductName VARCHAR(100),
    Description TEXT,
    Price DECIMAL(10, 2),
    Stock INT,
    Category VARCHAR(50),
    ImageURL VARCHAR(255),
    CreatedAt DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Orders Table
CREATE TABLE Orders (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT,
    OrderDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Status VARCHAR(50),
    TotalAmount DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Orderitems Table
CREATE TABLE OrderItems (
    OrderItemID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);
-- Categories Table
CREATE TABLE Categories (
    CategoryID INT AUTO_INCREMENT PRIMARY KEY,
    CategoryName VARCHAR(50),
    Description TEXT,
    CreatedAt DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- ProductCategories Table
CREATE TABLE ProductCategories (
    ProductID INT,
    CategoryID INT,
    PRIMARY KEY (ProductID, CategoryID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);

-- Suppliers Table
CREATE TABLE Suppliers (
    SupplierID INT AUTO_INCREMENT PRIMARY KEY,
    SupplierName VARCHAR(100),
    ContactName VARCHAR(50),
    Address VARCHAR(255),
    City VARCHAR(50),
    Country VARCHAR(50),
    Phone VARCHAR(20),
    Email VARCHAR(100)
);

-- Reviews Table
CREATE TABLE Reviews (
    ReviewID INT AUTO_INCREMENT PRIMARY KEY,
    ProductID INT,
    CustomerID INT,
    Rating INT,
    ReviewText TEXT,
    ReviewDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Shippers Table
CREATE TABLE Shippers (
    ShipperID INT AUTO_INCREMENT PRIMARY KEY,
    ShipperName VARCHAR(100)
  
);
alter table shippers add phone varchar(20);


-- Payments Table
CREATE TABLE Payments (
    PaymentID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT,
    PaymentDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    Amount DECIMAL(10, 2),
    PaymentMethod VARCHAR(50),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Coupons Table
CREATE TABLE Coupons (
    CouponID INT AUTO_INCREMENT PRIMARY KEY,
    CouponCode VARCHAR(50) UNIQUE,
    Discount DECIMAL(5, 2),
    ExpiryDate DATE
    
);

-- ProductImages Table
CREATE TABLE ProductImages (
    ImageID INT AUTO_INCREMENT PRIMARY KEY,
    ProductID INT,
    ImageURL VARCHAR(255),
    Caption VARCHAR(255),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Inventory Table
CREATE TABLE Inventory (
    InventoryID INT AUTO_INCREMENT PRIMARY KEY,
    ProductID INT,
    SupplierID INT,
    Quantity INT,
    ReceivedDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
    FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID)
);

-- Sample Data Insertion
INSERT INTO Customers (FirstName, LastName, Email, Password, Address, City, State, ZipCode, Country)
VALUES 
('Aasim', 'Nazim', 'itxasim7110@example.com', 'password123', '123 Elm St', 'Springfield', 'IL', '62701', 'Pakistan'),
('Huzaifa ', 'Dildar', 'huzaifadildar5@example.com', 'password456', '456 Oak St', 'Shelbyville', 'IL', '62702', 'Pakistan'),
('Bilawal ', 'Azeem', 'Bilawalazeem75@example.com', 'password456', '456 Oak St', 'Shelbyville', 'IL', '62702', 'Pakistan');

INSERT INTO Products (ProductName, Description, Price, Stock, Category, ImageURL)
VALUES 
('Laptop', 'A high performance laptop', 999.99, 10, 'Electronics', 'http://example.com/laptop.jpg'),
('Smartphone', 'A latest model smartphone', 799.99, 20, 'Electronics', 'http://example.com/smartphone.jpg'),
('Tablet', 'A new generation tablet', 499.99, 15, 'Electronics', 'http://example.com/tablet.jpg');

INSERT INTO Orders (CustomerID, Status, TotalAmount) VALUES 
(1, 'Processing', 1019.98),
(2, 'Shipped', 69.98);

INSERT INTO OrderItems (OrderID, ProductID, Quantity, Price) VALUES 
(1, 1, 1, 999.99),
(1, 2, 1, 19.99),
(2, 3, 1, 49.99),
(2, 2, 1, 19.99);

INSERT INTO Categories (CategoryName, Description)
VALUES 
('Electronics', 'Electronic gadgets and devices'),
('Books', 'Various kinds of books');

INSERT INTO ProductCategories (ProductID, CategoryID)
VALUES 
(1, 1),
(2, 1);

INSERT INTO Suppliers (SupplierName, ContactName, Address, City, Country, Phone, Email)
VALUES 
('Tech Supplies Co.', 'Alice Johnson', '789 Pine St', 'Capital City', 'USA', '555-9012', 'alice.johnson@techsupplies.com');

INSERT INTO Reviews (ProductID, CustomerID, Rating, ReviewText)
VALUES 
(1, 1, 5, 'Excellent laptop, very satisfied with the performance!');

INSERT INTO Shippers (ShipperName, Phone)
VALUES 
('FastShip', '555-1234'),
('QuickDeliver', '555-5678');

INSERT INTO Payments (OrderID, Amount, PaymentMethod)
VALUES 
(1, 999.99, 'Credit Card'),
(2, 799.99, 'PayPal');

INSERT INTO Coupons (CouponCode, Discount, ExpiryDate)
VALUES 
('SUMMER20', 20.00, '2024-08-31');

INSERT INTO ProductImages (ProductID, ImageURL, Caption)
VALUES 
(1, 'http://example.com/laptop1.jpg', 'Front View'),
(2, 'http://example.com/smartphone1.jpg', 'Side View');

INSERT INTO Inventory (ProductID, SupplierID, Quantity)
VALUES 
(1, 1, 50),
(2, 1, 100);

