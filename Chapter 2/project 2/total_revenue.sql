use lagos_ride;
select RideID, fare, 30 as days, (fare*30) as total_revenue from rides
