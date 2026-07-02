Question 7 of 10 🎯
Table: employees (emp_id, emp_name, department, salary, joining_date)
Write a query to find each employee's salary and the salary of the employee who joined just before them in the same department. 
Also show the difference between the two salaries.

select emp_id, emp_name, salary,
lag(salary) over (partition by department order by joining_date) as emp_just_before
  ( salary - lag(salary) over (partition by department order by joining_date)) as diff
from employees;

/*
KEYNOTES
LAG() and LEAD() — access previous or next row's value

LAG() = look BEHIND (previous row)
sqlLAG(salary) OVER (ORDER BY joining_date)
LEAD() = look AHEAD (next row)
sqlLEAD(salary) OVER (ORDER BY joining_date)

Visual example:
emp_namejoining_datesalaryLAG(salary)LEAD(salary)Anisha2021-01-0150000NULL ← no previous60000Raj2021-06-01600005000070000Neha2022-01-017000060000NULL ← no next

Full syntax:
sqlLAG(column, offset, default) OVER (PARTITION BY ... ORDER BY ...)
ParameterMeaningDefaultcolumnWhich column to look atrequiredoffsetHow many rows back/forward1defaultWhat to return if NULLNULL
Example with default:
sqlLAG(salary, 1, 0) OVER (ORDER BY joining_date)
-- returns 0 instead of NULL for first row

With PARTITION BY — resets per group:
sqlLAG(salary) OVER (PARTITION BY department ORDER BY joining_date)
emp_namedepartmentsalaryLAG(salary)AnishaEngineering50000NULL ← first in deptRajEngineering6000050000NehaEngineering7000060000PriyaFinance55000NULL ← resets!KaranFinance6500055000

Common use cases:
Use caseFunctionCompare with previous rowLAG()Compare with next rowLEAD()Month over month growthLAG()Find salary differenceLAG()Predict next valueLEAD()

Real world use — Month over Month:
sqlSELECT 
    month,
    revenue,
    LAG(revenue) OVER (ORDER BY month) AS prev_month_revenue,
    revenue - LAG(revenue) OVER (ORDER BY month) AS growth
FROM monthly_sales;

Memory trick:

LAG = Left = Behind = Previous (L for Left/Last)
LEAD = Right = Ahead = Next (LEAD shows the way forward)
*/
