/*Question 6 of 10 🎯
Table: employees (emp_id, emp_name, department, salary, joining_date)
Write a query to find the running total of salary department wise, ordered by joining date.
This tests your knowledge of window functions with SUM OVER — very commonly asked for Data Engineer roles!
*/
select sum(salary) over ( partition by department order by joining date), department from employees;
/*
key points 
Cross questions they will ask:

"What is the difference between SUM() OVER and GROUP BY SUM?"

SUM() OVERGROUP BY SUMRows returnedAll rows keptCollapsed to one row per groupUse caseRunning total, cumulativeTotal per group

"How do you get overall running total without department wise?"

sqlSUM(salary) OVER (ORDER BY joining_date) AS running_total
-- just remove PARTITION BY!

"What happens if two employees have same joining date?"
→ Both get included in same cumulative sum — order between them is non-deterministic. Add a tiebreaker:

sqlORDER BY joining_date, emp_id  -- 👈 tiebreaker

Golden tip 💡
Running total is one of the most common Data Engineer interview questions. Always remember:

Running total → SUM() OVER (ORDER BY date)
Department wise → add PARTITION BY department
Reset per group → PARTITION BY handles it automatically
*/
