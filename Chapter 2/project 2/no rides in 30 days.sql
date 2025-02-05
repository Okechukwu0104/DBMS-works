use lagos_ride ;
select drivers.DriverID, drivers.Name from riders,drivers,rides where drivers.TotalRides/30 < 3
group by drivers.DriverID 
order by drivers.DriverID asc