/*
Question 9 of 10 🎯
Table: orders (order_id, customer_id, order_date, order_amount, status)
Write a query to find customers who have placed more than 3 orders AND whose total order amount is greater than 10,000. Show customer_id, total orders and total amount.
This tests GROUP BY + HAVING with multiple conditions — very commonly asked!
*/

--SOLUTION
SELECT 
customer_id, 
COUNT(order_id) AS total_orders,       
SUM(order_amount) AS total_amount      
FROM orders
GROUP BY customer_id
HAVING COUNT(order_id) > 3                
AND SUM(order_amount) > 10000; 

--KEYPOINTS
/*
Cross questions 

"What if you want either condition — more than 3 orders OR amount > 10000?"

sql HAVING COUNT(order_id) > 3 
OR SUM(order_amount) > 10000;  -- just change AND to OR

"What if you want only completed orders?"

sql WHERE status = 'completed'     -- 👈 add before GROUP BY
GROUP BY customer_id
HAVING COUNT(order_id) > 3
AND SUM(order_amount) > 10000;

"Can you filter on two different columns in HAVING?"
→ Yes! You just did it — COUNT and SUM are two different aggregations ✅

"What's the difference between COUNT(order_id) and COUNT()?"*

COUNT(order_id) — ignores NULLs, more precise, safer choice
COUNT(*) — counts every row including NULLs, use for total row count

Golden tip 💡
Always use COUNT(column_name) instead of COUNT(*) in interviews — shows you're aware of NULL handling!
  */
