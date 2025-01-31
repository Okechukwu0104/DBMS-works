use mdc_ch02;
select LastName, FirstName, Phone, DateIn, DateOut from customer inner join invoice
where totalAmount > 100