create database day4sql;

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    PhoneNumber VARCHAR(20)
);

INSERT INTO Customers (CustomerID, FirstName, LastName, Email, PhoneNumber)
VALUES
    (1, 'amit', 'sharma', 'amit.sharma@example.com', '9876543210'),
    (2, 'priya', 'mehta', 'priya.mehta@example.com', '8765432109'),
    (3, 'rohit', 'kumar', 'rohit.kumar@example.com', '7654321098'),
    (4, 'neha', 'verma', 'neha.verma@example.com', '6543210987'),
    (5, 'siddharth', 'singh', 'siddharth.singh@example.com', '5432109876'),
    (6, 'asha', 'rao', 'asha.rao@example.com', '4321098765');

select * from customers;

update customers
    set firstname = ltrim(rtrim(lower(firstname))),
        lastname = ltrim(rtrim(lower(lastname)));

SELECT *
FROM Customers
WHERE FirstName LIKE '%';

SELECT *
FROM Customers
WHERE PhoneNumber LIKE '[0-9][0-9][0-9]-[0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]';

SELECT *
FROM Customers
WHERE LastName LIKE '%'; --underscore written 5 times

