USE northwind;

SELECT COUNT(*) AS supplier_count
FROM suppliers;

SELECT SUM(salary) AS total_salary_sum
FROM employees;

SELECT MIN(UnitPrice) AS cheapest_price
FROM Products;

SELECT AVG(UnitPrice) AS average_price
FROM Products;

SELECT MAX(UnitPrice) AS max_price
FROM Products;

SELECT SupplierID, COUNT(*) AS num_items_supplied
FROM Products
GROUP BY SupplierID;

SELECT CategoryID, AVG(UnitPrice) AS avg_price_per_category
FROM Products
GROUP BY CategoryID;

SELECT SupplierID, COUNT(*) AS num_items_supplied
FROM Products
GROUP BY SupplierID
HAVING COUNT(*) >= 5;

SELECT ProductID, ProductName, UnitPrice * UnitsInStock AS inventory_value
FROM Products
ORDER BY inventory_value DESC, ProductName;

/*Nested Queries*/

SELECT ProductName
FROM Products
WHERE UnitPrice = (
    SELECT MAX(UnitPrice)
    FROM Products
);

SELECT o.OrderID, o.ShipName, o.ShipAddress
FROM Orders o
WHERE o.ShipVia = (
    SELECT ShipperID
    FROM Shippers
    WHERE CompanyName = 'Federal Shipping'
);

SELECT OrderID
FROM `order details`
WHERE ProductID = (
    SELECT ProductID
    FROM Products
    WHERE ProductName = 'Sasquatch Ale'
);


SELECT FirstName, LastName
FROM Employees
WHERE EmployeeID = (
    SELECT EmployeeID
    FROM Orders
    WHERE OrderID = 10266
);

SELECT (
    SELECT ContactName
    FROM Customers
    WHERE CustomerID = (
        SELECT CustomerID
        FROM Orders
        WHERE OrderID = 10266
    )
) AS CustomerName;

/*Joins Exercises*/

SELECT p.ProductID, p.ProductName, p.UnitPrice, c.CategoryName
FROM Products p
JOIN Categories c ON p.CategoryID = c.CategoryID
ORDER BY c.CategoryName, p.ProductName;

SELECT p.ProductID, p.ProductName, p.UnitPrice, s.CompanyName
FROM Products p
JOIN Suppliers s ON p.SupplierID = s.SupplierID
WHERE p.UnitPrice > 75
ORDER BY p.ProductName;

SELECT 
    Products.ProductID,
    Products.ProductName,
    Products.UnitPrice,
    Categories.CategoryName,
    Suppliers.CompanyName
FROM 
    Products
JOIN 
    Categories ON Products.CategoryID = Categories.CategoryID
JOIN 
    Suppliers ON Products.SupplierID = Suppliers.SupplierID
ORDER BY 
    Products.ProductName;
    
SELECT p.productname, c.categoryname
FROM products p
JOIN categories c ON p.categoryid = c.categoryid
WHERE p.unitprice = (
    SELECT MAX(unitprice)
    FROM products
);

/*SELECT 
    o.OrderID,
    o.ShipName,
    o.ShipAddress,
    s.ShipperName AS ShippingCompany
FROM 
    Orders o
JOIN 
    Customers c ON o.CustomerID = c.CustomerID
JOIN 
    Shippers s ON o.ShipperID = s.ShipperID
WHERE 
    c.Country = 'Germany';*/
    
/*SELECT o.OrderID, o.OrderDate, o.ShipName, o.ShipAddress
FROM Orders o
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductI*/

/* Inserting, Updating and Deleting Data exercise*/

INSERT INTO SUPPLIERS VALUES (123, "xyz123", "xyz123", "xyz123", "xyz123","xyz123","xyz123","xyz123","xyz123","xyz123","xyz123","xyz123");

INSERT INTO PRODUCTS VALUES(190, 'XYZ', 4, 6, '18 - 500 g pkgs.', 97, 29, 0, 0, 1);

SELECT 
    p.ProductID,
    p.ProductName,
    s.CompanyName AS SupplierName,
    s.ContactName AS SupplierContactName,
    s.ContactTitle AS SupplierContactTitle,
    s.Address AS SupplierAddress,
    s.City AS SupplierCity,
    s.Region AS SupplierRegion,
    s.PostalCode AS SupplierPostalCode,
    s.Country AS SupplierCountry,
    s.Phone AS SupplierPhone,
    s.Fax AS SupplierFax,
    s.HomePage AS SupplierHomePage
FROM 
    Products p
INNER JOIN 
    Suppliers s ON p.SupplierID = s.SupplierID
ORDER BY 
    p.ProductID;
    
UPDATE Products
SET UnitPrice = UnitPrice * 1.15
WHERE ProductID = 100;

SELECT 
    p.ProductID,
    p.ProductName,
    p.UnitPrice
FROM 
    Products p
JOIN 
    Suppliers s ON p.SupplierID = s.SupplierID
WHERE 
    s.CompanyName = 'Around the Horn';
    
    DELETE FROM Products
WHERE ProductID = 190;

DELETE FROM Suppliers
WHERE SupplierID = 190;

SELECT * FROM Products;

SELECT *
FROM Suppliers;





  












