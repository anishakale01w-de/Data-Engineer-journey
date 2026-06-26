
Q2 — Department average salary filter
Table: employees (emp_id, emp_name, department, salary, manager_id)
Write a query to find all departments where average salary is greater than 60,000. Show department name and average salary, sorted highest average first.

select department, avg(salary)  as avg_salary 
from employee group by department having avg(salary) > 60000 order by  avg_salary


