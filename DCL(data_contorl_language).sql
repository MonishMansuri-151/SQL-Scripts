use newdb;
-- DCL data cantrol language 

create user monish identified by "m123"; 

grant select,insert on newdb.* to monish; 

grant update (salary) on newdb.employee to monish; 

revoke update (salary) on newdb.employee from monish;-- cencel the permission of user update salary
show grants for monish;  

revoke all privileges , grant option  from monish;

show grants for monish;