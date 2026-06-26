/*Q4 — Employees earning more than their manager
Table: employees (emp_id, emp_name, department_id, salary, manager_id)
Note — manager_id refers to emp_id of the manager. So the same table has both employee and manager data!

*/
SELECT a.emp_id, a.salary as emp_salary, a.manager_id, b.salary as manager_salary
from employyees_tbl a  join employees_tbl b on a.manager_id = b.emp_id
where  a.salary >  b.salary;

/*
Key notes
Cross questions they will ask:

"Why did you use JOIN and not LEFT JOIN here?" → Regular JOIN because we only want employees WHO HAVE a manager. 
LEFT JOIN would include employees with no manager (NULL manager_id) which isn't needed here.
"What if you want employees with no manager as well?" → then use left join

"Self join is not a separate join type — it's just a regular JOIN where both sides 
reference the same table with different aliases. We use it when we need to compare rows within the same table."
*/