use cape_codd;
select WarehouseID, sum(QuantityOnHand) as TotalItemsOnHand from inventory
where sku < 3
group by WarehouseID
order by TotalItemsOnHand desc

