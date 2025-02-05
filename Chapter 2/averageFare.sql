use lagos_ride;
select RideID, fare, avg(fare) > 50 as averageFare, avg(fare) < 50 as averageFare from rides
group by RideID, Fare 
order by fare desc



