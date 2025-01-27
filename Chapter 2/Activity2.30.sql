use cape_codd;
select SKU,SKU_Description,WarehouseID,QuantityOnHand from inventory
where QuantityOnHand between 2 and 9
