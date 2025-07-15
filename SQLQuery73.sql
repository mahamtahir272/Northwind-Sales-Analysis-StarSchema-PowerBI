CREATE PROCEDURE dbo.SP_Customer
AS
select * into #temp 
from (
select [CustomerID],
	[CompanyName],
	[ContactName],
	[ContactTitle],
	[Address],
	[City],
	[Region],
	[PostalCode],
	[Country],
	[Phone],
	[Fax] from NORTHWND.dbo.Customers
	) as temp
	DECLARE @TargetRows INT;
SET @TargetRows = @@ROWCOUNT;
MERGE INTO NORTHWND.dbo.DimCustomers AS TARGET
USING #temp temp1
	ON  target.[CustomerID]=temp1.[CustomerID]
WHEN MATCHED THEN UPDATE
SET
target.[CustomerID] =temp1.[CustomerID],
target.[CompanyName]=temp1.[CompanyName],
target.[ContactName]=temp1.[ContactName],
target.[ContactTitle]=temp1.[ContactTitle],
target.[Address]=temp1.[Address],
target.[City]=temp1.[City],
target.[Region]=temp1.[Region],
target.[PostalCode]=temp1.[PostalCode],
target.[Country]=temp1.[Country],
target.[Phone]=temp1.[Phone],
target.[Fax]=temp1.[Fax]

WHEN NOT MATCHED BY TARGET THEN
INSERT
( [CustomerID],
	[CompanyName],
	[ContactName],
	[ContactTitle],
	[Address],
	[City],
	[Region],
	[PostalCode],
	[Country],
	[Phone],
	[Fax]
	
)

VALUES
(
[CustomerID],
	[CompanyName],
	[ContactName],
	[ContactTitle],
	[Address],
	[City],
	[Region],
	[PostalCode],
	[Country],
	[Phone],
	[Fax]
);

exec dbo.SP_Customer;
=======================================================================================
CREATE PROCEDURE dbo.SP_Employee
AS
select * into #temp 
from (
select [EmployeeID],
	[LastName],
	[FirstName],
	[Title],
	[TitleOfCourtesy],
	[BirthDate],
	[HireDate],
	[Address],
	[City],
	[Region],
	[PostalCode],
	[Country] ,
	[HomePhone]
	from NORTHWND.dbo.Employees
	) as temp
	DECLARE @TargetRows INT;
SET @TargetRows = @@ROWCOUNT;
MERGE INTO NORTHWND.dbo.DimEmployees AS TARGET
USING #temp temp1
	ON  target.[EmployeeID]=temp1.[EmployeeID]
WHEN MATCHED THEN UPDATE
SET
target.[EmployeeID] =temp1.[EmployeeID],
target.[LastName]=temp1.[LastName],
target.[FirstName]=temp1.[FirstName],
target.[Title]=temp1.[Title],
target.[TitleOfCourtesy]=temp1.[TitleOfCourtesy],
target.[BirthDate]=temp1.[BirthDate],
target.[HireDate]=temp1.[HireDate],
target.[Address]=temp1.[Address],
target.[City]=temp1.[City],
target.[Region]=temp1.[Region],
target.[PostalCode]=temp1.[PostalCode],
target.[Country]=temp1.[Country],
target.[HomePhone]=temp1.[HomePhone]

WHEN NOT MATCHED BY TARGET THEN
INSERT
( [EmployeeID],
	[LastName],
	[FirstName],
	[Title],
	[TitleOfCourtesy],
	[BirthDate],
	[HireDate],
	[Address],
	[City],
	[Region],
	[PostalCode],
	[Country] ,
	[HomePhone]
	
)

VALUES
(
[EmployeeID],
	[LastName],
	[FirstName],
	[Title],
	[TitleOfCourtesy],
	[BirthDate],
	[HireDate],
	[Address],
	[City],
	[Region],
	[PostalCode],
	[Country] ,
	[HomePhone]
);

exec dbo.SP_Employee;
=========================================================================================
CREATE PROCEDURE dbo.SP_EmployeeTerritory
AS
select * into #temp 
from (
select [EmployeeID],
	[TerritoryID]
	from NORTHWND.dbo.EmployeeTerritories) as temp
	DECLARE @TargetRows INT;
SET @TargetRows = @@ROWCOUNT;
MERGE INTO NORTHWND.dbo.DimEmployeeTerritory AS TARGET
USING #temp temp1
	ON  target.[TerritoryID]=temp1.[TerritoryID]
