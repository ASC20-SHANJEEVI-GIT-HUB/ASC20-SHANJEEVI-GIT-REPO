SELECT * FROM SalesLT.Customer;


SELECT * FROM SalesLT.Product;


SELECT FirstName, LastName, EmailAddress FROM SalesLT.Customer;


SELECT Name, ListPrice FROM SalesLT.Product;


SELECT COUNT(*) AS TotalCustomers FROM SalesLT.Customer;


SELECT COUNT(*) AS TotalProducts FROM SalesLT.Product;


SELECT DISTINCT Color FROM SalesLT.Product WHERE Color IS NOT NULL;


SELECT MIN(PRODUCTID) FROM SalesLT.Product;


SELECT TOP 10 PRODUCTID FROM SalesLT.Product ORDER BY PRODUCTID ASC;


SELECT TOP 10 Name, ListPrice FROM SalesLT.Product ORDER BY ListPrice DESC;


SELECT * FROM SalesLT.SalesOrderHeader;


SELECT Name, ProductNumber, StandardCost FROM SalesLT.Product WHERE SellEndDate IS NULL;


SELECT Name, ListPrice FROM SalesLT.Product WHERE ListPrice > 1000;


SELECT c.FirstName, c.LastName, a.City 
FROM SalesLT.Customer c
JOIN SalesLT.CustomerAddress ca ON c.CustomerID = ca.CustomerID
JOIN SalesLT.Address a ON ca.AddressID = a.AddressID
WHERE a.City = 'Seattle';


SELECT Name, Color, ListPrice FROM SalesLT.Product WHERE Color = 'Red';


SELECT SalesOrderID, OrderDate, TotalDue FROM SalesLT.SalesOrderHeader WHERE YEAR(OrderDate) = 2008;


SELECT Name, ListPrice FROM SalesLT.Product WHERE ListPrice BETWEEN 100 AND 500;


SELECT FirstName, LastName, EmailAddress FROM SalesLT.Customer WHERE EmailAddress LIKE '%adventure-works.com';


SELECT Name FROM SalesLT.Product WHERE Name LIKE 'Mountain%';


SELECT Name, Color FROM SalesLT.Product WHERE Color IS NULL;


SELECT FirstName, LastName, Phone FROM SalesLT.Customer WHERE Phone IS NOT NULL;


SELECT p.Name, p.ListPrice, pc.Name AS CategoryName 
FROM SalesLT.Product p
JOIN SalesLT.ProductCategory pc ON p.ProductCategoryID = pc.ProductCategoryID
WHERE pc.Name IN ('Helmets', 'Gloves');


SELECT YEAR(OrderDate) AS OrderYear, AVG(TotalDue) AS AvgOrderTotal 
FROM SalesLT.SalesOrderHeader
GROUP BY YEAR(OrderDate);


SELECT p.Name, SUM(sod.OrderQty) AS TotalUnitsSold 
FROM SalesLT.SalesOrderDetail sod
JOIN SalesLT.Product p ON sod.ProductID = p.ProductID
GROUP BY p.Name;


SELECT CustomerID, COUNT(*) AS TotalOrders 
FROM SalesLT.SalesOrderHeader
GROUP BY CustomerID;


SELECT pc.Name AS CategoryName, AVG(p.ListPrice) AS AvgPrice 
FROM SalesLT.Product p
JOIN SalesLT.ProductCategory pc ON p.ProductCategoryID = pc.ProductCategoryID
GROUP BY pc.Name;


SELECT YEAR(OrderDate) AS OrderYear, MONTH(OrderDate) AS OrderMonth, SUM(TotalDue) AS TotalSales 
FROM SalesLT.SalesOrderHeader
GROUP BY YEAR(OrderDate), MONTH(OrderDate);


SELECT p.Name AS ProductName, pc.Name AS CategoryName 
FROM SalesLT.Product p
INNER JOIN SalesLT.ProductCategory pc ON p.ProductCategoryID = pc.ProductCategoryID;


SELECT soh.SalesOrderID, c.FirstName, c.LastName, soh.OrderDate, soh.TotalDue 
FROM SalesLT.SalesOrderHeader soh
INNER JOIN SalesLT.Customer c ON soh.CustomerID = c.CustomerID;


