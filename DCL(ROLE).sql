-- DCL role assing 
-- create a role 
create role if not exists "hr_role"; 

-- no user in the role 
-- ues of this check the role add user 
select to_user as "User", to_host as "host"
from mysql.role_edges 
where from_user = "hr_role";

-- create a user 

create user aman identified by "aman123";

show tables;

-- assing the permssion role 

grant select on newdb.* to hr_role; 

-- assing ro user 
grant hr_role to aman;

show grants for aman;

set default role hr_role to aman;
use emp;
select * from employees; 

-- select max(JoinDate) from employees as e where JoinDate = (select max(JoinDate) from employees where dept= e.dept);

-- select * from employees;
-- select Name,Dept,max_date, datediff(max_date,JoinDate) from (select Name,Dept, JoinDate, max(JoinDate) over(partition by Dept) 
-- as max_date from employees) as t;

