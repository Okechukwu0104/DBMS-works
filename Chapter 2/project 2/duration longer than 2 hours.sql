use lagos_ride;
select RideID,(DistanceKM / TotalRides) * 60 as Duration,drivers.DriverID,RiderID from rides , drivers
having Duration > 2
order by duration asc