SELECT sod.SalesOrderID, p.Name AS ProductName, sod.OrderQty, sod.UnitPrice, sod.LineTotal 
FROM SalesLT.SalesOrderDetail sod
INNER JOIN SalesLT.Product p ON sod.ProductID = p.ProductID;


SELECT c.FirstName, c.LastName, a.AddressLine1, a.City, a.StateProvince, a.PostalCode 
FROM SalesLT.Customer c
INNER JOIN SalesLT.CustomerAddress ca ON c.CustomerID = ca.CustomerID
INNER JOIN SalesLT.Address a ON ca.AddressID = a.AddressID;


SELECT p.Name AS ProductName, pc.Name AS CategoryName, pcParent.Name AS ParentCategory 
FROM SalesLT.Product p
INNER JOIN SalesLT.ProductCategory pc ON p.ProductCategoryID = pc.ProductCategoryID
LEFT JOIN SalesLT.ProductCategory pcParent ON pc.ParentProductCategoryID = pcParent.ProductCategoryID;


SELECT soh.SalesOrderID, c.FirstName, c.LastName, p.Name AS ProductName, sod.OrderQty, sod.UnitPrice, sod.LineTotal 
FROM SalesLT.SalesOrderHeader soh
INNER JOIN SalesLT.Customer c ON soh.CustomerID = c.CustomerID
INNER JOIN SalesLT.SalesOrderDetail sod ON soh.SalesOrderID = sod.SalesOrderID
INNER JOIN SalesLT.Product p ON sod.ProductID = p.ProductID;


SELECT p.Name AS ProductName 
FROM SalesLT.Product p
LEFT JOIN SalesLT.SalesOrderDetail sod ON p.ProductID = sod.ProductID
WHERE sod.ProductID IS NULL;


SELECT c.FirstName, c.LastName, SUM(soh.TotalDue) AS TotalSpending 
FROM SalesLT.Customer c
INNER JOIN SalesLT.SalesOrderHeader soh ON c.CustomerID = soh.CustomerID
GROUP BY c.FirstName, c.LastName;


SELECT pm.Name AS ProductModelName, pd.Description 
FROM SalesLT.ProductModel pm
INNER JOIN SalesLT.ProductModelProductDescription pmpd ON pm.ProductModelID = pmpd.ProductModelID
INNER JOIN SalesLT.ProductDescription pd ON pmpd.ProductDescriptionID = pd.ProductDescriptionID
WHERE pd.Culture = 'en';


SELECT soh.SalesOrderID, a.AddressLine1, a.City, a.StateProvince, a.PostalCode 
FROM SalesLT.SalesOrderHeader soh
INNER JOIN SalesLT.Address a ON soh.ShipToAddressID = a.AddressID;


SELECT pc.Name AS CategoryName, COUNT(*) AS ProductCount 
FROM SalesLT.Product p
JOIN SalesLT.ProductCategory pc ON p.ProductCategoryID = pc.ProductCategoryID
GROUP BY pc.Name
HAVING COUNT(*) > 10;


SELECT c.FirstName, c.LastName, SUM(soh.TotalDue) AS TotalSpent 
FROM SalesLT.Customer c
JOIN SalesLT.SalesOrderHeader soh ON c.CustomerID = soh.CustomerID
GROUP BY c.FirstName, c.LastName
HAVING SUM(soh.TotalDue) > 10000;


SELECT p.Name, SUM(sod.OrderQty) AS TotalSold 
FROM SalesLT.Product p
JOIN SalesLT.SalesOrderDetail sod ON p.ProductID = sod.ProductID
GROUP BY p.Name
HAVING SUM(sod.OrderQty) > 100;


SELECT Color, AVG(ListPrice) AS AvgPrice 
FROM SalesLT.Product
WHERE Color IS NOT NULL
GROUP BY Color
HAVING AVG(ListPrice) > 500;


SELECT YEAR(OrderDate) AS OrderYear, SUM(TotalDue) AS YearlySales 
FROM SalesLT.SalesOrderHeader
GROUP BY YEAR(OrderDate)
HAVING SUM(TotalDue) > 1000000;


