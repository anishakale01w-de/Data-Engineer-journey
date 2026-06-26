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

-- usin dense rank 
