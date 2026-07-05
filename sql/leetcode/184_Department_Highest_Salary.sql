184. Department Highest Salary/*
Medium
Topics
premium lock icon
Companies
SQL Schema
Pandas Schema
Table: Employee

+--------------+---------+
| Column Name  | Type    |
+--------------+---------+
| id           | int     |
| name         | varchar |
| salary       | int     |
| departmentId | int     |
+--------------+---------+
id is the primary key (column with unique values) for this table.
departmentId is a foreign key (reference columns) of the ID from the Department table.
Each row of this table indicates the ID, name, and salary of an employee. It also contains the ID of their department.
 

Table: Department

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| name        | varchar |
+-------------+---------+
id is the primary key (column with unique values) for this table. It is guaranteed that department name is not NULL.
Each row of this table indicates the ID of a department and its name.
 

Write a solution to find employees who have the highest salary in each of the departments.

Return the result table in any order.

The result format is in the following example.

 

Example 1:

Input: 
Employee table:
+----+-------+--------+--------------+
| id | name  | salary | departmentId |
+----+-------+--------+--------------+
| 1  | Joe   | 70000  | 1            |
| 2  | Jim   | 90000  | 1            |
| 3  | Henry | 80000  | 2            |
| 4  | Sam   | 60000  | 2            |
| 5  | Max   | 90000  | 1            |
+----+-------+--------+--------------+
Department table:
+----+-------+
| id | name  |
+----+-------+
| 1  | IT    |
| 2  | Sales |
+----+-------+
Output: 
+------------+----------+--------+
| Department | Employee | Salary |
+------------+----------+--------+
| IT         | Jim      | 90000  |
| Sales      | Henry    | 80000  |
| IT         | Max      | 90000  |
+------------+----------+--------+
Explanation: Max and Jim both have the highest salary in the IT department and Henry has the highest salary in the Sales department.
*/
------------------------------------------------------------------------------------------------------------------------
------------------SOLUTION------------------------------------------------------------------------------------------------------

 --APPROACH ONE -USING SUBQUERY
Select b.name as Department, a.name as Employee, c.max_salary AS Salary
from Employee a 
inner join department b on a.departmentid = b.id
inner join ( select max(salary) as max_salary, departmentid from employee a group by 2) c ON 
c.departmentid = b.id and a.salary = c.max_salary
;

--APPROACH 2 - USING WINDOW FUNCTION

SELECT  Department, Employee, Salary FROM (
    SELECT b.name as Department, a.name as Employee, a.salary AS Salary,
    rank() over(partition by b.id order by a.salary desc ) as rn 
    FROM Employee a inner join department b on a.departmentid = b.id
) a
WHERE rn = 1;
--this will help if asked top 3 highest, or second highest, nth highest salary. --preffered approach

-- this can also be done using qualify, but limited to redhshift, snowflake
SELECT b.name AS Department, a.name AS Employee, a.salary AS Salary
FROM Employee a 
INNER JOIN Department b ON a.departmentId = b.id
QUALIFY (RANK() OVER (PARTITION BY b.id ORDER BY a.salary DESC)) = 1


-- ============================================
-- KEY LEARNING
-- ============================================
-- 1. SQL DIALECT DIFFERENCES — critical for DE work
--    Every database has its own SQL flavour.
--    What works in Snowflake may fail in MySQL.
--    Always know which database you are writing for.
--
--    QUALIFY support:
--    ✅ Snowflake, BigQuery, Redshift
--    ❌ MySQL, SQL Server, PostgreSQL
--    LeetCode uses MySQL → always use subquery approach
--
-- 2. THREE WAYS TO SOLVE "TOP N PER GROUP" PATTERN
--    This pattern appears constantly in DE interviews
--    and real pipelines. Know all three approaches:
--
--    a) Derived table + double JOIN condition
--       → works everywhere, good for simple cases
--
--    b) Window function + subquery wrapper
--       → cleanest, most readable, preferred in DE
--       → easy to extend (top 3? just change WHERE rnk <= 3)
--
--    c) QUALIFY
--       → cleanest syntax, but dialect specific
--       → use when on Snowflake/BigQuery/Redshift
--
-- 3. RANK() vs ROW_NUMBER() vs DENSE_RANK()
--    RANK()       → gaps in ranking (1,1,3)
--    DENSE_RANK() → no gaps (1,1,2)
--    ROW_NUMBER() → always unique (1,2,3)
--    For "top 1 per group" all three work the same.
--    For "top N per group" the difference matters.
--
-- 4. QUALIFY quirk in Redshift
--    Always alias tables when using QUALIFY in Redshift
--    or it may not work correctly.
-- ============================================
