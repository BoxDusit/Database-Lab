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
