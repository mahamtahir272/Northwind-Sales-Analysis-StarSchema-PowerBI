

CREATE TABLE [NORTHWND].[dbo].[DimCustomers](
	[CustomerKey] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [nchar](5) NOT NULL,
	[CompanyName] [nvarchar](40) NOT NULL,
	[ContactName] [nvarchar](30) NULL,
	[ContactTitle] [nvarchar](30) NULL,
	[Address] [nvarchar](60) NULL,
	[City] [nvarchar](15) NULL,
	[Region] [nvarchar](15) NULL,
	[PostalCode] [nvarchar](10) NULL,
	[Country] [nvarchar](15) NULL,
	[Phone] [nvarchar](24) NULL,
	[Fax] [nvarchar](24) NULL)

CREATE TABLE [NORTHWND].[dbo].[DimEmployees](
	[EmployeeKey] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[LastName] [nvarchar](20) NOT NULL,
	[FirstName] [nvarchar](10) NOT NULL,
	[Title] [nvarchar](30) NULL,
	[TitleOfCourtesy] [nvarchar](25) NULL,
	[BirthDate] [datetime] NULL,
	[HireDate] [datetime] NULL,
	[Address] [nvarchar](60) NULL,
	[City] [nvarchar](15) NULL,
	[Region] [nvarchar](15) NULL,
	[PostalCode] [nvarchar](10) NULL,
	[Country] [nvarchar](15) NULL,
	[HomePhone] [nvarchar](24) NULL)

CREATE TABLE [NORTHWND].[dbo].[DimSuppliers](
	[SupplierKey] [int] IDENTITY(1,1) NOT NULL,
	[SupplierID] [int] NOT NULL,
	[CompanyName] [nvarchar](40) NOT NULL,
	[ContactName] [nvarchar](30) NULL,
	[ContactTitle] [nvarchar](30) NULL,
	[Address] [nvarchar](60) NULL,
	[City] [nvarchar](15) NULL,
	[Region] [nvarchar](15) NULL,
	[PostalCode] [nvarchar](10) NULL,
	[Country] [nvarchar](15) NULL,
	[Phone] [nvarchar](24) NULL,
	[Fax] [nvarchar](24) NULL)

CREATE TABLE [NORTHWND].[dbo].[DimCategories](
	[CategoryKey] [int] IDENTITY(1,1) NOT NULL,
	[CategoryID] [int] NOT NULL,
	[CategoryName] [nvarchar](15) NOT NULL,
	[Description] [ntext] NULL)

CREATE TABLE [NORTHWND].[dbo].[DimShippers](
	[ShipperKey] [int] IDENTITY(1,1) NOT NULL,
	[ShipperID] [int] NOT NULL,
	[CompanyName] [nvarchar](40) NOT NULL,
	[Phone] [nvarchar](24) NULL)

CREATE TABLE [NORTHWND].[dbo].[DimShipping](
	[ShippingKey] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NOT NULL,
		[ShippedDate] [datetime] NULL,
		[ShipVia] [int] NULL,
	[Freight] [money] NULL,
[ShipName] [nvarchar](40) NULL,
	[ShipAddress] [nvarchar](60) NULL,
	[ShipCity] [nvarchar](15) NULL,
	[ShipRegion] [nvarchar](15) NULL,
	[ShipPostalCode] [nvarchar](10) NULL,
	[ShipCountry] [nvarchar](15) NULL)

CREATE TABLE [NORTHWND].[dbo].[Region](
	[RegionKey] [int] IDENTITY(1,1) NOT NULL,
	[RegionID] [int] NOT NULL,
	[RegionDescription] [nchar](50) NOT NULL)

CREATE TABLE [NORTHWND].[dbo].[DimEmployeeTerritory](
	[EmployeeTerritoryKey] [int] IDENTITY(1,1) NOT NULL,
[EmployeeID] [int] NOT NULL,
	[TerritoryID] [nvarchar](20) NOT NULL)

CREATE TABLE [NORTHWND].[dbo].[DimTerritory](
	[TerritoryKey] [int] IDENTITY(1,1) NOT NULL,
	[TerritoryID] [nvarchar](20) NOT NULL,
	[TerritoryDescription] [nchar](50) NOT NULL,
	[RegionID] [int] NOT NULL)

CREATE TABLE [NORTHWND].[dbo].[fact_orders]
(
	[OrderID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[UnitPrice] [money] NOT NULL,
	[Quantity] [smallint] NOT NULL,
	[Discount] [real] NOT NULL,
	[EmployeeTerritoryKey] [int] NOT NULL,
	[ShippingKey] [int] NOT NULL,
	[EmployeeKey] [int] NOT NULL,
	[CustomerKey] [int] NOT NULL,
	[TerritoryKey] [int] NOT NULL,
	[ShipperKey] [int] NOT NULL,
	[ProductKey] [INT] NOT NULL
	)

CREATE TABLE [NORTHWND].[dbo].[DimProducts]
(
	[ProductKey] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[ProductName] [nvarchar](40) NOT NULL,
	[QuantityPerUnit] [nvarchar](20) NULL,
	[UnitPrice] [money] NULL,
	[UnitsInStock] [smallint] NULL,
	[UnitsOnOrder] [smallint] NULL,
	[ReorderLevel] [smallint] NULL,
	[Discontinued] [bit] NOT NULL)