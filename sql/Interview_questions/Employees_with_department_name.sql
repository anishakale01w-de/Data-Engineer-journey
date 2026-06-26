Question 3 — Employees with department name
Tables:
employees (emp_id, emp_name, department_id, salary)
departments (department_id, department_name, location)
Write a query to fetch all employees with their department name, including employees with no department assigned.

--SOLUTION
SELECT EMP_ID, EMP_NAME, b.department_name from employees a left jon departments b on a.department_id = b.department_id
;
