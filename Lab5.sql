--Dusit Phaisan

SELECT CategoryName,ProductName,UnitPrice
FROM Products as p,Categories as c
WHERE p.CategoryID=c.CategoryID
and CategoryName = 'seafood'

SELECT CategoryName,ProductName,UnitPrice
FROM Products as p join Categories as c
ON p.CategoryID=c.CategoryID
WHERE CategoryName = 'seafood'

SELECT CompanyName,OrderID
FROM Orders JOIN Shippers
ON Shippers.ShipperID = Orders.ShipVia

SELECT CompanyName,OrderID
FROM Orders JOIN Shippers
ON Shippers.ShipperID=Orders.ShipVia
WHERE OrderID=10275

SELECT ProductID,CompanyName,Country
FROM Products Join Suppliers
ON Products.SupplierID = Suppliers.SupplierID
WHERE Country in ('usa','uk')


SELECT ProductID,ProductName,City,Country
FROM Products Join Suppliers
ON Products.SupplierID = Suppliers.SupplierID

SELECT *
FROM Employees e JOIN Orders o 
ON e.EmployeeID = o.EmployeeID
Order By e.EmployeeID

SELECT *
FROM  Orders O
JOIN Customers C ON O.CustomerID=C.CustomerID 
JOIN Employees E ON O.EmployeeID=E.EmployeeID

SELECT s.CompanyName,count(*)จำนวนOrder
FROM Shippers s JOIN Orders o 
ON s.ShipperID = o.ShipVia
GROUP BY s.CompanyName
ORDER BY 2 desc

SELECT p.ProductID,p.ProductName,sum(Quantity) จำนวนที่ขายได้
FROM Products p JOIN [Order Details] od 
ON p.ProductID = od.ProductID
GROUP BY p.ProductID , p.ProductName

SELECT DISTINCT p.ProductID,p.ProductName
FROM Employees e 
JOIN Orders o ON e.EmployeeID = o.EmployeeID
JOIN [Order Details] od ON o.OrderID = od.OrderID
JOIN Products p ON p.ProductID = od.ProductID
WHERE e.FirstName = 'Nancy'
ORDER BY ProductID

SELECT DISTINCT s.Country
FROM Customers c
JOIN Orders o ON c.CustomerID=o.CustomerID
JOIN [Order Details] od ON od.OrderID=o.OrderID
JOIN Products p ON p.ProductID=od.ProductID
JOIN Suppliers s ON s.SupplierID = p.SupplierID
WHERE c.CompanyName = 'Around the Horn'

SELECT p.ProductID ,p.ProductName ,sum(Quantity) จำนวนที่ซื้อ 
FROM Customers c
JOIN Orders o ON c.CustomerID=o.CustomerID
JOIN [Order Details] od ON od.OrderID=o.OrderID
JOIN Products p ON p.ProductID=od.ProductID
WHERE c.CompanyName = 'Around the Horn'
GROUP BY p.ProductID,p.ProductName

SELECT o.OrderID,FirstName,ROUND(sum(od.Quantity*od.UnitPrice*(1-Discount)),2) TotalCash
FROM Orders o 
JOIN Employees e ON o.EmployeeID=e.EmployeeID
JOIN [Order Details] od ON o.OrderID = od.OrderID
GROUP BY o.OrderID,FirstName
