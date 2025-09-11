-- Sub Query
--ต้องการข้อมูลคนที่มีตำแหน่งเดียวกับ Nancy
-- 1. หาตำแหน่ง Nancy ก่อน
Select title from Employees where FirstName = 'Nancy'
-- 2.หาตำแหน่งข้อมูลที่มีตำแหน่งเดียวกัน กับข้อที่ 1
Select *
from Employees
where title = (Select Title from Employees where FirstName='Nancy')

--ต้องการชื่อนามสกุลพนักงานที่มีอายุมากที่สุด
Select FirstName, LastName from Employees 
where BirthDate = (Select min(BirthDate) from Employees)
--ต้องการชื่อสินค้าที่มีราคากว่าสินค้าชื่อ Ikura
Select ProductName from Products
where UnitPrice > (Select UnitPrice from Products where ProductName = 'Ikura')
--ต้องการชื่อบริบัทลูกค้าที่อยู่ในเมืองเดียวกับบริษัท ชื่อ Arouund the horn
Select CompanyName from Customers 
where city = (Select city from Customers where CompanyName='Around the Horn')
--ต้องการชื่อนามสกุลพนักงานที่เข้างานคนล่าสุด
SELECT FirstName, LastName
FROM Employees
WHERE HireDate = (SELECT MAX(HireDate) FROM Employees);

--ข้อมูลใบสั่งซื้อที่ถูกส่งไปประเทศที่ไม่มีผู้ผลิตสินค้าตั้งอยู่
Select * from Orders
where ShipCountry not in (Select distinct country from Suppliers) 

--การใส่เลขลำดับ
--ต้องการข้อมูลสินค้าที่มีราคาน้อยกว่า 50$
Select ROW_NUMBER() over (order by unitprice desc) AS Rownum, ProductName,UnitPrice from Products
where UnitPrice < 50

--Insert
-- ตาราง มี PK เป็น AutoIncrement
Insert into Shippers
values('บริษัทขนเยอะจำกัด', '081-123456789')

insert into Shippers(CompanyName)
values('บริษัทขนเยอะมหาศาจำกัด')

--ตารางที่มี PK เป็น char, nChar
insert into Customers(CustomerID,CompanyName)
values ('A0001', 'บริษัทขายน้อยจำไม่กัด')

--จงเพิ่มข้อมูลพนักงาน 1 คน (ใส่ข้อมูลเท่าที่มี)
insert into Employees(FirstName,LastName)
values ('Jitpanu','Yottiwong')

--จงเพิ่มสินค้า ปลาร้าไม่บอง ราคา1.5$ จำนวน 12
insert into Products(ProductName,UnitPrice,UnitsInStock)
values('ปลาแดกบอง','1.5','12')


--วิธีลบ
delete from Shippers where CompanyName='บริษัทขนเยอะมหาศาจำกัด'


--ปรับปรุงจำนวนสินค้าคงเหลือสินค้ารหัส1 เพิ่ใจำนวนเข้าไป 100 ชิ้น
update Products
set UnitsInStock = UnitsInStock+100
where ProductID = 1
--ปรับปรุง เมือง และประเทศลูกค้า รหัส A0001 ให้เป็น อุดรธาณี thai;land
update Customers
set City = 'อุดรธานี', Country = 'Thailand'
where CustomerID ='A0001'

select * from Customers
select * from Employees
select * from Products