SELECT CustomerID, COUNT(*) AS TotalOrders 
FROM SalesLT.SalesOrderHeader
GROUP BY CustomerID
HAVING COUNT(*) > 3;


SELECT p.Name, AVG(sod.OrderQty) AS AvgQuantity 
FROM SalesLT.Product p
JOIN SalesLT.SalesOrderDetail sod ON p.ProductID = sod.ProductID
GROUP BY p.Name
HAVING AVG(sod.OrderQty) > 5;


SELECT a.City, COUNT(DISTINCT c.CustomerID) AS CustomerCount 
FROM SalesLT.Customer c
JOIN SalesLT.CustomerAddress ca ON c.CustomerID = ca.CustomerID
JOIN SalesLT.Address a ON ca.AddressID = a.AddressID
GROUP BY a.City
HAVING COUNT(DISTINCT c.CustomerID) > 5;


SELECT pc.Name AS CategoryName, SUM(sod.LineTotal) AS TotalSales 
FROM SalesLT.ProductCategory pc
JOIN SalesLT.Product p ON pc.ProductCategoryID = p.ProductCategoryID
JOIN SalesLT.SalesOrderDetail sod ON p.ProductID = sod.ProductID
GROUP BY pc.Name
HAVING SUM(sod.LineTotal) > 50000;


SELECT YEAR(soh.OrderDate) AS OrderYear, MONTH(soh.OrderDate) AS OrderMonth, COUNT(*) AS TotalOrders 
FROM SalesLT.SalesOrderHeader soh
GROUP BY YEAR(soh.OrderDate), MONTH(soh.OrderDate)
HAVING COUNT(*) > 50;


SELECT * FROM SalesLT.Product 
WHERE ListPrice > (SELECT AVG(ListPrice) FROM SalesLT.Product);


SELECT * FROM SalesLT.Customer 
WHERE CustomerID IN (
    SELECT CustomerID FROM SalesLT.SalesOrderHeader 
    WHERE YEAR(OrderDate) = 2008
);


SELECT p.Name, pc.Name AS CategoryName, p.ListPrice 
FROM SalesLT.Product p
JOIN SalesLT.ProductCategory pc ON p.ProductCategoryID = pc.ProductCategoryID
WHERE p.ListPrice = (
    SELECT MAX(p2.ListPrice) 
    FROM SalesLT.Product p2 
    WHERE p2.ProductCategoryID = p.ProductCategoryID
);


SELECT c.FirstName, c.LastName, SUM(soh.TotalDue) AS TotalSpent
FROM SalesLT.Customer c
JOIN SalesLT.SalesOrderHeader soh ON c.CustomerID = soh.CustomerID
GROUP BY c.FirstName, c.LastName
HAVING SUM(soh.TotalDue) > (
    SELECT AVG(TotalSpent) FROM (
        SELECT SUM(TotalDue) AS TotalSpent 
        FROM SalesLT.SalesOrderHeader 
        GROUP BY CustomerID
    ) AS CustomerTotals
);


SELECT * FROM SalesLT.Product 
WHERE ProductID NOT IN (
    SELECT DISTINCT ProductID FROM SalesLT.SalesOrderDetail
);


SELECT * FROM SalesLT.SalesOrderHeader 
WHERE TotalDue > (SELECT AVG(TotalDue) FROM SalesLT.SalesOrderHeader);


SELECT TOP 5 c.FirstName, c.LastName, SUM(soh.TotalDue) AS TotalSpent
FROM SalesLT.Customer c
JOIN SalesLT.SalesOrderHeader soh ON c.CustomerID = soh.CustomerID
GROUP BY c.FirstName, c.LastName
ORDER BY TotalSpent DESC;


SELECT p.Name, pc.Name AS CategoryName 
FROM SalesLT.Product p
JOIN SalesLT.ProductCategory pc ON p.ProductCategoryID = pc.ProductCategoryID
WHERE pc.ProductCategoryID = (
    SELECT TOP 1 ProductCategoryID 
    FROM SalesLT.Product
    GROUP BY ProductCategoryID
    ORDER BY AVG(ListPrice) DESC
);


