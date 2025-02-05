use lagos_ride;
select distinct PaymentMethod, count(PaymentMethod) as Number_of_Transactions from payments 
group by PaymentMethod