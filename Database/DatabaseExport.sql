USE [master]
GO
/****** Object:  Database [BusinessApp]    Script Date: 8/31/2023 10:43:48 AM ******/
CREATE DATABASE [BusinessApp]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BusinessApp', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\BusinessApp.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BusinessApp_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\BusinessApp_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [BusinessApp] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BusinessApp].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BusinessApp] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BusinessApp] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BusinessApp] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BusinessApp] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BusinessApp] SET ARITHABORT OFF 
GO
ALTER DATABASE [BusinessApp] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [BusinessApp] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BusinessApp] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BusinessApp] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BusinessApp] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BusinessApp] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BusinessApp] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BusinessApp] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BusinessApp] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BusinessApp] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BusinessApp] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BusinessApp] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BusinessApp] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BusinessApp] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BusinessApp] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BusinessApp] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [BusinessApp] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BusinessApp] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BusinessApp] SET  MULTI_USER 
GO
ALTER DATABASE [BusinessApp] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BusinessApp] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BusinessApp] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BusinessApp] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BusinessApp] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BusinessApp] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [BusinessApp] SET QUERY_STORE = OFF
GO
USE [BusinessApp]
GO
/****** Object:  Schema [Pharmacy]    Script Date: 8/31/2023 10:43:48 AM ******/
CREATE SCHEMA [Pharmacy]
GO
/****** Object:  Schema [Warehouse]    Script Date: 8/31/2023 10:43:48 AM ******/
CREATE SCHEMA [Warehouse]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 8/31/2023 10:43:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Pharmacy].[tPharmacies]    Script Date: 8/31/2023 10:43:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Pharmacy].[tPharmacies](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Address] [nvarchar](max) NOT NULL,
	[City] [nvarchar](max) NOT NULL,
	[State] [nvarchar](max) NOT NULL,
	[Zip] [nvarchar](max) NOT NULL,
	[NumberOfFilledPrescriptions] [bigint] NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[UpdatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_tPharmacies] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Pharmacy].[tPharmacists]    Script Date: 8/31/2023 10:43:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Pharmacy].[tPharmacists](
	[PharmacistId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](255) NOT NULL,
	[LastName] [nvarchar](255) NOT NULL,
	[Age] [int] NOT NULL,
	[PrimaryDrug] [nvarchar](255) NOT NULL,
	[DateHired] [datetime] NOT NULL,
	[PharmacyId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[PharmacistId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Warehouse].[tDeliveries]    Script Date: 8/31/2023 10:43:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Warehouse].[tDeliveries](
	[DeliveryId] [int] IDENTITY(1,1) NOT NULL,
	[DrugName] [nvarchar](255) NOT NULL,
	[UnitCount] [int] NOT NULL,
	[UnitPrice] [decimal](16, 8) NOT NULL,
	[DeliveryDate] [datetime] NULL,
	[PharmacyId] [int] NULL,
	[WarehouseId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[DeliveryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Warehouse].[tWarehouses]    Script Date: 8/31/2023 10:43:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Warehouse].[tWarehouses](
	[WarehouseId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Address] [nvarchar](255) NOT NULL,
	[City] [nvarchar](255) NOT NULL,
	[State] [nvarchar](255) NOT NULL,
	[Zip] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[WarehouseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230828222646_InitialCreate', N'7.0.10')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230828225001_InitialCreate', N'7.0.10')
GO
SET IDENTITY_INSERT [Pharmacy].[tPharmacies] ON 

INSERT [Pharmacy].[tPharmacies] ([Id], [Name], [Address], [City], [State], [Zip], [NumberOfFilledPrescriptions], [CreatedDate], [UpdatedDate]) VALUES (1, N'Heisnberg', N'308 Negra Arroyo Lane', N'Albuquerque', N'New Mexico', N'87104', 2200, CAST(N'2023-08-28T17:58:46.0300000' AS DateTime2), CAST(N'2023-08-28T17:58:46.0300000' AS DateTime2))
INSERT [Pharmacy].[tPharmacies] ([Id], [Name], [Address], [City], [State], [Zip], [NumberOfFilledPrescriptions], [CreatedDate], [UpdatedDate]) VALUES (2, N'CVS Pharmacy', N'3133 Lemmon Ave E', N'Dallas', N'Texas', N'75204', 400, CAST(N'2023-08-28T17:59:36.9300000' AS DateTime2), CAST(N'2023-08-28T17:59:36.9300000' AS DateTime2))
INSERT [Pharmacy].[tPharmacies] ([Id], [Name], [Address], [City], [State], [Zip], [NumberOfFilledPrescriptions], [CreatedDate], [UpdatedDate]) VALUES (3, N'Walgreens', N'12620 Farm to Market 1960 Rd W', N'Houston', N'Texas', N'77065', 50000, CAST(N'2023-08-28T18:00:32.1833333' AS DateTime2), CAST(N'2023-08-28T18:00:32.1833333' AS DateTime2))
INSERT [Pharmacy].[tPharmacies] ([Id], [Name], [Address], [City], [State], [Zip], [NumberOfFilledPrescriptions], [CreatedDate], [UpdatedDate]) VALUES (4, N'Kroger Pharmacy', N'4235 Milling Rd', N'San Antonio', N'Texas', N'78219', 7050, CAST(N'2023-08-28T18:01:29.3933333' AS DateTime2), CAST(N'2023-08-28T18:01:29.3933333' AS DateTime2))
INSERT [Pharmacy].[tPharmacies] ([Id], [Name], [Address], [City], [State], [Zip], [NumberOfFilledPrescriptions], [CreatedDate], [UpdatedDate]) VALUES (5, N'Uptown Rx Pharmacy & Nutrition', N'3408 Oak Lawn Ave', N'Dallas', N'Texas', N' 75219', 32050, CAST(N'2023-08-28T18:02:33.4100000' AS DateTime2), CAST(N'2023-08-28T18:02:33.4100000' AS DateTime2))
SET IDENTITY_INSERT [Pharmacy].[tPharmacies] OFF
GO
SET IDENTITY_INSERT [Pharmacy].[tPharmacists] ON 

INSERT [Pharmacy].[tPharmacists] ([PharmacistId], [FirstName], [LastName], [Age], [PrimaryDrug], [DateHired], [PharmacyId]) VALUES (1, N'John', N'Doe', 25, N'Tylenol', CAST(N'2023-08-30T14:28:50.580' AS DateTime), 1)
INSERT [Pharmacy].[tPharmacists] ([PharmacistId], [FirstName], [LastName], [Age], [PrimaryDrug], [DateHired], [PharmacyId]) VALUES (2, N'John', N'Adams', 25, N'Advil', CAST(N'2023-08-30T14:29:06.167' AS DateTime), 1)
INSERT [Pharmacy].[tPharmacists] ([PharmacistId], [FirstName], [LastName], [Age], [PrimaryDrug], [DateHired], [PharmacyId]) VALUES (4, N'Wesley', N'Snipes', 200, N'Silver Nitrate', CAST(N'2023-08-30T14:32:04.713' AS DateTime), 2)
INSERT [Pharmacy].[tPharmacists] ([PharmacistId], [FirstName], [LastName], [Age], [PrimaryDrug], [DateHired], [PharmacyId]) VALUES (5, N'Luke', N'Skywalker', 32, N'Midichlorians', CAST(N'2023-08-30T14:33:39.620' AS DateTime), 3)
INSERT [Pharmacy].[tPharmacists] ([PharmacistId], [FirstName], [LastName], [Age], [PrimaryDrug], [DateHired], [PharmacyId]) VALUES (6, N'Anakin', N'Skywalker', 32, N'Tylenol', CAST(N'2023-08-30T14:36:32.650' AS DateTime), 3)
INSERT [Pharmacy].[tPharmacists] ([PharmacistId], [FirstName], [LastName], [Age], [PrimaryDrug], [DateHired], [PharmacyId]) VALUES (7, N'Thomas', N'Shelby', 45, N'Vodka', CAST(N'2023-08-30T14:37:34.583' AS DateTime), 4)
INSERT [Pharmacy].[tPharmacists] ([PharmacistId], [FirstName], [LastName], [Age], [PrimaryDrug], [DateHired], [PharmacyId]) VALUES (8, N'Arthur', N'Shelby', 36, N'Whisky', CAST(N'2023-08-30T14:37:50.160' AS DateTime), 4)
INSERT [Pharmacy].[tPharmacists] ([PharmacistId], [FirstName], [LastName], [Age], [PrimaryDrug], [DateHired], [PharmacyId]) VALUES (9, N'John', N'Wick', 41, N'Hollow Points', CAST(N'2023-08-30T14:38:22.310' AS DateTime), 5)
SET IDENTITY_INSERT [Pharmacy].[tPharmacists] OFF
GO
SET IDENTITY_INSERT [Warehouse].[tDeliveries] ON 

INSERT [Warehouse].[tDeliveries] ([DeliveryId], [DrugName], [UnitCount], [UnitPrice], [DeliveryDate], [PharmacyId], [WarehouseId]) VALUES (1, N'Tylenol', 30, CAST(1.25000000 AS Decimal(16, 8)), CAST(N'2023-07-24T00:00:00.000' AS DateTime), 1, 1)
INSERT [Warehouse].[tDeliveries] ([DeliveryId], [DrugName], [UnitCount], [UnitPrice], [DeliveryDate], [PharmacyId], [WarehouseId]) VALUES (2, N'Tylenol Extra Strength', 24, CAST(2.45000000 AS Decimal(16, 8)), CAST(N'2023-07-25T00:00:00.000' AS DateTime), 1, 1)
INSERT [Warehouse].[tDeliveries] ([DeliveryId], [DrugName], [UnitCount], [UnitPrice], [DeliveryDate], [PharmacyId], [WarehouseId]) VALUES (3, N'Midichlorians', 15, CAST(4.10000000 AS Decimal(16, 8)), CAST(N'2023-07-25T00:00:00.000' AS DateTime), 3, 2)
INSERT [Warehouse].[tDeliveries] ([DeliveryId], [DrugName], [UnitCount], [UnitPrice], [DeliveryDate], [PharmacyId], [WarehouseId]) VALUES (4, N'Vodka', 9, CAST(2.10000000 AS Decimal(16, 8)), CAST(N'2023-07-27T00:00:00.000' AS DateTime), 4, 3)
INSERT [Warehouse].[tDeliveries] ([DeliveryId], [DrugName], [UnitCount], [UnitPrice], [DeliveryDate], [PharmacyId], [WarehouseId]) VALUES (5, N'Silver Nitrate', 29, CAST(1.56000000 AS Decimal(16, 8)), CAST(N'2023-07-28T00:00:00.000' AS DateTime), 2, 3)
INSERT [Warehouse].[tDeliveries] ([DeliveryId], [DrugName], [UnitCount], [UnitPrice], [DeliveryDate], [PharmacyId], [WarehouseId]) VALUES (6, N'Hollow Points', 12, CAST(3.28000000 AS Decimal(16, 8)), CAST(N'2023-07-28T00:00:00.000' AS DateTime), 5, 2)
INSERT [Warehouse].[tDeliveries] ([DeliveryId], [DrugName], [UnitCount], [UnitPrice], [DeliveryDate], [PharmacyId], [WarehouseId]) VALUES (7, N'Tylenol', 17, CAST(1.25000000 AS Decimal(16, 8)), CAST(N'2023-07-31T00:00:00.000' AS DateTime), 3, 2)
INSERT [Warehouse].[tDeliveries] ([DeliveryId], [DrugName], [UnitCount], [UnitPrice], [DeliveryDate], [PharmacyId], [WarehouseId]) VALUES (8, N'Advil', 45, CAST(3.45000000 AS Decimal(16, 8)), CAST(N'2023-07-31T00:00:00.000' AS DateTime), 1, 1)
INSERT [Warehouse].[tDeliveries] ([DeliveryId], [DrugName], [UnitCount], [UnitPrice], [DeliveryDate], [PharmacyId], [WarehouseId]) VALUES (9, N'Advil', 12, CAST(3.45000000 AS Decimal(16, 8)), CAST(N'2023-08-02T00:00:00.000' AS DateTime), 2, 2)
INSERT [Warehouse].[tDeliveries] ([DeliveryId], [DrugName], [UnitCount], [UnitPrice], [DeliveryDate], [PharmacyId], [WarehouseId]) VALUES (10, N'Whisky', 32, CAST(3.45000000 AS Decimal(16, 8)), CAST(N'2023-08-03T00:00:00.000' AS DateTime), 4, 3)
INSERT [Warehouse].[tDeliveries] ([DeliveryId], [DrugName], [UnitCount], [UnitPrice], [DeliveryDate], [PharmacyId], [WarehouseId]) VALUES (11, N'Whisky', 12, CAST(3.45000000 AS Decimal(16, 8)), CAST(N'2023-08-04T00:00:00.000' AS DateTime), 5, 3)
INSERT [Warehouse].[tDeliveries] ([DeliveryId], [DrugName], [UnitCount], [UnitPrice], [DeliveryDate], [PharmacyId], [WarehouseId]) VALUES (12, N'Hollow Points', 5, CAST(3.28000000 AS Decimal(16, 8)), CAST(N'2023-08-07T00:00:00.000' AS DateTime), 5, 1)
INSERT [Warehouse].[tDeliveries] ([DeliveryId], [DrugName], [UnitCount], [UnitPrice], [DeliveryDate], [PharmacyId], [WarehouseId]) VALUES (13, N'Hollow Points', 8, CAST(3.28000000 AS Decimal(16, 8)), CAST(N'2023-08-08T00:00:00.000' AS DateTime), 4, 2)
INSERT [Warehouse].[tDeliveries] ([DeliveryId], [DrugName], [UnitCount], [UnitPrice], [DeliveryDate], [PharmacyId], [WarehouseId]) VALUES (14, N'Tylenol', 34, CAST(1.25000000 AS Decimal(16, 8)), CAST(N'2023-08-09T00:00:00.000' AS DateTime), 4, 2)
INSERT [Warehouse].[tDeliveries] ([DeliveryId], [DrugName], [UnitCount], [UnitPrice], [DeliveryDate], [PharmacyId], [WarehouseId]) VALUES (15, N'Advil', 14, CAST(3.45000000 AS Decimal(16, 8)), CAST(N'2023-08-09T00:00:00.000' AS DateTime), 3, 1)
INSERT [Warehouse].[tDeliveries] ([DeliveryId], [DrugName], [UnitCount], [UnitPrice], [DeliveryDate], [PharmacyId], [WarehouseId]) VALUES (16, N'Silver Nitrate', 14, CAST(1.56000000 AS Decimal(16, 8)), CAST(N'2023-08-11T00:00:00.000' AS DateTime), 2, 3)
INSERT [Warehouse].[tDeliveries] ([DeliveryId], [DrugName], [UnitCount], [UnitPrice], [DeliveryDate], [PharmacyId], [WarehouseId]) VALUES (17, N'Advil', 14, CAST(3.45000000 AS Decimal(16, 8)), CAST(N'2023-08-11T00:00:00.000' AS DateTime), 1, 3)
INSERT [Warehouse].[tDeliveries] ([DeliveryId], [DrugName], [UnitCount], [UnitPrice], [DeliveryDate], [PharmacyId], [WarehouseId]) VALUES (18, N'Vodka', 4, CAST(2.10000000 AS Decimal(16, 8)), CAST(N'2023-08-14T00:00:00.000' AS DateTime), 4, 1)
INSERT [Warehouse].[tDeliveries] ([DeliveryId], [DrugName], [UnitCount], [UnitPrice], [DeliveryDate], [PharmacyId], [WarehouseId]) VALUES (19, N'Midichlorians', 16, CAST(4.10000000 AS Decimal(16, 8)), CAST(N'2023-08-16T00:00:00.000' AS DateTime), 3, 1)
INSERT [Warehouse].[tDeliveries] ([DeliveryId], [DrugName], [UnitCount], [UnitPrice], [DeliveryDate], [PharmacyId], [WarehouseId]) VALUES (20, N'Tylenol', 16, CAST(1.25000000 AS Decimal(16, 8)), CAST(N'2023-08-18T00:00:00.000' AS DateTime), 1, 2)
INSERT [Warehouse].[tDeliveries] ([DeliveryId], [DrugName], [UnitCount], [UnitPrice], [DeliveryDate], [PharmacyId], [WarehouseId]) VALUES (21, N'Tylenol', 16, CAST(1.25000000 AS Decimal(16, 8)), CAST(N'2023-08-22T00:00:00.000' AS DateTime), 3, 2)
INSERT [Warehouse].[tDeliveries] ([DeliveryId], [DrugName], [UnitCount], [UnitPrice], [DeliveryDate], [PharmacyId], [WarehouseId]) VALUES (22, N'Whisky', 16, CAST(3.45000000 AS Decimal(16, 8)), CAST(N'2023-08-24T00:00:00.000' AS DateTime), 4, 3)
SET IDENTITY_INSERT [Warehouse].[tDeliveries] OFF
GO
SET IDENTITY_INSERT [Warehouse].[tWarehouses] ON 

INSERT [Warehouse].[tWarehouses] ([WarehouseId], [Name], [Address], [City], [State], [Zip]) VALUES (1, N'Jones Warehouse', N'4908 Oak Lawn Ave', N'Dallas', N'Texas', 75219)
INSERT [Warehouse].[tWarehouses] ([WarehouseId], [Name], [Address], [City], [State], [Zip]) VALUES (2, N'Super Warehouse', N'5134 Milling Rd', N'San Antonio', N'Texas', 70500)
INSERT [Warehouse].[tWarehouses] ([WarehouseId], [Name], [Address], [City], [State], [Zip]) VALUES (3, N'713 Warehouse', N'16721 Jones Rd', N'Houston', N'Texas', 77065)
SET IDENTITY_INSERT [Warehouse].[tWarehouses] OFF
GO
ALTER TABLE [Pharmacy].[tPharmacists]  WITH CHECK ADD FOREIGN KEY([PharmacyId])
REFERENCES [Pharmacy].[tPharmacies] ([Id])
GO
ALTER TABLE [Warehouse].[tDeliveries]  WITH CHECK ADD FOREIGN KEY([PharmacyId])
REFERENCES [Pharmacy].[tPharmacies] ([Id])
GO
ALTER TABLE [Warehouse].[tDeliveries]  WITH CHECK ADD FOREIGN KEY([WarehouseId])
REFERENCES [Warehouse].[tWarehouses] ([WarehouseId])
GO
/****** Object:  StoredProcedure [Pharmacy].[pPharmacistProduction]    Script Date: 8/31/2023 10:43:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [Pharmacy].[pPharmacistProduction] 
AS 
BEGIN 
     SELECT
        ph.PharmacistId,
		ph.FirstName,
		ph.LastName,
		SUM(CASE WHEN ph.PrimaryDrug = d.DrugName THEN d.UnitCount ELSE 0 END) AS 'Total Primary Drug Sold',
		SUM(CASE WHEN ph.PrimaryDrug != d.DrugName THEN d.UnitCount ELSE 0 END) AS 'Total Non Primary Drug Sold'
    FROM 
        Pharmacy.tPharmacists ph
    LEFT JOIN 
        Pharmacy.tPharmacies p
    ON 
        ph.PharmacyId = p.Id
	LEFT JOIN 
		Warehouse.tDeliveries d
	ON 
		p.Id = d.PharmacyId
	GROUP BY ph.PharmacistId, ph.FirstName, ph.LastName
END 
GO
/****** Object:  StoredProcedure [Warehouse].[pDeliveriesDetails]    Script Date: 8/31/2023 10:43:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Warehouse].[pDeliveriesDetails] 
AS 
BEGIN 
    SELECT 
        w.Name AS 'Warehouse Name',
        p.Name AS 'Pharmacy Name',
        d.DrugName,
        d.UnitCount,
        d.UnitPrice,
        d.DeliveryDate
    FROM 
        Warehouse.tDeliveries d
    LEFT JOIN 
        Warehouse.tWarehouses w
    ON 
        d.WarehouseId = w.WarehouseId
    LEFT JOIN 
        Pharmacy.tPharmacies p
    ON 
        d.PharmacyId = p.Id
END 
GO
USE [master]
GO
ALTER DATABASE [BusinessApp] SET  READ_WRITE 
GO
