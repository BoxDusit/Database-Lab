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
