IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'Pharmacy' AND TABLE_NAME = 'tPharmacists')
BEGIN 
    CREATE TABLE [Pharmacy].[tPharmacists] (
        PharmacistId INT PRIMARY KEY IDENTITY,
        FirstName NVARCHAR(255) NOT NULL,
        LastName NVARCHAR(255) NOT NULL,
        Age INT NOT NULL,
        PrimaryDrug NVARCHAR(255) NOT NULL,
        DateHired DATETIME NOT NULL,
        PharmacyId INT FOREIGN KEY REFERENCES Pharmacy.tPharmacies(Id)
    )
END
GO