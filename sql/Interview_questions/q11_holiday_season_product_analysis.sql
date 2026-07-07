# Holiday Season Product Analysis — SQL

> **Source:** Flipkart Data Engineering Interview  
> **Topic:** SQL — Filtering, Joins, Aggregation  
> **Difficulty:** Medium  
> **Tags:** `sql` `joins` `aggregation` `date-functions` `interview`

---

## Problem Statement

You are working as a Data Engineer at an e-commerce company. The business team wants to analyze products that were sold during holiday seasons such as Diwali, Christmas, and Navratri to plan better inventory and discounts for the next year.

### Table: `order_tbl`

| Column Name  | Data Type | Description                  |
|--------------|-----------|------------------------------|
| order_id     | INT       | Unique order identifier       |
| product_id   | INT       | Unique product identifier     |
| product_name | VARCHAR   | Name of the product           |
| order_date   | DATE      | Date when order was placed    |
| quantity     | INT       | Quantity ordered              |
| revenue      | DECIMAL   | Revenue generated             |

### Table: `holiday_seasons`

| Column Name  | Data Type | Description                   |
|--------------|-----------|-------------------------------|
| holiday_id   | INT       | Unique holiday identifier      |
| holiday_name | VARCHAR   | Name of the holiday            |
| start_date   | DATE      | Holiday season start date      |
| end_date     | DATE      | Holiday season end date        |

### Task
Write a SQL query to identify all distinct products sold during any holiday season.  
Extend your solution to also show the holiday name and total number of orders per product per holiday.

---

## Approach 1 — Beginner (Hardcoded Months)
> This was the initial approach attempted

```sql
SELECT DISTINCT product_id, product_name
FROM order_tbl
WHERE EXTRACT(MONTH FROM order_date) IN (3, 7, 12);
```

### ✅ What's right
- Correct use of `EXTRACT(MONTH FROM order_date)`
- Simple and readable

### ❌ What's wrong
- Months 3 and 7 are incorrect for Indian festive season
- No `DISTINCT` originally — would return duplicates
- Hardcoded months — not scalable, breaks every year
- No clarifying question asked before writing

---

## Approach 2 — Improved (Correct Months, Hardcoded)

```sql
SELECT DISTINCT product_id, product_name
FROM order_tbl
WHERE EXTRACT(MONTH FROM order_date) IN (10, 11, 12);
-- October: Navratri/Diwali, November: Diwali, December: Christmas/New Year
```

### ✅ Better because
- Correct months for Indian festive calendar
- `DISTINCT` added to avoid duplicates

### ❌ Still limited
- Still hardcoded — any new holiday requires code change
- Diwali date shifts every year (lunar calendar), so month alone is not accurate

---

## Approach 3 — Recommended (Reference Table JOIN)
> This is the answer interviewers expect at Flipkart/Amazon level

```sql
SELECT DISTINCT
    o.product_id,
    o.product_name,
    h.holiday_name
FROM order_tbl o
JOIN holiday_seasons h
    ON o.order_date BETWEEN h.start_date AND h.end_date
ORDER BY o.product_id;
```

### ✅ Why this is best
- No hardcoding — works for any holiday, any year
- Adding a new holiday = just insert a row in `holiday_seasons`
- Scalable and production-ready thinking

---

## Approach 4 — Impressive (With Aggregation)
> Add this to stand out in the interview

```sql
SELECT
    o.product_id,
    o.product_name,
    h.holiday_name,
    COUNT(o.order_id)   AS total_orders,
    SUM(o.quantity)     AS total_quantity,
    ROUND(SUM(o.revenue), 2) AS total_revenue
FROM order_tbl o
JOIN holiday_seasons h
    ON o.order_date BETWEEN h.start_date AND h.end_date
GROUP BY o.product_id, o.product_name, h.holiday_name
ORDER BY total_revenue DESC;
```

### ✅ Why this impresses
- Business-ready output — shows orders, quantity, and revenue
- `GROUP BY` replaces `DISTINCT` cleanly when aggregating
- Sorted by revenue — directly actionable for business team

---

## Follow-up Questions & Answers

### Q1. Top 10 best-selling products during Diwali specifically?

```sql
SELECT
    o.product_id,
    o.product_name,
    COUNT(o.order_id) AS total_orders
FROM order_tbl o
JOIN holiday_seasons h
    ON o.order_date BETWEEN h.start_date AND h.end_date
WHERE h.holiday_name = 'Diwali'
GROUP BY o.product_id, o.product_name
ORDER BY total_orders DESC
LIMIT 10;
```

---

### Q2. How to optimize for billions of rows?

- **Partition** `order_tbl` by `order_date` — query only scans relevant partitions
- **Index** on `order_date` column
- **Materialized views** for holiday season data if queried frequently
- In Spark/PySpark — use **broadcast join** for `holiday_seasons` table since it's small:

```python
from pyspark.sql.functions import broadcast

result = order_df.join(
    broadcast(holiday_df),
    (order_df.order_date >= holiday_df.start_date) &
    (order_df.order_date <= holiday_df.end_date)
)
```

---

### Q3. What if holiday_seasons table doesn't exist?

```sql
SELECT DISTINCT product_id, product_name
FROM order_tbl
WHERE EXTRACT(MONTH FROM order_date) IN (10, 11, 12);
```
> Always mention this is a temporary workaround and recommend creating a reference table for production use.

---

## Key Learnings

| # | Learning |
|---|----------|
| 1 | Always **ask a clarifying question** before writing SQL — "Is holiday season defined in a table or should I assume?" |
| 2 | **Never hardcode** dates/months in production SQL — use a reference/config table |
| 3 | Use `DISTINCT` when you only need unique records; use `GROUP BY` when you need aggregation |
| 4 | `BETWEEN start_date AND end_date` is the clean way to filter date ranges |
| 5 | For small lookup tables like `holiday_seasons`, use **broadcast join** in distributed systems |
| 6 | Always extend your answer with **business value** — revenue, quantity, ranking |
| 7 | Diwali follows the **lunar calendar** — the date shifts every year, so month-based filtering alone is inaccurate |
| 8 | In interviews, walk through your **thought process out loud** — interviewers evaluate thinking, not just the final query |

---

## Interview Tip

> At companies like Flipkart and Amazon, the interviewer is not just checking if you can write SQL.  
> They want to see if you think like an engineer — scalable design, edge cases, business context, and clear communication.  
> A good candidate writes Level 1. A hired candidate walks through all levels and explains the trade-offs.

---

*Added for revision — Flipkart DE Interview Prep*
--revised - 7th july
