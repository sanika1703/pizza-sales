-- 1) Calculate the percentage contribution of each pizza type to total revenue.
select pizza_types.category , 
round(sum(pizzas.price * order_details.quantity)/ (select
round(sum(order_details.quantity * pizzas.price),2) as total_sales
from order_details join pizzas
on pizzas.pizza_id = order_details.pizza_id)*100,2)as revenue
from pizza_types join pizzas
on pizza_types.pizza_type_id = pizzas.pizza_type_id
join order_details
on order_details.pizza_id = pizzas.pizza_id
group by pizza_types.category
order by revenue desc;


-- 2) Analyze the cumulative revenue generated over time.