--ต้องการภาค ประเทศ เมือง ชื่อบริษัทลูกค้า เบอร์โทร
SELECT Region , Country , Companyname,Phone
FROM Customers
ORDER BY 1 asc , 2 asc, 3 asc

--ตัวอย่างการใช้calculate คอลลัม
SELECT ProductID , ProductName ,UnitPrice,UnitsInStock,UnitPrice*UnitsInStock as StockValue
FROM Products

--การระบุชื่อคอลลัมน์ Alias / as
SELECT ProductID as รหัส , ProductName as ชื่อสินค้า, จำนวนสินค้าคงเหลือทั้งหมด = UnitsInStock+UnitsOnOrder 
FROM Products
WHERE (UnitsInStock + UnitsOnOrder) < ReorderLevel

--การปัดเศษโดยใช้คำสั่ง round(คอลัมน์,จำนวนทศนิยม)
SELECT ProductID,ProductName,UnitPrice,ROUND(UnitPrice * 0.07,2) as Vat7
FROM Products


--การเว้นวรรคเเละการนำข้อความมาต่อกัน Spaace(จำนวนการเคาะ)
SELECT EmployeeID , TitleOfCourtesy+FirstName+SPACE(2)+LastName as [Employee Name]
FROM Employees

SELECT EmployeeID , TitleOfCourtesy+FirstName+' '+LastName as [Employee Name]
FROM Employees

--ต้องการทราบในเเต่ละรายการสินค้า [order details]
SELECT OrderID,ProductID,UnitPrice,Quantity,Discount,
(UnitPrice*Quantity) as TotalPrice,
 NetPrice = (UnitPrice*Quantity*(1-Discount)) ,
(UnitPrice*Quantity)-(UnitPrice*Quantity*Discount) as NetPrice
FROM [Order Details]

--ฟังชั่นระบุวันที่ขณะนี้ getdate() ฟังชั่นคำนวนอายุ datediff(ปี,วันเกิด,วันที่ปุจจุบัน)
SELECT EmployeeID,FirstName,BirthDate,DATEDIFF(YEAR,BirthDate,GETDATE())Age,HireDate,DATEDIFF(YEAR,HireDate,GETDATE()) YearInOffice
FROM Employees


--ฟังชั่นทางคณิตศาสตร์ MIN MAX SUM AVG COUNT หาค่าหลายเเถว
--ตัวอย่างการเเสดงจำนวนชนิดสินค้าที่มีเก็บสินค้าต่ำกว่า 15 ชิ้น
SELECT COUNT(*) AS จำนวนสินค้า , COUNT(ProductID),COUNT(ProductName)
FROM Products
WHERE UnitsInStock < 15

--จำนวนลูกค้าที่อยู่ในประเทศ usa 
SELECT COUNT(*) AS จำนวนลูกค้าที่อยู่ในประเทศUSA
FROM Customers
WHERE Country = 'usa'

--จำนวนพนักงานที่อยุ่ใน London
SELECT COUNT(*)
FROM Employees
WHERE City = 'london'

--จำนวนใบสั่งซื้อที่ออกปี 1997
SELECT COUNT(*) 
FROM Orders
WHERE year(OrderDate) = 1997

--จำนวนครั้งที่ขายสินค้า
SELECT COUNT(*)
FROM [Order Details] 
WHERE ProductID=1

--Function Sum
--จำนวนสินค้าที่ขายได้ทั้งหมด เฉพาะสินค้ารหัส 1
SELECT SUM(quantity)
FROM [Order Details]
WHERE ProductID = 2

--มุลค่าสินค้าในคลังทั้งหมด
SELECT SUM(UnitPrice * UnitsInStock)
FROM Products

--จำนวนสินค้ารหัสประเภท 8 ที่สั่งซื้อเเล้ว
SELECT SUM(UnitsOnOrder)
FROM Products
WHERE CategoryID = 8 

--Function Min Max
SELECT MAX(UnitPrice), MIN(UnitPrice)
FROM [Order Details]
WHERE ProductID =  71

--Function AVG
--ราคาสินค้าเฉลี่ยทั้งหมดที่เคยขายได้เฉพาะสินค้ารหัส5
SELECT AVG(UnitPrice),MAX(UnitPrice), MIN(UnitPrice)
FROM [Order Details]
WHERE ProductID = 5


--การหาจำนวนลูกค้าในเเต่ละประเทศ
SELECT Country,COUNT(*) as [Num of Country]
FROM Customers
GROUP BY Country

--รหัสประเภทสินค้า ราคาเฉลี่ของสินค้าประเภทเดียวกัน
SElECT CategoryID,AVG(UnitPrice),MAX(UnitPrice), MIN(UnitPrice)
FROM Products
GROUP BY CategoryID

--รายการสินค้าในใบสั่งซื้อ 10250
SELECT OrderID , COUNT(*)
FROM [Order Details]
GROUP BY OrderID
HAVING COUNT(*)>3
--ต้องการประเทศเเละใบสั่งซื้อที่ส่งสินค้าไปถึงปลายทาง
SELECT ShipCountry,COUNT(*)
FROM Orders
GROUP BY ShipCountry



--การเพิ่มเงื่อนไขให้ groupby
SELECT ShipCountry,COUNT(*) as "Num of Country"
FROM Orders
GROUP BY ShipCountry
HAVING COUNT(*) >= 100

--ข้อมูลรหัสใบสั่งซื้อยอดเงินรวมในใบสั่งซื้อนั้น เเสดงเฉพาะใบสั่งซื้อที่มียอดเงินน้อยกว่า 100
SELECT OrderID , SUM(UnitPrice*Quantity*(1-Discount)) as ยอดเงินรวม
FROM [Order Details]
GROUP BY OrderID
HAVING SUM(UnitPrice*Quantity*(1-Discount))<100

--ประเทศที่มีจำนวนใบสั่งซื้อที่ส่งสินค้าต่ำกว่า 20 รายการในปี 1997
SELECT ShipCountry,COUNT(*) as NumOfOrder
FROM Orders
WHERE YEAR(OrderDate) = 1997
GROUP BY ShipCountry
HAVING COUNT(*) < 20
ORDER BY COUNT(*) DESC

--ใบสั่งซื้อใดมียอดขายสูงที่สุดเเสดงรหัสใบสั่งซื้อเเละยอดขาย 1 อันดับ
SELECT top 1 OrderID, SUM(UnitPrice*Quantity*(1-Discount)) as total
FROM [Order Details]
GROUP BY OrderID
ORDER BY total desc

--ใบสั่งซื้อใดมียอดขายสูงที่สุดเเสดงรหัสใบสั่งซื้อเเละยอดขาย 5 อันดับ
SELECT top 5 OrderID, SUM(UnitPrice*Quantity*(1-Discount)) as total
FROM [Order Details]
GROUP BY OrderID
ORDER BY total asc
