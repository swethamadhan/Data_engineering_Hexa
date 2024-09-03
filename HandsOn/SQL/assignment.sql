CREATE TABLE Customers (
  CustomerID INT PRIMARY KEY ,
  CustomerName VARCHAR(25) NOT NULL,
  Country VARCHAR(25) NOT NULL
);

CREATE TABLE Customer1 (
  CustomerID INT PRIMARY KEY ,
  CustomerName VARCHAR(25) NOT NULL,
  Country VARCHAR(25) NOT NULL
);
insert into customers values(1,'joe','india' ),(2,'roy','france' ),(3,'ira','italy');
insert into customer1 values(1,'joe','india' ),(2,'roy','france' ),(3,'ira','italy');


CREATE TABLE OrderDetails (
OrderDetailID INT PRIMARY KEY,
OrderID INT,
ProductID INT,
Quantity INT);

INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Quantity) VALUES
(1, 1, 1, 2),
(2, 1, 3, 1),
(3, 2, 3, 1),
(4, 3, 5, 4),
(5, 4, 4, 2);

--Date Function Exercises
--Calculate the number of months between your birthday and the current date.
SELECT DATEDIFF(MONTH, '2024-02-11', GETDATE()) AS MonthsSinceBirthday;

--Retrieve all orders that were placed in the last 30 days.
SELECT * FROM Orders
WHERE OrderDate >= DATEADD(DAY, -30, GETDATE());

--Write a query to extract the year, month, and day from the current date.
SELECT YEAR(GETDATE()) AS Year, MONTH(GETDATE()) AS Month, DAY(GETDATE()) AS Day;

--Calculate the difference in years between two given dates.
SELECT DATEDIFF(YEAR, '2003-02-11', '2024-01-09') AS YearDifference;

--Retrieve the last day of the month for a given date.
SELECT EOMONTH('2023-08-22') AS LastDayOfMonth;


--String Function Exercises
--Convert all customer names to uppercase.
SELECT UPPER(CustomerName) AS CustomerNameUpperCase FROM Customers;

--Extract the first 5 characters of each product name.
SELECT LEFT(ProductName, 5) AS First5Char FROM Products;

--Concatenate the product name and category with a hyphen in between.
SELECT ProductName + '-' + Category AS ProductCategory FROM Products;

--Replace the word 'Phone' with 'Device' in all product names.
SELECT REPLACE(ProductName, 'Phone', 'Device') AS UpdatedProductName FROM Products;

--Find the position of the letter 'a' in customer names.
SELECT CHARINDEX('a', CustomerName) AS PositionOfA FROM Customers;


--Aggregate Function Exercises
--Calculate the total sales amount for all orders.
SELECT SUM(TotalAmount) AS TotalSales FROM Orders;

--Find the average price of products in each category.
SELECT Category, AVG(Price) AS Average_Price 
FROM Products 
GROUP BY Category;

--Count the number of orders placed in each month of the year.
SELECT MONTH(OrderDate) AS OrderMonth, COUNT(*) AS OrderCount
FROM Orders
GROUP BY MONTH(OrderDate);

--Find the maximum and minimum order quantities.
SELECT MAX(Quantity) AS MaxQuantity, MIN(Quantity) AS MinQuantity 
FROM Orders;

--Calculate the sum of stock quantities grouped by product category.
SELECT Category, SUM(StockQuantity) AS Total_Stock 
FROM Products 
GROUP BY Category;


--Join Exercises
--Write a query to join the Customers and Orders tables to display customer names and their order details.
SELECT C.CustomerName, O.OrderID, O.OrderDate, O.TotalAmount 
FROM Customers C
INNER JOIN Orders O ON C.CustomerID = O.CustomerID;

--Perform an inner join between Products and Orders to retrieve product names and quantities sold.
SELECT P.ProductName, OD.Quantity
FROM Products P
INNER JOIN OrderDetails OD ON P.ProductID = OD.ProductID;

--Use a left join to display all products, including those that have not been ordered.
SELECT P.ProductName, OD.Quantity
FROM Products P
LEFT JOIN OrderDetails OD ON P.ProductID = OD.ProductID;

--Write a query to join Employees with Departments and list employee names and their respective department names.
SELECT E.EmployeeName, D.DepartmentName 
FROM Employees E
JOIN Departments D ON E.DepartmentID = D.DepartmentID;

--Perform a self-join on an Employees table to show pairs of employees who work in the same department.
SELECT E1.EmployeeName AS Employee1, E2.EmployeeName AS Employee2
FROM Employees E1
JOIN Employees E2 ON E1.DepartmentID = E2.DepartmentID AND E1.EmployeeID <> E2.EmployeeID;



--Subquery Exercises
--Write a query to find products whose price is higher than the average price of all products.
SELECT ProductName, Price 
FROM Products 
WHERE Price > (SELECT AVG(Price) FROM Products);

--Retrieve customer names who have placed at least one order by using a subquery.
SELECT CustomerName 
FROM Customers 
WHERE CustomerID IN (SELECT DISTINCT CustomerID FROM Orders);

--Find the top 3 most expensive products using a subquery.
SELECT ProductName, Price 
FROM Products 
WHERE Price IN (
SELECT TOP 3 Price 
FROM Products 
ORDER BY Price DESC);

--Write a query to list all employees whose salary is higher than the average salary of their department.
SELECT Name, Salary 
FROM Employee E 
WHERE Salary > (SELECT AVG(Salary) FROM Employees WHERE DepartmentID = E.DepartmentID);

--Use a correlated subquery to find employees who earn more than the average salary of all employees in their department.
SELECT Name, Salary 
FROM Employee E1 
WHERE Salary > (SELECT AVG(Salary) FROM Employees E2 WHERE E1.DepartmentID = E2.DepartmentID);


--Grouping and Summarizing Data Exercises
--Group orders by customer and calculate the total amount spent by each customer.
SELECT C.CustomerName, SUM(O.TotalAmount) AS TotalSpent
FROM Orders O
JOIN Customers C ON O.CustomerID = C.CustomerID
GROUP BY C.CustomerName;

--Group products by category and calculate the average price for each category.
SELECT Category, AVG(Price) AS AveragePrice 
FROM Products 
GROUP BY Category;

--Group orders by month and calculate the total sales for each month.
SELECT MONTH(OrderDate) AS OrderMonth, SUM(TotalAmount) AS TotalSales
FROM Orders
GROUP BY MONTH(OrderDate);

--Write a query to group products by category and calculate the number of products in each category.
SELECT Category, COUNT(*) AS ProductCount 
FROM Products 
GROUP BY Category;

--Use the HAVING clause to filter groups of customers who have placed more than 5 orders.
SELECT C.CustomerName, COUNT(O.OrderID) AS OrderCount
FROM Orders O
JOIN Customers C ON O.CustomerID = C.CustomerID
GROUP BY C.CustomerName
HAVING COUNT(O.OrderID) > 5;


--Set Operations (UNION, INTERSECT, EXCEPT)
--Write a query to combine the results of two queries that return the names of customers from different tables using UNION.
SELECT CustomerName FROM Customers
UNION
SELECT CustomerName FROM Customer1;

--Find products that are in both the Electronics and Accessories categories using INTERSECT.
SELECT ProductName FROM Products 
WHERE Category = 'Electronics'
INTERSECT
SELECT ProductName FROM Products 
WHERE Category = 'Accessories';

--Write a query to find products that are in the Electronics category but not in the Furniture category using EXCEPT.
SELECT ProductName FROM Products 
WHERE Category = 'Electronics'
EXCEPT
SELECT ProductName FROM Products 
WHERE Category = 'Furniture';

