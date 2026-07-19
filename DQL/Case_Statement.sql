-- CASE Statement in SQL
use emp;
select * from Employees;
-- CASE Statement queries
SELECT Name, Salary,
    CASE 
        WHEN salary >= 80000 THEN 'High Earner'
        WHEN salary >= 60000 THEN 'Mid Earner'
        ELSE 'Entry Level'
    END AS salary_tier
FROM Employees;



