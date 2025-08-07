--เเบบฝึกหัด SQL ใช้ฐานข้อมูล Minimart

--1.สินค้าที่มีราคา 15 บาท
SELECT * 
FROM Products 
WHERE UnitPrice = 15

--2.สินค้าที่มีจำนวนคงเหลือในสต็อคต่ำกว่า 250
SELECT *
FROM Products
WHERE UnitsInStock<250

-- 3. รหัสสินคา ชื่อสินค้าที่เลิกจำหน่ายแล้ว
SELECT productID,ProductName
FROM Products
WHERE Discontinued = 0

-- 4. รหัสสินค้า ชื่อสินค้า ราคา ของสินค้าที่มีราคามากกว่า 100
SELECT productID,ProductName,UnitPrice
FROM Products
WHERE UnitPrice>100

-- 5. รหัสสินค้า และราคาของยางลบ
SELECT productID,UnitPrice
FROM Products
WHERE ProductName='ยางลบ'

-- 6. หมายเลขใบเสร็จ วันที่ และ ราคารวม ของใบเสร็จที่ออกก่อนวันที่ 15 ก.พ.
SELECT ReceiptID,ReceiptDate,TotalCash
FROM Receipts
WHERE ReceiptDate < '2023-02-15'

-- 7. รหัสสินค้า ชื่อสินค้า ที่มีจำนวนคงเหลือตั้งแต่ 400 ขึ้นไป
SELECT productID,ProductName
FROM Products
WHERE UnitsInStock>=400

-- 8. รหัสสินค้า ชื่อสินค้า ราคา และ จำนวนคงเหลือ ของแชมพู,แป้งเด็ก,ดินสอ,ยางลบ
SELECT productID,ProductName,UnitPrice,UnitsInStock
FROM Products
WHERE ProductName IN('เเชมพู' , 'เเป้งเด็ก' ,'ดินสอ' ,'ยางลบ')

-- 9. รายละเอียดของสินค้าประเภทเครื่องเขียน
SELECT [Description]
FROM Categories
WHERE CategoryID = 1

-- 10. รหัสประเภทสินค้า ชื่อประเภท และรายละเอียดของ สินค้าประเภทเครื่องสำอาง
SELECT CategoryID,CategoryName,[Description]
FROM Categories
WHERE CategoryID = 4

-- 11.คำนำหน้า ชื่อ นามสกุล ของพนักงานที่เป็น Sale Representative
SELECT Title,FirstName,LastName
FROM Employees
WHERE Position = 'Sale Representative'

-- 12. รหัสพนักงาน ชื่อพนักงาน ชื่อผู้ใช้ รหัสผ่าน ของพนักงานทุกคน
SELECT EmployeeID,FirstName+SPACE(1)+LastName,UserName,[Password]
FROM Employees

-- 13. ชื่อผู้ใช้ และรหัสผ่านของพนักงานที่ชื่อก้องนิรันดร์
SELECT UserName,[Password]
FROM Employees
WHERE FirstName LIKE '%ก้องนิรันดร์%'

-- 14. รหัสพนักงานที่ออกใบเสร็จหมายเลข 3
SELECT EmployeeID
FROM Receipts
WHERE ReceiptID = 3


-- 15. รหัสสินค้า ชื่อสินค้า ราคา ของสินค้าที่มีรหัสประเภท 2, 4
SELECT productID,ProductName,UnitPrice
FROM Products
WHERE CategoryID = 2 OR CategoryID = 4