SELECT c.* 
FROM SalesLT.Customer c
JOIN SalesLT.CustomerAddress ca ON c.CustomerID = ca.CustomerID
JOIN SalesLT.Address a ON ca.AddressID = a.AddressID
WHERE a.City IN (
    SELECT TOP 3 a2.City 
    FROM SalesLT.CustomerAddress ca2
    JOIN SalesLT.Address a2 ON ca2.AddressID = a2.AddressID
    GROUP BY a2.City
    ORDER BY COUNT(*) DESC
);


SELECT p.Name, p.ListPrice 
FROM SalesLT.Product p
WHERE p.ListPrice > (
    SELECT AVG(ListPrice) 
    FROM SalesLT.Product 
    WHERE ProductCategoryID = p.ProductCategoryID
);


SELECT DATENAME(WEEKDAY, OrderDate) AS WeekDay, COUNT(*) AS OrderCount
FROM SalesLT.SalesOrderHeader
GROUP BY DATENAME(WEEKDAY, OrderDate);


SELECT * FROM SalesLT.SalesOrderHeader
WHERE OrderDate >= DATEADD(DAY, -30, (SELECT MAX(OrderDate) FROM SalesLT.SalesOrderHeader));


SELECT Name, DATEDIFF(DAY, SellStartDate, GETDATE()) AS DaysSinceStart
FROM SalesLT.Product;


SELECT YEAR(OrderDate) AS OrderYear, DATEPART(QUARTER, OrderDate) AS OrderQuarter, COUNT(*) AS OrdersCount
FROM SalesLT.SalesOrderHeader
GROUP BY YEAR(OrderDate), DATEPART(QUARTER, OrderDate);


SELECT * FROM SalesLT.Product 
WHERE YEAR(SellStartDate) = 2005;


SELECT SalesOrderID, DATEDIFF(DAY, OrderDate, ShipDate) AS DaysToShip
FROM SalesLT.SalesOrderHeader
WHERE ShipDate IS NOT NULL;


SELECT FORMAT(OrderDate,'yyyy-MM') AS MonthYear, COUNT(*) AS OrderCount, SUM(TotalDue) AS TotalSales
FROM SalesLT.SalesOrderHeader
GROUP BY FORMAT(OrderDate,'yyyy-MM');


SELECT * FROM SalesLT.Product 
WHERE SellStartDate <= GETDATE() AND (SellEndDate IS NULL OR SellEndDate >= GETDATE());


SELECT CustomerID, MIN(OrderDate) AS FirstOrder, MAX(OrderDate) AS LastOrder
FROM SalesLT.SalesOrderHeader
GROUP BY CustomerID;


SELECT * FROM SalesLT.Product 
WHERE YEAR(SellEndDate) = 2006;


SELECT FirstName + ' ' + LastName AS FullName 
FROM SalesLT.Customer;


SELECT EmailAddress, SUBSTRING(EmailAddress, CHARINDEX('@', EmailAddress)+1, LEN(EmailAddress)) AS Domain
FROM SalesLT.Customer;


SELECT UPPER(Name) AS ProductNameUpper 
FROM SalesLT.Product;


SELECT Name FROM SalesLT.Product 
WHERE LEN(Name) > 20;


SELECT REPLACE(ProductNumber, ' ', '') AS ProductNumberNoSpaces 
FROM SalesLT.Product;


SELECT LEFT(Name, 3) AS FirstThreeLetters FROM SalesLT.Product;


SELECT REPLACE(REPLACE(REPLACE(Phone, '(', ''), ')', ''), '-', '') AS PhoneNoFormat
FROM SalesLT.Customer;


SELECT LEFT(FirstName, 1) + LEFT(LastName, 1) AS Initials FROM SalesLT.Customer;


SELECT REVERSE(Name) AS ReversedName FROM SalesLT.Product;


SELECT * FROM SalesLT.Product 
WHERE CHARINDEX('Bike', Name) > 0;


SELECT Name, RANK() OVER (ORDER BY ListPrice DESC) AS PriceRank
FROM SalesLT.Product;


