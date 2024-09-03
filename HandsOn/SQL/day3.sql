use company;

--mathamatical functions

SELECT ProductName, Price, ROUND (Price, 2) AS RoundedPrice FROM Products;
SELECT ProductName, Price, CEILING (Price) AS CeilingPrice FROM Products;
SELECT ProductName, Price, FLOOR (Price) AS FloorPrice FROM Products;
SELECT ProductName, Price, SQRT (Price) AS SquareRootPrice FROM Products;
SELECT ProductName, Price, POWER (Price, 2) AS PriceSquared FROM Products;

SELECT ABS (MAX (Price) - MIN(Price)) AS PriceDifference FROM Products;
SELECT ProductName, Price, ROUND (RAND()* 100, 2) AS RandomDiscountPercentage FROM Products;
SELECT ProductName, Price, LOG(Price) AS LogarithmPrice FROM Products;

--Scenario: Apply a 15% discount, round the discounted price
--to 2 decimal places, and show both the ceiling and floor 
--values of the final discounted price.

SELECT
ProductName,
Price,
ROUND (Price * 0.85, 2) AS DiscountedPrice,
CEILING (ROUND (Price * 0.85, 2)) AS CeilingDiscountedPrice,
FLOOR (ROUND (Price * 0.85, 2)) AS FloorDiscountedPrice
FROM Products;

SELECT SUM (TotalAmount) AS TotalSales FROM Orders;
SELECT AVG(Price) AS AveragePrice FROM Products;
SELECT COUNT (OrderID) AS TotalOrders FROM Orders;
SELECT MIN (Price) AS MinPrice, MAX (Price) AS MaxPrice FROM Products;
SELECT Category, COUNT (ProductID) AS ProductCount FROM Products GROUP BY Category;


create procedure getallproducts 
as 
begin
select * from products;
end;

--stored procedure with parameter

CREATE PROCEDURE GetProductByID @ProductID INT
AS
BEGIN
SELECT *
FROM Products
WHERE ProductID = @ProductID;
END;
EXEC GetProductByID @ProductID = 1;

--stored procedure with 2 parameter

CREATE PROCEDURE GetProductsByCategoryAndPrice
@Category VARCHAR(50),
@MinPrice DECIMAL (10, 2)
AS

BEGIN
SELECT *
FROM Products
WHERE Category = @Category
AND Price >= @MinPrice;
END;
--EXEC GetProductsByCategoryAndPrice @Category = 'Electronics', @MinPrice = 500.00;