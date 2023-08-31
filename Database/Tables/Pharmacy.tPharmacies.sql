IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'Pharmacy' AND TABLE_NAME = 'tPharmacies')
BEGIN 
    CREATE TABLE [Pharmacy].[tPharmacy] (
        Id INT PRIMARY KEY IDENTITY,
        Name NVARCHAR(255) NOT NULL,
        Address NVARCHAR(255) NOT NULL,
        City NVARCHAR(255) NOT NULL,
        State NVARCHAR(255) NOT NULL,
        Zip INT NOT NULL,
        FilledPrescriptions INT NOT NULL,
        CreatedDate DATETIME NOT NULL,
        UpdatedDate DATETIME NOT NULL,
    )
END
GO
