--exercise day3

--1. Calculate the total amount spent by each customer.
SELECT CustomerId, SUM(Amount) AS TotalAmount FROM Orders
GROUP BY CustomerId;

--2. Find customers who have spent more than $1,000 in total.
SELECT CustomerId, SUM(Amount) AS TotalAmount FROM Orders
GROUP BY CustomerId www HAVING SUM(Amount) > 1000;

--3. Find Product Categories with More Than 5 Products
SELECT Category, COUNT (ProductID) AS NumberOfProducts 
FROM Product 
GROUP BY Category 
HAVING COUNT (ProductID) > 5;

--4. Calculate the total number of products for each category and supplier combination.
SELECT p.CategoryId, s. SupplierId, s. SupplierName, 
COUNT (p.ProductId) AS TotalProducts 
FROM Products p JOIN Supplier s 
ON p. SupplierId = s. SupplierId 
GROUP BY p. CategoryId, s. SupplierId, s. SupplierName;

--5.Summarize total sales by product and customer, and also provide an overall total.


--stored procedure

--Stored Procedure with Insert Operation

CREATE PROCEDURE InsertCustomer
    @CustomerID INT,
    @CustomerName VARCHAR(100),
    @BirthDate DATE
AS
BEGIN
    INSERT INTO Customers (CustomerID, CustomerName, BirthDate)
    VALUES (@CustomerID, @CustomerName, @BirthDate);
END;

--Stored Procedure with Update Operation

CREATE PROCEDURE UpdateCustomer
    @CustomerID INT,
    @CustomerName VARCHAR(100),
    @BirthDate DATE
AS
BEGIN
    UPDATE Customers
    SET CustomerName = @CustomerName,
        BirthDate = @BirthDate
    WHERE CustomerID = @CustomerID;
END;

--Stored Procedure with Delete Operation

CREATE PROCEDURE DeleteCustomer
    @CustomerID INT
AS
BEGIN
    DELETE FROM Customers
    WHERE CustomerID = @CustomerID;
END;