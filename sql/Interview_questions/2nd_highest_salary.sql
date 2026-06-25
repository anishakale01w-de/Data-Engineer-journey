/*
Question 1 — Second highest salary
Table: employees (emp_id, emp_name, department, salary)
Write a query to find the second highest salary.
*/
SELECT emp_id, emp_name FROM employee_tbl where salary <> max(salary);
