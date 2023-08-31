IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'Warehouse' AND TABLE_NAME = 'tDeliveries')
BEGIN 
    CREATE TABLE [Warehouse].[tDeliveries] (
        DeliveryId INT PRIMARY KEY IDENTITY,
        DrugName NVARCHAR(255) NOT NULL,
        UnitCount INT NOT NULL,
        UnitPrice DECIMAL (16,8) NOT NULL,
        DeliveryDate DATETIME,
        PharmacyId INT FOREIGN KEY REFERENCES Pharmacy.tPharmacies(Id),
        WarehouseId INT FOREIGN KEY REFERENCES Warehouse.tWarehouses(WarehouseId),
    )
END
GO