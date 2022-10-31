SELECT customers.customer_id, name, email, first_order_at, orders.number_of_orders 
FROM 
(select id as customer_id, name, email  from `analytics-engineers-club.coffee_shop.customers`
) customers
INNER JOIN
 
(select customer_id, min(created_at) as first_order_at, count(*) as number_of_orders from `analytics-engineers-club.coffee_shop.orders`
group by 1) orders
on customers.customer_id = orders.customer_id
order by first_order_at
LIMIT 5;
