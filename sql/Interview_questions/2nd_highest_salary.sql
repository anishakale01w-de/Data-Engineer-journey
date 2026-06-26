/*
Question 1 — Second highest salary
Table: employees (emp_id, emp_name, department, salary)
Write a query to find the second highest salary.
*/
SELECT max(salary) FROM employee_tbl where salary <(select  max(salary) from employee_tbl);

-- incase name also asked add one more outer query and make this subquery

SELECT emp_id, emp_name from emp_tbl where salary = (SELECT max(salary) FROM employee_tbl 
  where salary <(select  max(salary) from employee_tbl) 
  );

-- using dense rank 
select salary from (select dense_rank() over (partition by department order by salary desc) as rnk)
where rnk = 2
--
--Approach 3 Using qualify (works in redshift, bigquery, snowflake, teradat)
  
select emp_id, emp_name, salary from emp_tbl 
qualify dense_rank() over (partition by department order by salary desc) = 2 

--key learning 
Memory trick:

WHERE = filter rows
HAVING = filter groups
QUALIFY = filter window results
