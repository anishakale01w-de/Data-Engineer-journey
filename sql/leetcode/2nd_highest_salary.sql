/* Second highes salary 

----------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------
Problem Statement:
Q. Find the Second Highest Salary
Table: employees (emp_id, emp_name, department, salary)
Task: Write a SQL query to find the second highest salary from the employees table. If there is no second highest salary, the query should return NULL.
Expected Output: A single row containing the second highest salary value.
Concepts covered: Subqueries, Window Functions, DENSE_RANK(), LIMIT/OFFSET
 
Note: Use LIMIT instead of TOP for Redshift/PostgreSQL environments.
*/
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Approaches:
--1. Subquery with MAX()

select max(salary) FROM Employee_tbl  WHERE salary < (SELECT MAX(salary) FROM employee_tbl)  ;

/*
Why this is interview favourite:
Easy to read and explain
Naturally returns NULL if no second highest exists
No need for DISTINCT

Cross questions they can ask:

"How many times does this scan the table?" → Twice — once for inner MAX, once for outer MAX. So slightly less efficient on huge tables.
"What if all salaries are the same?" → Inner MAX = outer MAX, WHERE condition filters everything out → returns NULL ✅
"Can you do this without subquery?" → Yes, using window functions (approach 3)
  */
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--2. LIMIT with OFFSET
--OFFSET = means skip this many rows
SELECT distinct salary from employee_tbl order by desc limit 1 offset 1;

--- insights : 
--Why DISTINCT?
--Without DISTINCT, if two people have salary 90000, OFFSET 1 still gives 90000 again — wrong answer. 
--  DISTINCT ensures unique values before skipping.
--"Is this efficient?" → Not great on large tables since it scans and sorts everything first.
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--3. DENSE_RANK() window function
SELECT salary FROM (
  SELECT salary, DENSE_RANK() OVER (ORDER BY salary DESC) AS rnk
  FROM employees
) t
WHERE rnk = 2;

/*
Why this is the most powerful:

Easily extendable — change rnk = 2 to any Nth rank
Works well with PARTITION BY for department-wise ranking
One table scan only — most efficient

Cross questions they can ask:

"Why DENSE_RANK and not RANK?" → RANK skips numbers on ties. If two people share rank 1, RANK gives next person rank 3 — we'd miss rank 2 entirely. DENSE_RANK gives rank 2 correctly ✅
"Why not ROW_NUMBER?" → ROW_NUMBER gives unique numbers even for equal salaries — so two people with same salary get different row numbers, giving wrong second highest.
"Can you get top 3 salaries using this?" → Yes!

sqlWHERE rnk <= 3

"Can you get second highest per department?"

sqlSELECT dept, salary FROM (
  SELECT department as dept, salary, 
  DENSE_RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS rnk
  FROM employees
) t
WHERE rnk = 2;
*/
--Revision 01/07/26
