-- ========================================================================================
									-- JOINS_QUESTIONS
								-- LEFT,RIGHT,INNER,SELF,NATURAL,OUTER;
-- =========================================================================================
USE joinsdb;
CREATE TABLE Department (
dept_id INT PRIMARY KEY,
dept_name VARCHAR(50),
location VARCHAR(50)
);
INSERT INTO Department VALUES
(10,'HR','Jaipur'),
(20,'IT','Bangalore'),
(30,'Finance','Mumbai'),
(40,'Marketing','Delhi'),
(50,'Legal','Pune');
CREATE TABLE Employee (
emp_id INT PRIMARY KEY,
emp_name VARCHAR(50),
dept_id INT,
salary INT,
city VARCHAR(50)
);
INSERT INTO Employee VALUES
(101,'Amit',10,45000,'Jaipur'),
(102,'Bhavna',20,72000,'Bangalore'),
(103,'Chirag',20,68000,'Bangalore'),
(104,'Divya',30,55000,'Mumbai'),
(105,'Esha',NULL,39000,'Delhi'),
(106,'Farhan',40,61000,'Delhi'),
(107,'Gaurav',60,50000,'Kolkata'),
(108,'Hina',30,83000,'Mumbai');
CREATE TABLE projects (
proj_id INT PRIMARY KEY,
proj_name VARCHAR(50),
dept_id INT,
budget INT
);
INSERT INTO projects VALUES
(1,'Payroll Revamp',10,120000),
(2,'Cloud Migration',20,500000),
(3,'Mobile App',20,300000),
(4,'Audit Automation',30,250000),
(5,'Brand Refresh',40,180000),
(6,'Data Lake',70,400000);
-- ==================================================================================================== 
									  -- QUESTIONS
-- INNER JOIN -------------------> 
-- Q1. List each employee with their department name and location.

select e.emp_id, e.emp_name,e.salary , d.dept_name , d.location 
FROM  Employee as e
INNER JOIN  Department as d
on e.dept_id = d.dept_id;

-- Q2. Show every project along with the name of the department that owns it

select  p.proj_id , p.proj_name , p.budget ,d.dept_name 
from projects as p 
inner join  Department as d
on p.dept_id = d.dept_id;

-- Q3. Show employee names together with the projects run by their own department.

select e.emp_id, e.emp_name, d.dept_name ,d.dept_id,p.proj_name
FROM  Employee as e
INNER JOIN  Department as d
INNER JOIN projects as p 
on e.dept_id = d.dept_id and  p.dept_id = d.dept_id;
-- this is multi join 
-- Q4. List ALL employees with their department name; show NULL when the employee has no matching
-- department
select e.emp_id , e.emp_name, e.dept_id, d.dept_name 
from Employee as e 
left join Department as d 
on e.dept_id = d.dept_id; -- coman mistke ho skti he kunki d.dept_id nhi aayegi kyunki e.dept_id aayegi kunki sari emp detail mang rha he question

-- Q5. List ALL departments with their projects; departments with no project must still appear.

select d.dept_id, d.dept_name,p.proj_name, p.budget 
FROM  Department as d
left JOIN  projects as p
on p.dept_id = d.dept_id;

-- Q6. Find only those employees who do NOT belong to any valid department
select e.emp_id , e.emp_name , e.dept_id
from Employee as e
left join Department as d
on e.dept_id = d.dept_id 
where d.dept_id  IS NULL;

-- Q7. List ALL departments and any employees in them, using a RIGHT JOIN with employees on the left.
select e.emp_name,d.dept_id, d.dept_name 
from Employee as e 
right join Department as d
on e.dept_id = d.dept_id;
select * from Employee;
-- Q8. List ALL projects and the department that owns them, keeping projects that point to a missing department.
select d.dept_name, p.proj_id , p.proj_name,p.dept_id 
From Department as d
right Join projects as p
on d.dept_id = p.dept_id;

-- Q9. Find departments that currently have NO employee assigned.
select d.dept_id , d.dept_name, d.location 
from Department as d 
left join Employee as e
on e.dept_id = d.dept_id
where e.dept_id is null;

