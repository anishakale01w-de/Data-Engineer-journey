/*Question 10 of 10 — Last one! 🎯🔥
Tables:
employees (emp_id, emp_name, department_id, salary, joining_date)
departments (department_id, department_name, location)
orders (order_id, customer_id, order_date, order_amount, status)
Write a query to find:

Department name
Total number of employees in that department
Average salary of that department
Only include departments where average salary is above 50,000
Sort by total employees descending

This is a combination question — tests JOIN + GROUP BY + HAVING + ORDER BY together in one query!
*/

--SOLUTION
SELECT 
b.department_name, 
COUNT(a.emp_id) AS emp_cnt,        
AVG(a.salary) AS avg_sal          
FROM employees a
INNER JOIN departments b              
ON a.department_id = b.department_id
GROUP BY b.department_name           
HAVING AVG(a.salary) > 50000
ORDER BY emp_cnt DESC;      

--keypoints and cross questions
/*Cross questions:

"Why INNER JOIN and not LEFT JOIN?" → INNER JOIN because we only want departments that HAVE employees. LEFT JOIN would include empty departments with NULL counts.
"What if you want departments with NO employees too?"

sql-- Flip to departments as left table
FROM departments b
LEFT JOIN employees a
ON a.department_id = b.department_id
GROUP BY b.department_name
HAVING AVG(a.salary) > 50000 
OR AVG(a.salary) IS NULL;

"Can you use emp_cnt alias in HAVING?" → No! HAVING runs before SELECT. Must repeat COUNT(a.emp_id) > 5 in HAVING if needed.
"What if you want departments with more than 5 employees AND avg salary > 50000?"

sqlHAVING COUNT(a.emp_id) > 5 
AND AVG(a.salary) > 50000;
*/
