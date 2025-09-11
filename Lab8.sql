--Sub Query
--ต้องการข้อมูลคนที่มีตำเเหน่งเดียวกับ Nancy
------ 1.หาตำเเหน่งของ nancy ก่อน
SELECT Title 
FROM Employees 
WHERE FirstName = 'nancy'

------ 2.หาตำเเหน่งข้อมูลที่มีตำเเหน่งเดียวกับข้อที่ 1
SELECT * 
FROM Employees
WHERE Title = (SELECT Title FROM Employees WHERE FirstName = 'nancy')

--ต้องการชื่อนามสกุลพนักงานที่อายุมากที่สุด
SELECT Firstname,LastName
FROM Employees
Where BirthDate = (SELECT min(BirthDate) FROM Employees)

SELECT ProductName
FROM Products
WHERE UnitPrice > (SELECT UnitPrice FROM Products WHERE ProductName = 'Ikura')

SELECT CompanyName
FROM Customers
WHERE City = (SELECT city FROM Customers WHERE CompanyName = 'Around the Horn')

SELECT FirstName,LastName
FROM Employees
WHERE HireDate = (SELECT MAX(HireDate) FROM Employees)

SELECT *
FROM Orders
WHERE ShipCountry not in (SELECT Distinct Country FROM Suppliers)

SELECT * over (order by unitprice desc) AS 

SELECT * 
FROM Shippers

INSERT INTO Shippers
VALUES ('บริษัทขนเยอะจำกัด','081-12345678')

INSERT INTO Shippers(CompanyName)
VALUES ('บริษัทขนมมหาศาสจำกัด')

SELECT * FROM Customers

INSERT INTO Customers(CustomerID,CompanyName)
VALUES ('A0001','บริษัทซื้อเยอะจำกัด')

SELECT * FROM Employees

INSERT INTO Employees(FirstName,LastName)
VALUES ('วุ้นเส้น','ข้าวปุ้น')

SELECT * FROM Products

INSERT INTO Products(ProductName,UnitPrice,UnitsInStock)
VALUES ('ปลาเเดกบอง',1.5,12)

UPDATE Shippers
SET Phone = '085-9999999'
WHERE ShipperID = 6

SELECT * FROM Shippers

UPDATE Products
SET UnitsInStock = UnitsInStock+100
WHERE ProductID = 1

SELECT * FROM Customers

UPDATE Customers 
SET City = 'อุดรธานี' , Country = 'Thailand'
WHERE CustomerID = 'A0001'

SELECT * FROM Products
DELETE FROM Products
WHERE ProductName = 'ปลาเเดกบอง'

SELECT * FROM Orders