WHEN MATCHED THEN UPDATE
SET
target.[EmployeeID] =temp1.[EmployeeID],
target.[TerritoryID]=temp1.[TerritoryID]

WHEN NOT MATCHED BY TARGET THEN
INSERT(
[EmployeeID],
	[TerritoryID]
)
VALUES(
[EmployeeID],
	[TerritoryID]
);

exec dbo.SP_EmployeeTerritory;
==================================================================================
CREATE PROCEDURE dbo.SP_Shipper
AS
select * into #temp 
from (
select [ShipperID],
	[CompanyName],
	[Phone] 
	from [NORTHWND].[dbo].[Shippers]) as temp
DECLARE @TargetRows INT;
SET @TargetRows = @@ROWCOUNT;
MERGE INTO NORTHWND.dbo.DimShippers AS TARGET
USING #temp temp1
	ON  target.[ShipperID]=temp1.[ShipperID]
WHEN MATCHED THEN UPDATE
SET
target.[ShipperID] =temp1.[ShipperID],
target.[CompanyName]=temp1.[CompanyName],
target.[Phone]=temp1.[Phone]

WHEN NOT MATCHED BY TARGET THEN
INSERT(
[ShipperID],
	[CompanyName],
	[Phone] 
)
VALUES(
[ShipperID],
	[CompanyName],
	[Phone] 
);

exec dbo.SP_Shipper;
==================================================================================
CREATE PROCEDURE dbo.SP_Shipping
AS
select * into #temp 
from (
select [OrderID],
	[ShippedDate],
	[ShipVia],
	[Freight],
	[ShipName],
	[ShipAddress],
	[ShipCity],
	[ShipRegion],
	[ShipPostalCode],
	[ShipCountry]

	from [NORTHWND].[dbo].[Orders]) as temp
DECLARE @TargetRows INT;
SET @TargetRows = @@ROWCOUNT;
MERGE INTO NORTHWND.dbo.DimShipping AS TARGET
USING #temp temp1
	ON  target.[OrderID]=temp1.[OrderID]
WHEN MATCHED THEN UPDATE
SET
target.[OrderID] =temp1.[OrderID],
target.[ShippedDate]=temp1.[ShippedDate],
target.[ShipVia]=temp1.[ShipVia],
target.[Freight]=temp1.[Freight],
target.[ShipName]=temp1.[ShipName],
target.[ShipAddress]=temp1.[ShipAddress],
target.[ShipCity]=temp1.[ShipCity],
target.[ShipRegion]=temp1.[ShipRegion],
target.[ShipPostalCode]=temp1.[ShipPostalCode],
target.[ShipCountry]=temp1.[ShipCountry]

WHEN NOT MATCHED BY TARGET THEN
INSERT(
[OrderID],
	[ShippedDate],
	[ShipVia],
	[Freight],
	[ShipName],
	[ShipAddress],
	[ShipCity],
	[ShipRegion],
	[ShipPostalCode],
	[ShipCountry]
)
VALUES(
[OrderID],
	[ShippedDate],
	[ShipVia],
	[Freight],
	[ShipName],
	[ShipAddress],
	[ShipCity],
	[ShipRegion],
	[ShipPostalCode],
	[ShipCountry]
);

exec dbo.SP_Shipping;
====================================================================================
CREATE PROCEDURE dbo.SP_Territory
AS
select * into #temp 
from 
( select [TerritoryID],
	[TerritoryDescription],
	[RegionID]
	from [NORTHWND].dbo.Territories) as temp
	DECLARE @TargetRows INT;
SET @TargetRows = @@ROWCOUNT;
MERGE INTO NORTHWND.dbo.DimTerritory AS TARGET
USING #temp temp1
	ON  target.[TerritoryID]=temp1.[TerritoryID]
WHEN MATCHED THEN UPDATE
SET
target.[TerritoryID] =temp1.[TerritoryID],
target.[TerritoryDescription]=temp1.[TerritoryDescription],
target.[RegionID]=temp1.[RegionID]
WHEN NOT MATCHED BY TARGET THEN
INSERT(
[TerritoryID],
	[TerritoryDescription],
	[RegionID]
)
VALUES(
[TerritoryID],
	[TerritoryDescription],
	[RegionID]
);

EXEC dbo.SP_Territory
=========================================================================================
ALTER PROCEDURE dbo.SP_FactOrders
AS

