use cape_codd;
select SKU,SKU_Description,WarehouseID
from inventory where QuantityOnOrder > 0 and QuantityOnHand = 0
order by SKU asc, WarehouseID desc