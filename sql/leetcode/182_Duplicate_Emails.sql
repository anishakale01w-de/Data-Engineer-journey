--Leetcode problem : https://leetcode.com/problems/duplicate-emails/description/
/* Description
182. Duplicate Emails
Solved
Easy
Topics
premium lock icon
Companies
SQL Schema
Pandas Schema
Table: Person

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| email       | varchar |
+-------------+---------+
id is the primary key (column with unique values) for this table.
Each row of this table contains an email. The emails will not contain uppercase letters.
 

Write a solution to report all the duplicate emails. Note that it's guaranteed that the email field is not NULL.

Return the result table in any order.

The result format is in the following example.

 

Example 1:

Input: 
Person table:
+----+---------+
| id | email   |
+----+---------+
| 1  | a@b.com |
| 2  | c@d.com |
| 3  | a@b.com |
+----+---------+
Output: 
+---------+
| Email   |
+---------+
| a@b.com |
+---------+
Explanation: a@b.com is repeated two times.

*/

--SOLUTION

SELECT email FROM person group by email having count(email)>1;

-- ============================================
-- KEY LEARNING
-- ============================================
-- COUNT(*) vs COUNT(column_name):
--
-- COUNT(*)        → counts ALL rows including NULLs
-- COUNT(email)    → counts only NON-NULL values
--
-- In this problem both give same result because
-- email is guaranteed NOT NULL.
--
-- But in real production tables with messy data,
-- COUNT(email) is safer and more explicit.
-- Always prefer COUNT(column_name) as a habit
-- when you care about a specific field.
-- ============================================
