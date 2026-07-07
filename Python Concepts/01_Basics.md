How data engineer use python ?
---------------------------------
As a Data Engineer we use Python to:

Clean and process data
Automate ETL pipelines
Connect to AWS services like S3, Glue
Write PySpark jobs

Think of Python as your Swiss knife in a DE job.
You know those army knives that have a blade, scissor, screwdriver, bottle opener — all in one tool? You carry one thing and solve 10 problems.
Python is exactly that for a Data Engineer.

**Need to pull data from S3? Python.
Need to clean messy Excel files? Python.
Need to automate a daily report? Python.
Need to connect to a database? Python.**

One language. Solves everything in your DE job. That's why Swiss knife. 🔪

**Topic 1.0 What is a Variable ?**

Defintion: 
TYPE 1 : A variable is a named memory location that stores a value. It acts as a reference to data stored in the computer's memory. In Python, you don't need to declare the type explicitly — Python automatically identifies it based on the value assigned.
TYPE 2: Variables are used to store data that can be referenced and manipulated during program execution. A variable is essentially a name that is assigned to a value.
TYPE 3 :In simple words
A variable is simply a box that stores a value. Check below example 

pythonname = "Rahul"
age = 25
salary = 50000
is_employed = True

name stores text → called **string**
age, salary store numbers → called **integer**
is_employed stores True/False → called **boolean**

**Topic 1.1 What is Datatype?**

Definition
TYPE 1: A data type defines the type of value a variable can hold and what operations can be performed on it. Python is dynamically typed(learn more in page dynamically typed), meaning you don't declare the type, Python figures it out automatically at runtime.

1. String
Definition: A sequence of characters enclosed in single or double quotes. Used to represent text data.
Example
employee_name = "Priya"
city = "Mumbai"

2. Integer
Definition: A whole number without any decimal point. Can be positive, negative or zero.
Example
age = 27
experience = 3

3. Float
Definition: A number that contains a decimal point. Used when precision is required such as prices, percentages or measurements.
Example
gross_loss = 23457.90

5. Boolean
Definition: A data type that holds only two possible values — True or False. Commonly used in conditions and logical operations.
EXAMPLE
is_permanent = True
is_on_bench = False

5. None
Definition: Represents the absence of a value. It is Python's way of saying "this variable exists but has no value assigned yet." Equivalent to NULL in SQL.
EXAMPLE
apartment = None

How Python identifies type automatically
x = "Priya"       # Python sees quotes → String
x = 27            # Python sees whole number → Integer
x = 7.8           # Python sees decimal → Float
x = True          # Python sees True/False → Boolean
x = None          # Python sees None → NoneType

syntax for checking datatype 
print(type(x))

6. Dates and timestamp
**How are Dates stored in Python?**
Definition:
TYPE 1: Python does not have a built-in primitive date type like SQL's DATE or TIMESTAMP. Instead, dates and times are handled using the datetime module, a built-in Python library you import before using.

from datetime import datetime, date, time, timedelta

6.1 date — Stores only Date (no time)
Definition: Stores year, month and day only. No time component.
EXAMPLE

from datetime import date

policy_start_date = date(2024, 1, 15)   # year, month, day
print(policy_start_date)                 # Output: 2024-01-15

6.2 datetime — Stores Date + Time together
Definition: Stores year, month, day, hour, minute, second and microsecond. Most commonly used in DE pipelines.
--revised 7th july