-- Q10. Produce every possible pairing of the Finance/Legal departments with employees earning above 70000.
select e.emp_name , e.salary,d.dept_name
from Employee as e 
cross join Department as d 
where (dept_name='Finance' or dept_name = 'Legal') and e.salary > 70000;

-- Q11. Pair every project having a budget of at least 400000 with every department 
-- located in Mumbai or Pune.

select p.proj_name, p.budget , d.dept_name, d.location
from projects as p
cross join Department as d 
where p.budget >= 400000 and (d.location = 'Mumbai' or d.location ='Pune');

-- Q12. How many total row combinations result from CROSS JOIN of 
-- employees and departments? Show the count.

select  count(d.dept_id) as count
from Employee as e 
cross join Department as d ;
-- Q13. Show employees whose salary is greater than 60000.
select * from Employee where salary > 60000;

-- Q14. Show all employees based in Delhi or Mumbai.
select e.emp_id , e.emp_name,e.salary ,e.city 
from Employee as e 
left join Department as d
on e.dept_id = d.dept_id 
where e.city = 'Delhi' or e.city = "Mumbai";

-- Q15. Show employees whose dept_id is NULL (unassigned employees).
select e.emp_id , e.emp_name, d.dept_id , e.salary
 from Employee as e 
 left join Department as d 
 on e.dept_id = d.dept_id 
 where e.dept_id is null;

-- WHERE Clause — departments
-- Q16. Show departments located in Bangalore or Delhi
select * from Department 
where location = 'Bangalore' or location = "Delhi";

-- Q17. Show departments whose dept_id is 30 or higher.
select * from Department where dept_id >= 30;

-- Q18. Show departments whose name starts with the letter "F" or "L".
select * from Department 
where dept_name like "F%" or  dept_name like "L%";

-- WHERE Clause — projects
-- Q19. Show projects with a budget between 200000 and 400000 (inclusive)
select proj_name , budget from  projects where  budget between 200000 and 400000;
-- Q20. Show all projects that belong to dept_id 20.
select * from projects where dept_id = 20; 
-- Q21. Show projects whose name contains the word "a" and budget is under 300000.
select * from projects where proj_name like "a%" or budget < 300000;
-- Multiple-Table Joins
-- Q22. Show employee name, department name, location and project name 
-- for all matching rows across all three tables
select e.emp_name, d.dept_name, d.location,proj_name,p.budget
from Employee as e 
inner join Department as d 
on d.dept_id = e.dept_id 
inner join projects as p
on e.dept_id = p.dept_id;
-- Q23. Show ALL employees, plus department and project details where available 
-- (keep employees even with no dept/project).
select e.emp_id , e.emp_name , d.dept_name, p.proj_name 
from Employee as e 
left join Department as d
on d.dept_id = e.dept_id
left join projects as p 
on d.dept_id = p.dept_id; 
-- Q24. Show employees earning more than 60000 along with department and 
-- any project over 250000 budget.
select e.emp_name , e.salary, d.dept_name , p.proj_name , p.budget 
from Employee as e
join Department as d
join projects as p
on d.dept_id = e.dept_id and e.dept_id = p.dept_id 
where e.salary > 60000 and p.budget > 250000; 

-- Q25. List ALL departments with their employees and projects, including departments having neither.

select d.dept_id , d.dept_name , e.emp_name , p.proj_name 
from Department as d 
left join Employee as e
on d.dept_id = e.dept_id
left join projects as p
on d.dept_id = p.dept_id ; 

-- Q26. Show employees who work in a department located in Bangalore or Mumbai, along with the projects of that
-- department.
select e.emp_name, d.location, p.proj_name 
from Employee as e
join Department as d
on e.dept_id = d.dept_id
join projects as p 
on e.dept_id = p.dept_id
where d.location = "Bangalore" or d.location = "Mumbai";

-- 10. Self Join & Extra Practice
-- Q27. Pair employees who work in the same city (avoid duplicate pairs and self-pairing).

select e1.emp_name ,e2.emp_name, e1.city  
from Employee as e1
join Employee as e2
on e1.city = e2.city
where e1.emp_id < e2.emp_id;
-- where e1.city = e2.city 
