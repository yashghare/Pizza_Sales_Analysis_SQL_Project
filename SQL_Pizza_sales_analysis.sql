use pizza;
select * from pizza_types;
select * from pizzas;
select * from orders;
select * from order_details;

# 1. Retrieve the total number of orders placed. 
SELECT COUNT(order_id) AS total_orders
FROM orders;

#2 Calculate the total revenue generated from pizza sales. 
select round(sum(pizzas.price * order_details.quantity))'Total Revenue' 
from pizzas 
inner join order_details where order_details.pizza_id=pizzas.pizza_id;

#3 Identify the highest-priced pizza.
select max(price)'Highets Priced Pizza'
from pizzas;

#4 Identify the most common pizza size ordered.
SELECT p.size, SUM(od.quantity) AS total_ordered
FROM pizzas p 
INNER JOIN order_details od 
    ON p.pizza_id = od.pizza_id
GROUP BY p.size
order by total_ordered desc
limit 1;

#5 List the top 5 most ordered pizza types along with their quantities.
SELECT pt.name AS pizza_name,
       SUM(od.quantity) AS total_ordered
FROM order_details od
JOIN pizzas p 
    ON od.pizza_id = p.pizza_id
JOIN pizza_types pt 
    ON p.pizza_type_id = pt.pizza_type_id
GROUP BY pt.name
ORDER BY total_ordered DESC
LIMIT 5;

#6 Join the necessary tables to find the total quantity of each pizza category ordered. 
SELECT pt.category as category,
	sum(od.quantity) as quantity
from pizza_types pt
inner join pizzas p
	on pt.pizza_type_id = p.pizza_type_id
inner join order_details od
	on p.pizza_id = od.pizza_id
group by category;

#7 Determine the distribution of orders by hour of the day.
select hour(time) as hours,count(order_id) as orders 
from orders
group by hours;

#8 Join relevant tables to find the category-wise distribution of pizzas. 
select pt.category as category,count(pt.name) as total_pizzas
from pizza_types pt
group by category;

#9 Group the orders by date and calculate the average number of pizzas ordered per day.
SELECT o.date,
       SUM(od.quantity) AS total_pizzas,
       ROUND(AVG(SUM(od.quantity)) OVER(), 2) AS avg_pizzas_per_day
FROM orders o
JOIN order_details od 
    ON o.order_id = od.order_id
GROUP BY o.date
ORDER BY o.date;

#10 Determine the top 3 most ordered pizza types based on revenue.
SELECT pt.name AS pizza_type,
       ROUND(SUM(p.price * od.quantity), 2) AS revenue
FROM order_details od
JOIN pizzas p 
    ON od.pizza_id = p.pizza_id
JOIN pizza_types pt 
    ON p.pizza_type_id = pt.pizza_type_id
GROUP BY pt.name
ORDER BY revenue DESC
LIMIT 3;

# 11 Calculate the percentage contribution of each pizza type to total revenue. 
SELECT pt.name AS pizza_type,
       SUM(p.price * od.quantity) AS revenue,
       ROUND( (SUM(p.price * od.quantity) * 100.0 / 
              (SELECT SUM(p2.price * od2.quantity)
               FROM order_details od2
               JOIN pizzas p2 ON od2.pizza_id = p2.pizza_id)), 2 ) AS revenue_pct
FROM order_details od
JOIN pizzas p ON od.pizza_id = p.pizza_id
JOIN pizza_types pt ON p.pizza_type_id = pt.pizza_type_id
GROUP BY pt.name
ORDER BY revenue_pct DESC;


#12 Analyze the cumulative revenue generated over time.
SELECT o.date,
       SUM(p.price * od.quantity) AS daily_revenue,
       SUM(SUM(p.price * od.quantity)) 
           OVER (ORDER BY o.date) AS cumulative_revenue
FROM orders o
JOIN order_details od ON o.order_id = od.order_id
JOIN pizzas p ON od.pizza_id = p.pizza_id
GROUP BY o.date
ORDER BY o.date;

#13 Determine the top 3 most ordered pizza types based on revenue for each pizza category.
SELECT category, pizza_type, revenue
FROM (
    SELECT pt.category,
           pt.name AS pizza_type,
           SUM(p.price * od.quantity) AS revenue,
           RANK() OVER (PARTITION BY pt.category 
                        ORDER BY SUM(p.price * od.quantity) DESC) AS rnk
    FROM order_details od
    JOIN pizzas p 
        ON od.pizza_id = p.pizza_id
    JOIN pizza_types pt 
        ON p.pizza_type_id = pt.pizza_type_id
    GROUP BY pt.category, pt.name
) AS ranked
WHERE rnk <= 3
ORDER BY category, revenue DESC;