SELECT CustomerID, ROW_NUMBER() OVER (ORDER BY LastName, FirstName) AS RowNum
FROM SalesLT.Customer;


SELECT Name, ProductCategoryID, DENSE_RANK() OVER (PARTITION BY ProductCategoryID ORDER BY ListPrice DESC) AS CategoryPriceRank
FROM SalesLT.Product;


SELECT SalesOrderID, TotalDue, SUM(TotalDue) OVER (ORDER BY OrderDate) AS RunningTotal
FROM SalesLT.SalesOrderHeader;


SELECT SalesOrderID, CustomerID, OrderDate,
       LAG(OrderDate) OVER (PARTITION BY CustomerID ORDER BY OrderDate) AS PreviousOrder,
       LEAD(OrderDate) OVER (PARTITION BY CustomerID ORDER BY OrderDate) AS NextOrder
FROM SalesLT.SalesOrderHeader;


SELECT Name, PERCENT_RANK() OVER (ORDER BY ListPrice) AS PricePercentile
FROM SalesLT.Product;


SELECT Name, ProductCategoryID, ROW_NUMBER() OVER (PARTITION BY ProductCategoryID ORDER BY ListPrice DESC) AS RowNum
FROM SalesLT.Product
WHERE ROW_NUMBER() OVER (PARTITION BY ProductCategoryID ORDER BY ListPrice DESC) <= 3;


SELECT Name, ListPrice, ListPrice - AVG(ListPrice) OVER () AS PriceDifference
FROM SalesLT.Product;


