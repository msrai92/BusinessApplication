IF EXISTS (SELECT * FROM sysobjects WHERE  id = object_id(N'[Warehouse].[pWarehousesProfit]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1 )
BEGIN 
    DROP PROCEDURE Warehouse.pWarehousesProfit
END 
GO 

CREATE PROCEDURE Warehouse.pWarehousesProfit
AS 
BEGIN 
   SELECT 
		w.WarehouseID,
		w.Name,
        SUM(d.UnitCount * d.UnitPrice) AS 'Total Revenue',
		SUM(d.UnitCount) AS 'Total Unit Count',
		(SUM(d.UnitCount * d.UnitPrice)/SUM(d.UnitCount)) AS 'Average Profit'
    FROM 
        Warehouse.tWarehouses w
    LEFT JOIN 
        Warehouse.tDeliveries d
    ON 
        w.WarehouseId = d.WarehouseId
	GROUP BY 
        w.WarehouseID, w.Name
	ORDER BY 
        'Total Revenue' DESC
END 
GO
