use cape_codd;
select min(QuantityOnHand) AS minimum,
	max(QuantityOnHand),
    sum(QuantityOnHand),
    avg(QuantityOnHand)

from inventory
-- where SKU % 20 = 0 and QuantityOnOrder >0
-- group by WarehouseID,SKU,SKU_Description,QuantityOnOrder,QuantityOnHand;