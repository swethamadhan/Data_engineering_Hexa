create database Company;
use Company

create table Employee(
ID int Not Null Primary Key,
Name varchar(50),
Gender varchar(50),
Salary int,
DepartmentId int)

create table Department(
ID int Not Null Primary Key,
DepartmentName varchar(50),
Location varchar(50),
DepartmentHead varchar(50))

insert into Employee(ID,Name,Gender,Salary,DepartmentId)
values(1, 'Tom', 'Male', 4000, 1),
(2, 'Pam', 'Female', 3000, 3),
(3, 'John', 'Male', 3500, 1),
(4, 'Sam', 'Male', 4500, 2),
(5, 'Todd', 'Male', 2800, 2),
(6, 'Ben', 'Male', 7000, 1),
(7, 'Sara', 'Female', 4800, 3),
(8, 'Valarie', 'Female', 5500, 1),
(9, 'James', 'Male', 6500, NULL),
(10, 'Russell', 'Male', 8800, NULL);

INSERT INTO Department (Id, DepartmentName, Location, DepartmentHead)
VALUES 
(1, 'IT', 'London', 'Rick'),
(2, 'Payroll', 'Delhi', 'Ron'),
(3, 'HR', 'New York', 'Christie'),
(4, 'Other Department', 'Sydney', 'Cindrella');

SELECT Name, Gender, Salary, DepartmentName
FROM Employee
INNER JOIN Department
ON Employee.DepartmentId = Department.Id

SELECT Name, Gender, Salary, DepartmentName FROM Employee
LEFT  JOIN Department
ON Employee.DepartmentId = Department.Id

SELECT Name, Gender, Salary, DepartmentName FROM Employee
Right  JOIN Department
ON Employee.DepartmentId = Department.Id

SELECT Name, Gender, Salary, DepartmentName FROM Employee
FULL  JOIN Department
ON Employee.DepartmentId = Department.Id

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL,
    Category VARCHAR(50) NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    StockQuantity INT NOT NULL
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    ProductID INT NOT NULL,
    OrderDate DATE NOT NULL,
    Quantity INT NOT NULL,
    TotalAmount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

INSERT INTO Products (ProductID, ProductName, Category, Price, StockQuantity)
VALUES
(1, 'Laptop', 'Electronics', 75000.00, 10),
(2, 'Smartphone', 'Electronics', 25000.00, 25),
(3, 'Headphones', 'Accessories', 2000.00, 50),
(4, 'Desk Chair', 'Furniture', 5000.00, 15),
(5, 'Monitor', 'Electronics', 12000.00, 8);


INSERT INTO Orders (OrderID, ProductID, OrderDate, Quantity, TotalAmount)
VALUES
(1, 1, '2024-08-01', 2, 150000.00),
(2, 2, '2024-08-02', 3, 75000.00),
(3, 3, '2024-08-03', 5, 10000.00),
(4, 4, '2024-08-04', 1, 5000.00),
(5, 2, '2024-08-05', 1, 25000.00);

SELECT Products.ProductName, Orders.OrderDate, Orders.Quantity, Orders.TotalAmount
FROM Products
INNER JOIN Orders 
ON Products.ProductID = Orders.ProductID;

SELECT Products.ProductName, Orders.OrderDate, Orders.Quantity, Orders.TotalAmount
FROM Products
FULL OUTER JOIN Orders 
ON Products.ProductID = Orders.ProductID;

SELECT Products.ProductName, Orders.OrderDate, Orders.Quantity, Orders.TotalAmount
FROM Products
LEFT JOIN Orders
ON Products.ProductID = Orders.ProductID;

SELECT Products.ProductName, Orders.OrderDate, Orders.Quantity, Orders.TotalAmount
FROM Products
RIGHT JOIN Orders 
ON Products.ProductID = Orders.ProductID;

--1. Retrieve the total number of items sold and the total sales amount for each product.

SELECT p. ProductName,
SUM(o.Quantity) AS TotalQuantitySold, SUM(o.TotalAmount) AS TotalSalesAmount
FROM Orders o
INNER JOIN Products p ON o.ProductID = p.ProductID
GROUP BY p. ProductName;

--2. Retrieve a list of all products that have not been ordered yet.

SELECT p.ProductID, p. ProductName, p. Category FROM Products p
LEFT JOIN Orders o ON p. ProductID = o.ProductID
WHERE o. OrderID IS NULL;

--3.Retrieve all orders placed after 2023-01-01.

SELECT o. OrderID, p. ProductName, o. OrderDate, o. Quantity, o. TotalAmount FROM Orders o
INNER JOIN Products p ON o. ProductID = p.ProductID
WHERE o. OrderDate > '2023-01-01';

--4.Retrieve the top 3 products based on the total quantity sold.

SELECT top 3 p.ProductName, SUM(o. Quantity) AS TotalQuantitySold FROM Orders o
INNER JOIN Products p ON o. ProductID = p.ProductID
GROUP BY p. ProductName
ORDER BY TotalQuantitySold DESC

--new data 

create table Employees (
    EmployeeID int primary key,
    FirstName varchar(50),
    LastName varchar(50),
    Position varchar(50),
    Department varchar(50),
    HireDate date
);

insert into Employees (EmployeeID, FirstName, LastName, Position, Department, HireDate)
values
    (1, 'Amit', 'Sharma', 'Software Engineer', 'IT', '2022-01-15'),
    (2, 'Priya', 'Mehta', 'Project Manager', 'Operations', '2023-02-20'),
    (3, 'Raj', 'Patel', 'Business Analyst', 'Finance', '2021-06-30'),
    (4, 'Sunita', 'Verma', 'HR Specialist', 'HR', '2019-08-12'),
    (5, 'Vikram', 'Rao', 'Software Engineer', 'IT', '2021-03-18'),
    (6, 'Anjali', 'Nair', 'HR Manager', 'HR', '2020-05-14'),
    (7, 'Rohan', 'Desai', 'Finance Manager', 'Finance', '2022-11-25'),
    (8, 'Sneha', 'Kumar', 'Operations Coordinator', 'Operations', '2023-07-02'),
    (9, 'Deepak', 'Singh', 'Data Scientist', 'IT', '2022-08-05'),
    (10, 'Neha', 'Gupta', 'Business Analyst', 'Finance', '2020-10-10');

--1 Retrieve employees who work in the IT department.
select * from Employees
where Department = 'IT';

--2 Retrieve employees whose HireDate is after January 1, 2022.
select * from Employees
where HireDate > '2022-01-01';

--3 Retrieve employees who work in either the HR or Finance departments.
select * from Employees
where Department IN ('HR', 'Finance');

--4 Retrieve employees whose position is Software Engineer
--and were hired after January 1, 2021.

select * from Employees
where Position = 'Software Engineer' AND HireDate > '2021-01-01';

--5 Retrieve employees whose LastName starts with 'S'.
select * from Employees
where LastName LIKE 'S%';

--6  Retrieve employees whose FirstName contains 'n'.
select * from Employees
where FirstName LIKE '%n%';

--7 Count the number of employees in the Employees table.
select count(*) AS TotalEmployees
from Employees;

--8 Find the earliest HireDate in the Employees table.
select min(HireDate) AS EarliestHireDate
from Employees;

--in 

select ProductName,Category,Price 
from Products
where category in ('electronics','furniture');

