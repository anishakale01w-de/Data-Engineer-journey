/*Employee Department Listing with Unassigned Employees
Tables:

employees (emp_id, emp_name, department_id, salary)

departments (department_id, department_name, location)
Task: Fetch all employees along with their department name. Include employees who have not been assigned to any department yet.
*/

SOLUTION

SELECT emp_name, department_name 
FROM departments b
LEFT JOIN employees a 
ON a.department_id = b.department_id;
