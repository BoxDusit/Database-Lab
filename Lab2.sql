-- แบบฝึกหัดคำสั่ง SQL ใช้ฐานข้อมูล Northwind
--1. ต้องการรหัสพนักงาน คำนำหน้า ชื่อ นามสกุล ของพนักงานที่อยู่ในประเทศ USA
SELECT EmployeeID,TitleOfCourtesy,FirstName 
FROM Employees LastName 
WHERE Country = 'USA' 

--2. ต้องการข้อมูลสินค้าที่มีรหัสประเภท 1,2,4,8 และมีราคา ช่วง 100$-200$
SELECT *
FROM Products
WHERE categoryID IN (1,2,3,4) and UnitPrice BETWEEN 100 AND 200

--3. ต้องการประเทศ เมือง ชื่อบริษัทลูกค้า ชื่อผู้ติดต่อ เบอร์โทร ของลูกค้าทั้งหมด ที่อยู่ในภาค WA และ WY
SELECT *
FROM Customers
WHERE Region = 'WA' OR Region = 'WY'

--4. ข้อมูลของสินค้ารหัสประเภทที่ 1 ราคาไม่เกิน 20 หรือสินค้ารหัสประเภทที่ 8 ราคาตั้งแต่ 150 ขึ้นไป
SELECT * 
FROM Products
WHERE (CategoryID = 1 AND UnitPrice<=20) OR (CategoryID = 8 AND UnitPrice>=150)

--5. ชื่อบริษัทลูกค้า ที่อยู่ใน ประเทศ USA ที่ไม่มีหมายเลข FAX  เรียงตามลำดับชื่อบริษัท 
SELECT CompanyName
FROM Customers
WHERE Fax is NULL ORDER BY CompanyName

--6. ต้องการข้อมูลลูกค้าที่ชื่อบริษัททมีคำว่า Com
SELECT * 
FROM Customers
WHERE CompanyName LIKE '%com%'
