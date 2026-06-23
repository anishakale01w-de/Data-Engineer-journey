/* 584. Find Customer Referee
easy
null handling
NULL in SQL is not zero, not empty string — it means unknown/missing. This causes bugs in real pipelines constantly.
Key rules to remember:

WHERE column = NULL → never works
WHERE column IS NULL → correct way
WHERE column IS NOT NULL → correct way
NULL = NULL → returns false in SQL

Table: Customer

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| name        | varchar |
| referee_id  | int     |
+-------------+---------+
In SQL, id is the primary key column for this table.
Each row of this table indicates the id of a customer, their name, and the id of the customer who referred them.
 

Find the names of the customer that are either:

referred by any customer with id != 2.
not referred by any customer.
Return the result table in any order.

The result format is in the following example.

 

Example 1:

Input: 
Customer table:
+----+------+------------+
| id | name | referee_id |
+----+------+------------+
| 1  | Will | null       |
| 2  | Jane | null       |
| 3  | Alex | 2          |
| 4  | Bill | null       |
| 5  | Zack | 1          |
| 6  | Mark | 2          |
+----+------+------------+
Output: 
+------+
| name |
+------+
| Will |
| Jane |
| Bill |
| Zack |
*/
--SOLUTION
SELECT name from customer where referee_id <> 2 or referee_id is null ; 

--KEY LEARNING
-- KEY LEARNING
-- NULL values are INVISIBLE to comparison operators
-- WHERE referee_id != 2 silently excludes NULLs
-- Always ask: "can this column be NULL?" in real pipelines
-- If yes, handle it explicitly with IS NULL or IS NOT NULL
-- This is a very common source of bugs in production data pipelines
+------+
 
