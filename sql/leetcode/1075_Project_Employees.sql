1075. Project Employees I
 /*
Easy
Topics
premium lock icon
Companies
SQL Schema
Pandas Schema
Table: Project

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| project_id  | int     |
| employee_id | int     |
+-------------+---------+
(project_id, employee_id) is the primary key of this table.
employee_id is a foreign key to Employee table.
Each row of this table indicates that the employee with employee_id is working on the project with project_id.
 

Table: Employee

+------------------+---------+
| Column Name      | Type    |
+------------------+---------+
| employee_id      | int     |
| name             | varchar |
| experience_years | int     |
+------------------+---------+
employee_id is the primary key of this table. It's guaranteed that experience_years is not NULL.
Each row of this table contains information about one employee.
 

Write an SQL query that reports the average experience years of all the employees for each project, rounded to 2 digits.

Return the result table in any order.

The query result format is in the following example.

 

Example 1:

Input: 
Project table:
+-------------+-------------+
| project_id  | employee_id |
+-------------+-------------+
| 1           | 1           |
| 1           | 2           |
| 1           | 3           |
| 2           | 1           |
| 2           | 4           |
+-------------+-------------+
Employee table:
+-------------+--------+------------------+
| employee_id | name   | experience_years |
+-------------+--------+------------------+
| 1           | Khaled | 3                |
| 2           | Ali    | 2                |
| 3           | John   | 1                |
| 4           | Doe    | 2                |
+-------------+--------+------------------+
Output: 
+-------------+---------------+
| project_id  | average_years |
+-------------+---------------+
| 1           | 2.00          |
| 2           | 2.50          |
+-------------+---------------+
Explanation: The average experience years for the first project is (3 + 2 + 1) / 3 = 2.00 and for the second project is (3 + 2) / 2 = 2.50

-----------------------------------------------------------------------------------------------------------------------------
---------------------------------Solution--------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------

# Write your MySQL query statement below
*/
 
select a.project_id, round(avg(b.experience_years), 2) as average_years
from project a 
inner join employee b 
on a.employee_id  = b.employee_id  GROUP BY a.project_id

-- ============================================
-- KEY LEARNING
-- ============================================
-- 1. ROUND(value, 2) → rounds to 2 decimal places
--    Always use when problem says "rounded to N digits"
--
-- 2. AVG() with GROUP BY → calculates average per group
--    Pattern: SELECT group_col, AVG(measure_col)
--             FROM table GROUP BY group_col
--
-- 3. INNER JOIN was correct here because employee_id
--    in Project is a FOREIGN KEY to Employee table
--    → guaranteed every employee exists → no NULL risk
--    Use INNER JOIN when relationship is guaranteed
--    Use LEFT JOIN when you want to keep unmatched rows
--
-- 4. Table aliases (a, b) → cleaner code when joining
--    Good habit for readability in complex queries