SELECT SalesOrderID, AVG(TotalDue) OVER (ORDER BY OrderDate ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS MovingAvg
FROM SalesLT.SalesOrderHeader;


SELECT Name, CUME_DIST() OVER (ORDER BY ListPrice) AS CumulativeDistribution
FROM SalesLT.Product;


SELECT CustomerID, COUNT(*) AS Frequency, MAX(OrderDate) AS Recency, SUM(TotalDue) AS Monetary
FROM SalesLT.SalesOrderHeader
GROUP BY CustomerID;


SELECT p.Name, SUM(sod.OrderQty) AS TotalQtySold, SUM(sod.LineTotal) AS Revenue, SUM(p.StandardCost * sod.OrderQty) AS Cost,
       SUM(sod.LineTotal) - SUM(p.StandardCost * sod.OrderQty) AS Profit
FROM SalesLT.Product p
JOIN SalesLT.SalesOrderDetail sod ON p.ProductID = sod.ProductID
GROUP BY p.Name;


SELECT FORMAT(ModifiedDate,'yyyy-MM') AS CohortMonth, COUNT(DISTINCT CustomerID) AS NumCustomers, COUNT(*) AS TotalOrders, SUM(TotalDue) AS TotalRevenue
FROM SalesLT.Customer c
JOIN SalesLT.SalesOrderHeader soh ON c.CustomerID = soh.CustomerID
GROUP BY FORMAT(ModifiedDate,'yyyy-MM');


SELECT pc.Name AS ParentCategory, c.Name AS ChildCategory, COUNT(p.ProductID) AS ProductCount, SUM(sod.LineTotal) AS TotalSales
FROM SalesLT.ProductCategory pc
LEFT JOIN SalesLT.ProductCategory c ON c.ParentProductCategoryID = pc.ProductCategoryID
LEFT JOIN SalesLT.Product p ON p.ProductCategoryID = c.ProductCategoryID
LEFT JOIN SalesLT.SalesOrderDetail sod ON sod.ProductID = p.ProductID
GROUP BY pc.Name, c.Name;


SELECT c.CustomerID, COUNT(*) AS OrderCount, AVG(TotalDue) AS AvgOrderValue, SUM(TotalDue) AS TotalSpent,
       DATEDIFF(MONTH, MIN(OrderDate), MAX(OrderDate)) AS TenureMonths,
       CASE WHEN DATEDIFF(MONTH, MIN(OrderDate), MAX(OrderDate)) > 0 THEN SUM(TotalDue)/DATEDIFF(MONTH, MIN(OrderDate), MAX(OrderDate)) ELSE SUM(TotalDue) END AS AvgMonthlyValue
FROM SalesLT.SalesOrderHeader soh
JOIN SalesLT.Customer c ON soh.CustomerID = c.CustomerID
GROUP BY c.CustomerID
HAVING COUNT(*) > 1;


SELECT soh.SalesOrderID, c.FirstName + ' ' + c.LastName AS CustomerName, OrderDate, ShipDate,
       COUNT(sod.SalesOrderDetailID) AS LineItemCount, SUM(sod.OrderQty) AS TotalItems,
       SUM(sod.LineTotal) AS Subtotal, SUM(TaxAmt) AS Tax, SUM(Freight) AS Freight, SUM(TotalDue) AS TotalDue,
       (SUM(TotalDue) * 0.05) AS AdditionalCostPercent
FROM SalesLT.SalesOrderHeader soh
JOIN SalesLT.Customer c ON soh.CustomerID = c.CustomerID
JOIN SalesLT.SalesOrderDetail sod ON soh.SalesOrderID = sod.SalesOrderID
GROUP BY soh.SalesOrderID, c.FirstName, c.LastName, OrderDate, ShipDate;


SELECT p1.Name AS Product1, p2.Name AS Product2, COUNT(*) AS BoughtTogetherCount
FROM SalesLT.SalesOrderDetail sod1
JOIN SalesLT.SalesOrderDetail sod2 ON sod1.SalesOrderID = sod2.SalesOrderID AND sod1.ProductID < sod2.ProductID
JOIN SalesLT.Product p1 ON sod1.ProductID = p1.ProductID
JOIN SalesLT.Product p2 ON sod2.ProductID = p2.ProductID
GROUP BY p1.Name, p2.Name;


SELECT 
    CASE 
        WHEN TotalSpent > 10000 THEN 'High Value'
        WHEN TotalSpent > 5000 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS CustomerSegment,
    COUNT(*) AS NumCustomers,
    AVG(TotalSpent) AS AvgSpent
FROM (
    SELECT CustomerID, SUM(TotalDue) AS TotalSpent
    FROM SalesLT.SalesOrderHeader
    GROUP BY CustomerID
) AS CustomerTotals
GROUP BY 
    CASE 
        WHEN TotalSpent > 10000 THEN 'High Value'
        WHEN TotalSpent > 5000 THEN 'Medium Value'
        ELSE 'Low Value'
    END;


SELECT p.Name, SUM(sod.OrderQty) AS TotalSold, SUM(sod.LineTotal) AS TotalRevenue,
       SUM(sod.LineTotal)/NULLIF(SUM(p.StandardCost*sod.OrderQty),0) AS TurnoverRatio
FROM SalesLT.Product p
LEFT JOIN SalesLT.SalesOrderDetail sod ON p.ProductID = sod.ProductID
GROUP BY p.Name;


SELECT 
    (SELECT COUNT(*) FROM SalesLT.Customer) AS TotalCustomers,
    (SELECT COUNT(*) FROM SalesLT.Product WHERE SellEndDate IS NULL) AS ActiveProducts,
    (SELECT COUNT(*) FROM SalesLT.SalesOrderHeader) AS TotalOrders,
    (SELECT SUM(TotalDue) FROM SalesLT.SalesOrderHeader) AS TotalRevenue,
    (SELECT AVG(TotalDue) FROM SalesLT.SalesOrderHeader) AS AvgOrderValue,
    (SELECT TOP 1 Name FROM SalesLT.Product p 
     INNER JOIN SalesLT.SalesOrderDetail sod ON p.ProductID = sod.ProductID 
     GROUP BY p.Name 
     ORDER BY SUM(sod.LineTotal) DESC) AS TopProductByRevenue,
    (SELECT COUNT(*) FROM SalesLT.SalesOrderHeader soh 
     WHERE YEAR(soh.OrderDate) = YEAR(GETDATE()) AND MONTH(soh.OrderDate) = MONTH(GETDATE())) AS OrdersThisMonth,
    (SELECT SUM(TotalDue) FROM SalesLT.SalesOrderHeader 
     WHERE YEAR(OrderDate) = YEAR(GETDATE()) AND MONTH(OrderDate) = MONTH(GETDATE())) AS RevenueThisMonth;
