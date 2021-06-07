-- Задание №1
select payment_id, payment_date, row_number() over (order by payment_date)
from payment

-- Задание №2
select payment_id, payment_date, customer_id, row_number() over (partition by customer_id)
from payment
ORDER by customer_id,payment_date

-- Задание №3
select customer_id,payment_id, payment_date, amount,
sum(amount) over (partition by customer_id order by payment_date)
from payment
ORDER by customer_id,payment_date

-- Задание №4
select customer_id,payment_id,payment_date,amount
from (
select customer_id, payment_id, payment_date, row_number() over (partition by customer_id order by payment_date desc),amount
from payment
) as t
where row_number = 1
