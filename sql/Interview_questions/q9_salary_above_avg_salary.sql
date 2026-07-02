/*
Question 8 of 10 🎯
Table: employees (emp_id, emp_name, department, salary, joining_date)
Write a query using CTE to find employees whose salary is above the average salary of their department.
This tests your knowledge of CTEs (Common Table Expressions) — very commonly asked!
*/

--using cte, Approach 1 
with 
avg_sal as (
select  department
,AVG(Salary) as salary from employees group by 1)

select emp_id, emp_name,salary from employees a inner join avg_sal b
on a.department = b.department
where a.salary > b.salary;

--Approach 2
--without cte, using windows function and qaulify

SELECT *
FROM employees
QUALIFY salary > AVG(salary) OVER(PARTITION BY department);


--Approach 3
--subquery method

SELECT emp_id, emp_name, salary FROM (
SELECT emp_id, emp_name, department, salary,
AVG(salary) OVER (PARTITION BY department) AS avg_salary
FROM employees
) a WHERE salary > avg_salary; 

--Approach 4
--inner join with subquery

SELECT a.emp_id, a.emp_name, a.salary, a.department
FROM employees a
INNER JOIN (
SELECT department, AVG(salary) AS avg_sal
FROM employees GROUP BY department
) b ON a.department = b.department
WHERE a.salary > b.avg_sal; 
