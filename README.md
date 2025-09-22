# 🍕 Pizza Sales Analysis with SQL  

## 📌 Project Overview  
This project focuses on analyzing a **pizza sales dataset** using SQL to uncover insights about:  
- Sales patterns  
- Order distributions  
- Revenue trends  
- Pizza popularity  

The project includes SQL queries of varying complexity, from basic aggregations to advanced analytical queries such as cumulative revenue tracking and percentage contribution analysis.  

---

## 🗄️ Dataset  
The dataset simulates a pizza restaurant’s order system and consists of the following key tables:  

- **pizza_types**: Contains details of pizza categories and names.  
- **pizzas**: Contains information about pizza IDs, sizes, and prices.  
- **orders**: Records order IDs, dates, and times.  
- **order_details**: Stores the order details including quantities and linked pizza IDs.  

🔗 Dataset Link: [Download Here](https://drive.google.com/file/d/1wfqpxZyATIZTZFnG_WWEXUBl9BIa08GD/view?usp=sharing)  

---

## 🎯 Learning Objectives  
By completing this project, you will:  
- Gain experience working with **SQL for business data analysis**.  
- Write queries to perform **aggregation, grouping, and joins**.  
- Analyze **order trends, revenue, and customer preferences**.  
- Apply **advanced SQL techniques** such as window functions, ranking, and cumulative analysis.  

---

## 🚀 Project Tasks  

### 🔹 Basic Level  
1. Retrieve the total number of orders placed.  
2. Calculate the total revenue generated from pizza sales.  
3. Identify the highest-priced pizza.  
4. Identify the most common pizza size ordered.  
5. List the top 5 most ordered pizza types along with their quantities.  

### 🔹 Intermediate Level  
6. Find the total quantity of each pizza category ordered.  
7. Determine the distribution of orders by hour of the day.  
8. Find the category-wise distribution of pizzas.  
9. Group orders by date and calculate the average number of pizzas ordered per day.  
10. Determine the top 3 most ordered pizza types based on revenue.  

### 🔹 Advanced Level  
11. Calculate the percentage contribution of each pizza type to total revenue.  
12. Analyze the cumulative revenue generated over time.  
13. Determine the top 3 most ordered pizza types based on revenue for each pizza category.  

---

## 📂 Files in this Project  

- **📄 Mini Project_ Pizza Sales Analysis with SQL.pdf**  
  Contains the problem statement, dataset link, and detailed project instructions.  

- **💻 pizza_db.sql**  
  Database schema and sample data for the pizza sales dataset.  

- **💻 SQL_Pizza_sales_analysis.sql**  
  SQL solutions to all project tasks, covering:  
  - `SELECT`, `WHERE`, `GROUP BY`, `ORDER BY`  
  - `JOIN` operations across multiple tables  
  - Aggregations (`SUM`, `COUNT`, `AVG`)  
  - Window functions (`RANK`, `OVER`)  
  - Cumulative and percentage calculations  

---

## 📝 Expected Outcomes  
- **Basic**: Ability to use simple queries and aggregations.  
- **Intermediate**: Ability to join tables and analyze order and category trends.  
- **Advanced**: Proficiency in applying analytical SQL concepts such as ranking, cumulative revenue, and revenue share analysis.  

---

## ⚡ How to Run  
1. Load the `pizza_db.sql` schema into your preferred SQL database (MySQL recommended).  
2. Import the dataset into the database.  
3. Open the `SQL_Pizza_sales_analysis.sql` file.  
4. Execute queries step by step to explore insights.  
5. Experiment by modifying queries to generate custom insights.  

---

## 📊 Sample Insights You Can Derive  
- Which pizza size is ordered the most.  
- Top revenue-generating pizza types and categories.  
- Peak ordering hours in a day.  
- Daily order volume and revenue growth over time.  
- Each pizza type’s percentage contribution to total sales.  

---

## 👨‍💻 Author  
This project was created as part of a **SQL mini project** to practice data exploration and business insights generation.  
