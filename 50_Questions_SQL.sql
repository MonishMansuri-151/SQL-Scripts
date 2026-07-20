-- ============================================================
-- CREATE TABLE
-- ============================================================
create database Emp2;
use Emp2;
CREATE TABLE Employees (
EmpID INT PRIMARY KEY,
Name VARCHAR(50) NOT NULL,
Dept VARCHAR(20) NOT NULL,
Role VARCHAR(20) NOT NULL,
Salary INT NOT NULL,
Gender CHAR(1) NOT NULL,
JoinDate DATE NOT NULL,
Address VARCHAR(100) NOT NULL,
City VARCHAR(50) NOT NULL,
State CHAR(2) NOT NULL,
Region VARCHAR(10) NOT NULL
);

-- ============================================================
-- INSERT STATEMENTS (50 rows)
-- ============================================================
INSERT INTO Employees (EmpID, Name, Dept, Role, Salary, Gender, JoinDate, Address, City, State,
Region) VALUES
(1, 'Alice', 'HR', 'Manager', 55000, 'F', '2019-03-15', '101 Maple St', 'New York', 'NY',
'East'),
(2, 'Bob', 'IT', 'Developer', 72000, 'M', '2020-07-22', '22 Oak Ave', 'Chicago', 'IL',
'Midwest'),
(3, 'Carol', 'Finance', 'Analyst', 68000, 'F', '2018-11-01', '303 Pine Rd', 'New York', 'NY',
'East'),
(4, 'David', 'HR', 'Executive', 52000, 'M', '2021-01-10', '44 Birch Ln', 'Chicago', 'IL',
'Midwest'),
(5, 'Eve', 'IT', 'Senior Dev', 85000, 'F', '2017-06-30', '55 Cedar Blvd', 'Houston', 'TX',
'South'),
(6, 'Frank', 'Finance', 'Manager', 74000, 'M', '2019-09-14', '606 Elm St', 'New York', 'NY',
'East'),
(7, 'Grace', 'Marketing', 'Executive', 60000, 'F', '2022-02-28', '77 Spruce Dr', 'Chicago', 'IL',
'Midwest'),
(8, 'Hank', 'IT', 'Lead', 90000, 'M', '2016-04-05', '88 Walnut Way', 'Houston', 'TX',
'South'),
(9, 'Ivy', 'HR', 'Executive', 58000, 'F', '2020-12-19', '99 Ash Ct', 'New York', 'NY',
'East'),
(10, 'Jack', 'Finance', 'Analyst', 65000, 'M', '2021-03-07', '10 Willow Pl', 'Chicago', 'IL',
'Midwest'),
(11, 'Karen', 'Marketing', 'Manager', 62000, 'F', '2018-08-23', '11 Poplar St', 'Houston', 'TX',
'South'),
(12, 'Leo', 'IT', 'Developer', 78000, 'M', '2019-11-11', '12 Sycamore Ave', 'New York', 'NY',
'East'),
(13, 'Mia', 'HR', 'Executive', 53000, 'F', '2022-05-16', '13 Hickory Rd', 'Chicago', 'IL',
'Midwest'),
(14, 'Nate', 'Finance', 'Manager', 71000, 'M', '2017-12-02', '14 Chestnut Ln', 'Houston',
'TX', 'South'),
(15, 'Olivia', 'Marketing', 'Analyst', 66000, 'F', '2020-06-18', '15 Magnolia Dr', 'New York',
'NY', 'East'),
(16, 'Paul', 'IT', 'Senior Dev', 82000, 'M', '2018-03-27', '16 Dogwood Blvd', 'Chicago', 'IL',
'Midwest'),
(17, 'Quinn', 'HR', 'Executive', 57000, 'F', '2021-09-09', '17 Hawthorn St', 'Houston', 'TX',
'South'),
(18, 'Rita', 'Finance', 'Lead', 76000, 'F', '2019-01-25', '18 Redwood Ave', 'New York', 'NY',
'East'),
(19, 'Sam', 'Marketing', 'Executive', 63000, 'M', '2022-07-14', '19 Cypress Ct', 'Chicago', 'IL',
'Midwest'),
(20, 'Tina', 'IT', 'Lead', 88000, 'F', '2016-10-31', '20 Juniper Way', 'Houston', 'TX',
'South'),
(21, 'Uma', 'HR', 'Manager', 60000, 'F', '2020-04-03', '21 Aspen Pl', 'Dallas', 'TX',
'South'),
(22, 'Victor', 'Finance', 'Analyst', 69000, 'M', '2018-07-19', '22 Cottonwood St', 'Dallas', 'TX',
'South'),
(23, 'Wendy', 'Marketing', 'Manager', 64000, 'F', '2021-11-27', '23 Palmetto Ave', 'Phoenix',
'AZ', 'West'),
(24, 'Xander', 'IT', 'Architect', 95000, 'M', '2015-02-14', '24 Mesquite Rd', 'Phoenix', 'AZ',
'West'),
(25, 'Yara', 'HR', 'Executive', 54000, 'F', '2022-09-08', '25 Saguaro Ln', 'Phoenix', 'AZ',
'West'),
(26, 'Zoe', 'Finance', 'Manager', 73000, 'F', '2019-05-21', '26 Palo Verde Dr', 'Dallas', 'TX',
'South'),
(27, 'Aaron', 'Marketing', 'Analyst', 67000, 'M', '2020-10-15', '27 Ocotillo Blvd', 'Phoenix',
'AZ', 'West'),
(28, 'Bella', 'IT', 'Senior Dev', 80000, 'F', '2017-08-06', '28 Ironwood St', 'Chicago', 'IL',
'Midwest'),
(29, 'Carlos', 'HR', 'Executive', 56000, 'M', '2021-06-24', '29 Pecan Ave', 'Houston', 'TX',
'South'),
(30, 'Diana', 'Finance', 'Lead', 77000, 'F', '2018-02-09', '30 Peachtree Ct', 'New York', 'NY',
'East'),
(31, 'Ethan', 'IT', 'Developer', 74000, 'M', '2019-04-18', '31 Magnolia St', 'Dallas', 'TX',
'South'),
(32, 'Fiona', 'Marketing', 'Executive', 61000, 'F', '2022-01-05', '32 Bluebonnet Ave', 'Dallas',
'TX', 'South'),
(33, 'George', 'Finance', 'Analyst', 66000, 'M', '2020-08-11', '33 Sunflower Rd', 'Phoenix',
'AZ', 'West'),
(34, 'Helen', 'HR', 'Manager', 59000, 'F', '2017-03-22', '34 Cactus Ln', 'Phoenix', 'AZ',
'West'),
(35, 'Ivan', 'IT', 'Lead', 92000, 'M', '2015-09-30', '35 Desert Dr', 'Phoenix', 'AZ',
'West'),
(36, 'Julia', 'Marketing', 'Manager', 65000, 'F', '2019-12-03', '36 Mesa Blvd', 'Dallas', 'TX',
'South'),
(37, 'Kevin', 'Finance', 'Manager', 70000, 'M', '2021-07-20', '37 Prairie St', 'Chicago', 'IL',
'Midwest'),
(38, 'Laura', 'HR', 'Executive', 55000, 'F', '2022-10-14', '38 Lakeview Ave', 'Chicago', 'IL',
'Midwest'),
(39, 'Mark', 'IT', 'Developer', 76000, 'M', '2018-05-07', '39 Riverview Rd', 'New York', 'NY',
'East'),
(40, 'Nina', 'Marketing', 'Analyst', 63000, 'F', '2020-03-25', '40 Bayview Ln', 'New York',
'NY', 'East'),
(41, 'Oscar', 'Finance', 'Analyst', 67000, 'M', '2019-08-19', '41 Hillside Dr', 'Dallas', 'TX',
'South'),
(42, 'Priya', 'HR', 'Senior Dev', 79000, 'F', '2016-11-28', '42 Creekside Blvd', 'Houston', 'TX',
'South'),
(43, 'Raj', 'IT', 'Manager', 85000, 'M', '2018-06-14', '43 Brookside St', 'Phoenix', 'AZ',
'West'),
(44, 'Sarah', 'Marketing', 'Lead', 71000, 'F', '2017-02-01', '44 Springdale Ave', 'New York',
'NY', 'East'),
(45, 'Tom', 'Finance', 'Senior Dev', 81000, 'M', '2020-09-09', '45 Fairview Rd', 'Chicago', 'IL',
'Midwest'),
(46, 'Uma', 'IT', 'Architect', 97000, 'F', '2014-12-22', '46 Northgate Ln', 'New York', 'NY',
'East'),
(47, 'Vera', 'Marketing', 'Manager', 68000, 'F', '2021-04-30', '47 Eastwood Dr', 'Dallas', 'TX',
'South'),
(48, 'Will', 'HR', 'Analyst', 51000, 'M', '2022-11-15', '48 Westfield Blvd', 'Phoenix', 'AZ',
'West'),
(49, 'Xena', 'Finance', 'Lead', 78000, 'F', '2019-10-06', '49 Southpark St', 'Chicago', 'IL',
'Midwest'),
(50, 'Yusuf', 'IT', 'Senior Dev', 87000, 'M', '2016-07-17', '50 Central Ave', 'Houston', 'TX','South');
select * from Employees;
-- Q1. Count the total number of employees in each department.
select Dept,count(*) from Employees group by Dept;
-- Q2. Find the total salary paid in each department.
select Dept,sum(Salary) from Employees group by Dept order by sum(Salary);
-- Q3. Find the average salary by gender
select Gender ,avg(Salary) from Employees group by Gender;
-- Q4. Find the maximum salary in each department
select Dept , max(Salary) from Employees group by Dept;
-- Q5. Find the minimum salary in each role.
select Role, min(Salary) from Employees group by Role;
-- Q6. Count the number of employees in each city
select City, count(*) from Employees group by City;
-- Q7. Find the total salary paid per region
select Region , sum(Salary) from Employees group by Region;

-- ▸ B. GROUP BY + ORDER BY
-- Q8. List departments sorted by their average salary (highest first).
select Dept ,avg(Salary) from Employees group by Dept order by avg(Salary) desc;
-- Q9. List cities by total salary, ascending.
select City , sum(Salary) as Sum_Sal from Employees group by City order by Sum_Sal;
-- Q10. List roles sorted by employee count descending, then role name ascending
select Role , count(*) as coun from Employees group by Role order by coun desc;
-- Q11. List states with their employee count, sorted by count descending then state name.
select State , count(*)as emp_count from Employees group by State order by emp_count desc , State;
-- Q12. Show the total salary per region, ordered from highest to lowest.
select Region , sum(Salary) as sum_Sal from Employees group by Region order by sum_Sal desc,sum_Sal;
-- Q13. List departments sorted by minimum salary descending
select Dept, min(Salary) as min_sal from Employees group by Dept order by min_sal desc;
-- Q14. Show only departments with more than 10 employees.
select Dept, count(*) from Employees group by Dept having count(*) > 10 ;
-- Q15. Show departments where the average salary exceeds 65000
select Dept, avg(Salary) as avg_sal from Employees group by Dept having avg_sal > 65000;



