create database daytwo;
use daytwo;

create table products(
productid int primary key, --enforces unique product ID
productname varchar(100) not null, --prevents null values for productname
category varchar(50) not null,
price decimal(10,2) check(price>0), --ensure price is +ve
stockquantity int default 0); -- default value for stockquantity

INSERT INTO products (productid, productname, category, price, stockquantity)
VALUES
    (1, 'Laptop', 'Electronics', 999.99, 50),
    (2, 'Smartphone', 'Electronics', 499.99, 100),
    (3, 'Headphones', 'Accessories', 79.99, 200),
    (4, 'Desk Chair', 'Furniture', 199.99, 15),
    (5, 'Monitor', 'Electronics', 299.99, 8);

--upper,lower,replace,len,substring,leftrim,righttrim

SELECT ProductName, UPPER (ProductName) AS ProductNameUpperCase
FROM Products;

SELECT ProductName, LOWER (ProductName) AS ProductNameLowerCase 
FROM Products;

SELECT ProductName, SUBSTRING (ProductName, 1, 3) AS ShortName 
FROM Products;

SELECT ProductName, LEN (ProductName) AS NameLength 
FROM Products;

SELECT ProductName, REPLACE (ProductName, 'Phone', 'Device') 
AS UpdatedProductName 
FROM Products;

SELECT ProductName, LTRIM(RTRIM (ProductName)) 
AS TrimmedProductName 
FROM Products;

--charindex,concat,left,right,reverse,format,replicate

SELECT ProductName, CHARINDEX('e', ProductName) AS PositionofE 
FROM Products;

SELECT ProductName, Category, CONCAT (ProductName, '-', Category) AS ProductDetails 
from products;
SELECT ProductName, LEFT (ProductName, 5) AS ShortName 
FROM Products;

SELECT ProductName, RIGHT (ProductName, 3) AS LastCharacters 
FROM Products;

SELECT ProductName, REVERSE (ProductName) AS ReversedName 
FROM Products;

SELECT ProductName, FORMAT (Price, 'N2') AS FormattedPrice 
FROM Products;

SELECT ProductName, REPLICATE (ProductName, 3) AS RepeatedProductName 
FROM Products;

--date format

SELECT GETDATE() AS CurrentDate,
DATEADD(DAY, 10, GETDATE()) AS FutureDate;

SELECT DATEADD (YEAR, -1, GETDATE()) AS DateMinus1Year;

SELECT DATEDIFF(DAY, '2024-01-01', GETDATE()) AS DaysDifference;

SELECT FORMAT (GETDATE(), 'MMMM dd, yyyy') AS FormattedDate;

SELECT FORMAT (GETDATE(), 'dd-MM-yyyy') AS FormattedDate;

SELECT YEAR (GETDATE()) AS CurrentYear;

SELECT MONTH('2024-05-15') AS MonthExtracted;

SELECT DAY('2024-05-15') AS DayExtracted;