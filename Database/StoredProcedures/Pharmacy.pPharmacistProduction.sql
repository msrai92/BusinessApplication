IF EXISTS (SELECT * FROM sysobjects WHERE  id = object_id(N'[Pharmacy].[pPharmacistProduction]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1 )
BEGIN 
    DROP PROCEDURE Pharmacy.pPharmacistProduction 
END 
GO 

CREATE PROCEDURE Pharmacy.pPharmacistProduction 
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
