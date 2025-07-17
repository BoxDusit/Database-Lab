--ต้องการข้อมูลพนักงานทั้งหมด
SELECT * FROM Employees

--รหัสพนักงานชื่อนามสกุลพนักงานทุกคน
SELECT EmployeeID,FirstName,LastName FROM Employees

--ต้องการข้อมูลพนักงานทั้งหมดจากตารางพนักงานที่อยู่ในลอนดอน
SELECT * FROM Employees WHERE City = 'London'

--ต้องการข้อมูลรหัสพนักงาน ชื่อ-นามสกุลจากตารางพนักงานที่อยุ่ในลอนดอน
SELECT * EmployeeID,FirstName,LastName FROM Employees WHERE City = 'London'

--ต้องการข้อมูลเมือง,ประเทศจากตารางลูกค้า
SELECT City,Country FROM Customers

SELECT DISTINCT City,Country FROM Customers

SELECT * FROM Products WHERE Unitprice >200

SELECT * FROM Customers WHERE City='London' OR City='Vancouver'
SELECT * FROM Customers WHERE Country ='USA' OR City='Vancouver' 
SELECT * FROM Products WHERE UnitsInStock<20 OR UnitsInStock<=50


SELECT * FROM Products WHERE UnitPrice >=50 AND UnitsInStock <20
SELECT * FROM Products WHERE UnitPrice >= 50 AND UnitPrice <= 100

SELECT * FROM Products WHERE UnitPrice BETWEEN 50 AND 100

SELECT * FROM Customers WHERE Country IN ('Brazil','Argentina','Mexico')
SELECT * FROM Customers WHERE Country = 'Brazil',Country = 'Argentina' , Country = 'Mexico'

--ค้นหาลูกค้าขึ้นต้นด้วย N
SELECT * FROM employees WHERE FirstName LIKE '%N'

SELECT * FROM Customers WHERE CompanyName LIKE 'A%'

SELECT * FROM Customers WHERE CompanyName LIKE '%Y'

SELECT firstname,lastname FROM Employees WHERE FirstName LIKE '%AN%'

//ต้องการชื่อลูกค้าที่มีตัวอักษร 5 ตัว
SELECT * FROM Employees WHERE FirstName LIKE '_____'
SELECT  * FROM Employees WHERE FirstName LIKE '_a___'

SELECT ProductID,ProductName,UnitPrice FROM Products ORDER BY Unitprice DESC
SELECT CompanyName,ContactName FROM Customers ORDER BY UnitPrice ASC

SELECT TOP 10 ProductName,UnitPrice FROM Products ORDER BY UnitsInStock DESC

SELECT CategoryID,ProductName,UnitPrice FROM Products ORDER BY CategoryID ASC , UnitPrice DESC
