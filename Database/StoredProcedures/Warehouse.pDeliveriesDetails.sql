IF EXISTS (SELECT * FROM sysobjects WHERE  id = object_id(N'[Warehouse].[pDeliveriesDetails]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1 )
BEGIN 
    DROP PROCEDURE Warehouse.pDeliveriesDetails
END 
GO 

CREATE PROCEDURE Warehouse.pDeliveriesDetails 
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