select * into #temp 
from 
( select [ShippingKey],
	[EmployeeKey],
	[CustomerKey],
	[ShipperKey],
	[ProductKey],
	od.[OrderID],
	[ProductID],
	[UnitPrice],
	[Quantity],
	[Discount],
  (([UnitPrice]*[Quantity])*(1-[Discount])) as SALES
	
	from [NORTHWND].[dbo].[Order Details] as od
	inner join [NORTHWND].[dbo].[Orders] as o
	on o.[OrderID]=od.[OrderID]
	inner join [NORTHWND].[dbo].[DimShipping] as s
	on s.[OrderID]=o.[OrderID]
	inner join [NORTHWND].[dbo].[DimShippers] as sh
	on o.[ShipVia]=sh.[ShipperID]
	inner join [NORTHWND].[dbo].[DimEmployees] as e
	on e.EmployeeID=o.EmployeeID
	inner join [NORTHWND].[dbo].[DimCustomers] as c
	on c.CustomerID=o.CustomerID
	inner join [NORTHWND].[dbo].[Products] as p
	on p.ProductID=od.ProductID
	group by [ShippingKey],
	[EmployeeKey],
	[CustomerKey],
	[ShipperKey],
	[ProductKey],
	od.[OrderID],
	[ProductID],
	[UnitPrice],
	[Quantity],
	[Discount]

	) as temp
	DECLARE @TargetRows INT;
SET @TargetRows = @@ROWCOUNT;
MERGE INTO NORTHWND.[dbo].[fact_orders] AS TARGET
USING #temp temp1
	ON  target.[OrderID]=temp1.[OrderID]
	and target.[ProductID]=temp1.[ProductID]
WHEN MATCHED THEN UPDATE
SET
target.[OrderID] =temp1.[OrderID],
target.[ProductID]=temp1.[ProductID],
target.[UnitPrice]=temp1.[UnitPrice],
target.[Quantity]=temp1.[Quantity],
target.[Discount]=temp1.[Discount],
target.[ShippingKey]=temp1.[ShippingKey],
target.[EmployeeKey]=temp1.[EmployeeKey],
target.[CustomerKey]=temp1.[CustomerKey],
target.[ShipperKey]=temp1.[ShipperKey],
TARGET.[SALES]=temp1.[SALES],
target.[ProductKey]=temp1.[ProductKey]

WHEN NOT MATCHED BY TARGET THEN
INSERT([OrderID],
	[ProductID],
	[UnitPrice],
	[Quantity],
	[Discount],
	[ShippingKey],
	[EmployeeKey],
	[CustomerKey],
	[ShipperKey],
	[SALES],
	[ProductKey]
)
VALUES(
[OrderID],
	[ProductID],
	[UnitPrice],
	[Quantity],
	[Discount],
	[ShippingKey],
	[EmployeeKey],
	[CustomerKey],
	[ShipperKey],
	[SALES],
	[ProductKey]
);

EXEC dbo.SP_FactOrders
======================================================================================
CREATE PROCEDURE dbo.SP_Products
AS
select * into #temp 
from (
select [ProductID],
	[ProductName],
	[QuantityPerUnit],
	[UnitPrice],
	[UnitsInStock],
	[UnitsOnOrder],
	[ReorderLevel],
	[Discontinued]
	from NORTHWND.[dbo].[Products]
	) as temp
	DECLARE @TargetRows INT;
SET @TargetRows = @@ROWCOUNT;
MERGE INTO NORTHWND.dbo.DimProducts AS TARGET
USING #temp temp1
	ON  target.[ProductID]=temp1.[ProductID]
WHEN MATCHED THEN UPDATE
SET
target.[ProductID] =temp1.[ProductID],
target.[ProductName]=temp1.[ProductName],
target.[QuantityPerUnit]=temp1.[QuantityPerUnit],
target.[UnitPrice]=temp1.[UnitPrice],
target.[UnitsInStock]=temp1.[UnitsInStock],
target.[UnitsOnOrder]=temp1.[UnitsOnOrder],
target.[ReorderLevel]=temp1.[ReorderLevel],
target.[Discontinued]=temp1.[Discontinued]

WHEN NOT MATCHED BY TARGET THEN
INSERT
( [ProductID],
	[ProductName],
	[QuantityPerUnit],
	[UnitPrice],
	[UnitsInStock],
	[UnitsOnOrder],
	[ReorderLevel],
	[Discontinued]
	
)

VALUES
(
[ProductID],
	[ProductName],
	[QuantityPerUnit],
	[UnitPrice],
	[UnitsInStock],
	[UnitsOnOrder],
	[ReorderLevel],
	[Discontinued]
);

exec dbo.SP_Products;