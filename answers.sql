USE salesdb;
/**
Question 1 Achieving 1NF (First Normal Form)
In the table above, the Products column contains multiple values, which violates 1NF.
Write an SQL query to transform this table into 1NF, ensuring that
each row represents a single product for an order
**/
-- created table ProductDetail
CREATE TABLE ProductDetail(
	OrderID INT,
    CustomerName VARCHAR(100) NOT NULL,
    Product VARCHAR(50)
);
INSERT INTO ProductDetail (OrderID, CustomerName, Product)
VALUES
(101, 'John Doe', 'Laptop'),
(101, 'John Doe', 'Mouse'),
(102, 'Jane Smith', 'Tablet'),
(102, 'Jane Smith', 'Keyboard'),
(102, 'Jane Smith', 'Mouse'),
(103, 'Emily Clark', 'Phone');
SELECT * FROM ProductDetail;
/**
Question 2 Achieving 2NF (Second Normal Form) 
In the table above, the CustomerName column depends on
OrderID (a partial dependency), which violates 2NF.

Write an SQL query to transform this table into 2NF by removing
partial dependencies. Ensure that each non-key column
fully depends on the entire primary key.
**/
ALTER TABLE orders
ADD COLUMN OrderID INT;

ALTER TABLE Orders
ADD COLUMN CustomerName VARCHAR(100);

CREATE TABLE salesdb.OrderItems (
    OrderID INT,
    Product VARCHAR(100),
    Quantity INT,
    PRIMARY KEY (OrderID, Product),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);
INSERT INTO salesdb.OrderItems (OrderID, Product, Quantity)
SELECT OrderID, Product, Quantity FROM salesdb.OrderDetails;