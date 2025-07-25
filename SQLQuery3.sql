USE [NORTHWND]
GO
/****** Object:  StoredProcedure [dbo].[SP_FactOrders]    Script Date: 7/10/2025 10:08:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[SP_FactOrders]
AS

select * into #temp 
from 
( select [ShippingKey],
	[EmployeeKey],
	[CustomerKey],
	[ShipperKey],
	[ProductKey],
	od.[OrderID],
	od.[ProductID],
	od.[UnitPrice],
	[Quantity],
	[Discount],
  ((od.[UnitPrice]*[Quantity])*(1-[Discount])) as SALES
	
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
	inner join [NORTHWND].[dbo].[DimProducts] as p
	on p.ProductID=od.ProductID
	group by [ShippingKey],
	[EmployeeKey],
	[CustomerKey],
	[ShipperKey],
		[ProductKey],
	od.[OrderID],
	od.[ProductID],
	od.[UnitPrice],
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
target.	[ProductKey]=temp1.	[ProductKey]

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
		[ProductKey]
);

exec SP_FactOrders