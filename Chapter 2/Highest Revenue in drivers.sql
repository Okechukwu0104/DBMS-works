use lagos_ride;
select drivers.DriverID , Name ,(fare * TotalRides) as TotalRevenue from drivers  , rides 

order by TotalRevenue desc limit 1
