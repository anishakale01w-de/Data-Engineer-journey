SQL Math Functions — Quick Reference

ABS() — Absolute value
sql-- Syntax
ABS(number)

-- Example
SELECT ABS(-5000)  -- Output: 5000
SELECT ABS(5000)   -- Output: 5000
Use when: you want difference without sign

ROUND() — Round to N decimals
sql-- Syntax
ROUND(number, decimal_places)

-- Example
SELECT ROUND(3.5678, 2)  -- Output: 3.57
SELECT ROUND(3.5678, 0)  -- Output: 4
Use when: salary averages, percentages

CEIL() — Always round UP
sql-- Syntax
CEIL(number)

-- Example
SELECT CEIL(3.1)   -- Output: 4
SELECT CEIL(3.9)   -- Output: 4
SELECT CEIL(-3.1)  -- Output: -3
Use when: calculating minimum pages, containers needed

FLOOR() — Always round DOWN
sql-- Syntax
FLOOR(number)

-- Example
SELECT FLOOR(3.9)  -- Output: 3
SELECT FLOOR(3.1)  -- Output: 3
SELECT FLOOR(-3.9) -- Output: -4
Use when: calculating completed years, age

MOD() — Remainder after division
sql-- Syntax
MOD(number, divisor)

-- Example
SELECT MOD(10, 3)  -- Output: 1
SELECT MOD(10, 2)  -- Output: 0 (even number!)
SELECT MOD(7, 2)   -- Output: 1 (odd number!)
Use when: finding even/odd, every Nth row

POWER() — Exponent
sql-- Syntax
POWER(base, exponent)

-- Example
SELECT POWER(2, 3)  -- Output: 8  (2³)
SELECT POWER(5, 2)  -- Output: 25 (5²)
Use when: compound interest, exponential calculations

SQRT() — Square root
sql-- Syntax
SQRT(number)

-- Example
SELECT SQRT(25)  -- Output: 5
SELECT SQRT(16)  -- Output: 4
Use when: statistical calculations, standard deviation

Quick memory tricks:
FunctionTrickABSAlways Become Safe (no negatives)ROUNDRounds to nearestCEILCeiling = upFLOORFloor = downMODMath remainderPOWERPower = multiply itselfSQRTSquare Root

--revised 7th july
