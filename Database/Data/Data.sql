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