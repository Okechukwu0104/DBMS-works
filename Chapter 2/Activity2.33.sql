use cape_codd;
select distinct SKU,SKU_Description from inventory
where SKU_Description like '__d%'
