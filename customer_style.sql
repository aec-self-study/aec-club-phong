--redoing the exercise using a CTE and trying to adhere to good style practices
with orders as  (   
    select 
        customer_id, 
        min(created_at) as first_order_at, 
        count(*) as number_of_orders 
    from `analytics-engineers-club.coffee_shop.orders`
    group by 1

) 


select 
    id as customer_id, 
    name, 
    email, 
    first_order_at, 
    orders.number_of_orders 
from `analytics-engineers-club.coffee_shop.customers` as customers
inner join orders
    on customers.customer_id = orders.customer_id
order by first_order_at
limit 5;