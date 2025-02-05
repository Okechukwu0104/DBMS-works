use lagos_ride;
select RiderID,riders.Name,avg(Rating) as Average_rating from drivers,riders
group by RiderID
having Average_Rating < 3;