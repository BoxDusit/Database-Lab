--เเบบฝึกหัด SQL ใช้ฐานข้อมูล Minimart

--สินค้าที่มีราคา 15 บาท
SELECT * 
FROM Products 
WHERE UnitPrice = 15

--สินค้าที่มีจำนวนคงเหลือในสต็อคต่ำกว่า 250
SELECT *
FROM Products
WHERE UnitsInStock<250

SELECT productID,ProductName
FROM Products
WHERE Discontinued = 0

SELECT productID,ProductName,UnitPrice
FROM Products
WHERE UnitPrice>100

SELECT productID,UnitPrice
FROM Products
WHERE ProductName='ยางลบ'




SELECT productID,ProductName
FROM Products
WHERE UnitsInStock>=400

SELECT productID,ProductName,UnitPrice,UnitsInStock
FROM Products
WHERE ProductName='เเชมพู' or ProductName='เเป้งเด็ก' or ProductName='ดินสอ' or ProductName='ยางลบ'
