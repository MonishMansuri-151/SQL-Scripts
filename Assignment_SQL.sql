                                   -- SQL Practice Workbook
                             -- GROUP BY • HAVING • ORDER BY • FUNCTIONS
                             
-- Column Descriptions:

-- • EmpID – Unique employee identifier
-- • Name – Employee full name
-- • Dept – Department (HR, IT, Finance, Marketing)
-- • City – Work location (New York, Chicago, Houston)
-- • Gender – M / F
-- • Salary – Annual salary in USD
-- • JoinDate – Date of joining the company
-- • Role – Job role (Executive, Analyst, Developer, etc.)
create Database emp;
use emp;
CREATE TABLE Employees (
EmpID INT PRIMARY KEY,
Name VARCHAR(50) NOT NULL,
Dept VARCHAR(50) NOT NULL,
City VARCHAR(50) NOT NULL,
Gender CHAR(1) NOT NULL,
Salary INT NOT NULL,
JoinDate DATE NOT NULL,
Role VARCHAR(50) NOT NULL
);
INSERT INTO Employees (EmpID, Name, Dept, City, Gender, Salary, JoinDate, Role) VALUES
(1,'Alice','HR','New York','F',55000,'2019-03-15','Manager'),
(2,'Bob','IT','Chicago','M',72000,'2020-07-22','Developer'),
(3,'Carol','Finance','New York','F',68000,'2018-11-01','Analyst'),
(4,'David','HR','Chicago','M',52000,'2021-01-10','Executive'),
(5,'Eve','IT','Houston','F',85000,'2017-06-30','Senior Dev'),
(6,'Frank','Finance','New York','M',74000,'2019-09-14','Manager'),
(7,'Grace','Marketing','Chicago','F',60000,'2022-02-28','Executive'),
(8,'Hank','IT','Houston','M',90000,'2016-04-05','Lead'),
(9,'Ivy','HR','New York','F',58000,'2020-12-19','Executive'),
(10,'Jack','Finance','Chicago','M',65000,'2021-03-07','Analyst'),
(11,'Karen','Marketing','Houston','F',62000,'2018-08-23','Manager'),
(12,'Leo','IT','New York','M',78000,'2019-11-11','Developer'),
(13,'Mia','HR','Chicago','F',53000,'2022-05-16','Executive'),
(14,'Nate','Finance','Houston','M',71000,'2017-12-02','Manager'),
(15,'Olivia','Marketing','New York','F',66000,'2020-06-18','Analyst'),
(16,'Paul','IT','Chicago','M',82000,'2018-03-27','Senior Dev'),
(17,'Quinn','HR','Houston','F',57000,'2021-09-09','Executive'),
(18,'Rita','Finance','New York','F',76000,'2019-01-25','Lead'),
(19,'Sam','Marketing','Chicago','M',63000,'2022-07-14','Executive'),
(20,'Tina','IT','Houston','F',88000,'2016-10-31','Lead'),
(21,'Uma','HR','New York','F',60000,'2020-04-03','Manager'),
(22,'Victor','Finance','Chicago','M',69000,'2018-07-19','Analyst'),
(23,'Wendy','Marketing','Houston','F',64000,'2021-11-27','Manager'),
(24,'Xander','IT','New York','M',95000,'2015-02-14','Architect'),
(25,'Yara','HR','Chicago','F',54000,'2022-09-08','Executive'),
(26,'Zoe','Finance','Houston','F',73000,'2019-05-21','Manager'),
(27,'Aaron','Marketing','New York','M',67000,'2020-10-15','Analyst'),
(28,'Bella','IT','Chicago','F',80000,'2017-08-06','Senior Dev'),
(29,'Carlos','HR','Houston','M',56000,'2021-06-24','Executive'),
(30,'Diana','Finance','New York','F',77000,'2018-02-09','Lead');

-- View Data
SELECT * FROM Employees;
-- Q1. Find the total number of employees in each department.
select Dept ,sum(EmpID) from Employees group by Dept; 
-- Q2. Find the total salary paid per department. 
select Dept , sum(salary) as Total_Salary From Employees group by Dept;
-- Q3. Find the average salary in each city. 
select city, avg(salary) as avg_salary from Employees group by city; 
-- Q4. Find the maximum salary in each department.
select Dept , max(salary) as max_salary from Employees group by Dept;
-- Q5. Find the minimum salary in each department
select Dept, min(salary) from Employees group by Dept;
-- Q6. List departments with their employee count, sorted by count descending
select Dept,count(*) as Employee_count from Employees group by Dept order by Employee_count desc;
-- Q7. List cities with total salary, sorted by TotalSalary ascending.
select City, sum(salary)as Total_Salary from Employees group by City order by Total_Salary;

-- ▸ ORDER BY – Two Columns
-- Q8. List all employees ordered by department (A–Z) and then by salary (highest first) within each department.
select  Name, Dept , salary from Employees order by Dept,salary desc ;
-- ⚠ Q9. List all employees ordered by city (A–Z) then by join date (oldest first) 
select Name , City, JoinDate from Employees order by City,joinDate ;  
-- Q10. List all employees ordered by role (A–Z) then by salary (lowest first) 
select Name , Role, Salary  from Employees order by Role, Salary;
-- ▸ HAVING
-- ⚠ Q11. Show only departments that have more than 7 employees
select Dept, count(*) from Employees group by Dept having count(*)>7;
-- Q12. Show departments where the average salary exceeds 65000.
select Dept, avg(Salary) from Employees group by Dept having avg(Salary) > 65000;
 -- Q13. Show cities where the total salary bill is greater than 650000.
select City, sum(Salary) from Employees group by City having sum(Salary) > 650000;
 -- Q 14 . Show departments where the maximum salary is at least 80000.
select Dept, max(Salary) from Employees group by Dept having max(Salary)> 80000;
-- ⚠ Q15. Show roles that appear more than 5 times in the table.
select Role, count(Role)  from Employees group by Role having count(Role) > 5;
--  Q16. Find the overall average salary of all employees
-- ▸ Aggregate Function 
select avg(Salary) from Employees;
-- Q17. Count how many female employees exist in each department
select Dept , count(Gender) from Employees where Gender = "F"group by Dept;
-- Q18. Find the highest and lowest salary across the entire company
select max(Salary), min(Salary) from Employees ;
-- 19. Find the total salary paid to employees who joined after 2019-01-01 
select sum(Salary) from Employees  ;






