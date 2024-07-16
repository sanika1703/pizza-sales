-- 1)Join the necessary tables to find the total quantity of each pizza category ordered.
select pizza_types.category, sum(order_details.quantity)as quantity
from pizza_types join pizzas
on  pizza_types.pizza_type_id = pizzas.pizza_type_id
join order_details
on order_details.pizza_id = pizzas.pizza_id
group by pizza_types.category
order by quantity desc;
order_detailsorder_details


-- 2)Determine the distribution of orders by hour of the day.
select hour(oder_time),count(order_id) from orders
group by hour(oder_time);


-- 3)Join relevant tables to find the category-wise distribution of pizzas
select category , count(name)from pizza_types
group by category;


-- 3)Group the orders by date and calculate the average number of pizzas ordered per day.
select round(avg(quantity),0)from
(select orders.order_date, sum(order_details.quantity)as quantity
from orders join order_details
on orders.order_id = order_details.order_id
group by orders.order_date) as order_quantity; 


-- 4) Determine the top 3 most ordered pizza types based on revenue.
select pizza_types.name , 
round(sum(pizzas.price * order_details.quantity),0) as revenue
from pizza_types join pizzas
on pizza_types.pizza_type_id = pizzas.pizza_type_id
join order_details
on order_details.pizza_id = pizzas.pizza_id
group by pizza_types.name
order by revenue desc limit 3;