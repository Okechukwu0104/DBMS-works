use lagos_ride;
select
City as Area,avg(Fare) as Average_Fare from rides,riders
group by City