create table project_task (
    task_id int,
    task_name varchar(20) not null,
    status  VARCHAR(20) DEFAULT 'pending',
    -- audit fieldsl:
    created_By varchar(20),
    created_at TIMESTAMP
);


insert into emp2 values(202,'lino');

SELECT * from project_task;
----------------------------------------------------------------------------------------------
CREATE or replace TRIGGER trg_task_audit_insert 
before insert on emp2
for each row 
begin 

    insert into project_task values(user,SYSTIMESTAMP);
    

END;
