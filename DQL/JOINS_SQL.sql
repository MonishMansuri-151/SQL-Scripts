-- join s
create database joinsdb;
use joinsdb;
CREATE TABLE Departments (
DepartmentID INT PRIMARY KEY,
DepartmentName VARCHAR(50)
);
INSERT INTO Departments (DepartmentID, DepartmentName)
VALUES
(101, 'HR'),
(102, 'IT'),
(103, 'Finance'),
(104, 'Marketing');
CREATE TABLE Employees (
EmployeeID INT PRIMARY KEY,
EmployeeName VARCHAR(50),
DepartmentID INT
);
INSERT INTO Employees (EmployeeID, EmployeeName, DepartmentID)
VALUES
(1, 'Alice', 101),
(2, 'Bob', 102),
(3, 'Charlie', 105), -- No matching department
(4, 'David', NULL), -- No department assigned 
(5, 'Eva', 101);
-- inner join
select e.EmployeeID , e.Employeename, e.DepartmentID,
d.DepartmentID , d.DepartmentName From Employees as e 
 join Departments as d 
-- where and on are equal worl most bus ham on jyda use karte working dono ki samhe where bhi use kar skte he  
on e.DepartmentID = d.DepartmentID;
-- left jon
select e.EmployeeID , e.Employeename, e.DepartmentID,
d.DepartmentID , d.DepartmentName From Employees as e 
left join Departments as d 
-- where and on are equal worl most bus ham on jyda use karte working dono ki samhe where bhi use kar skte he  
on e.DepartmentID = d.DepartmentID;
-- right join 
select e.EmployeeID , e.Employeename, e.DepartmentID,
d.DepartmentID , d.DepartmentName From Employees as e 
right join Departments as d 
-- where and on are equal worl most bus ham on jyda use karte working dono ki samhe where bhi use kar skte he  
on e.DepartmentID = d.DepartmentID;


