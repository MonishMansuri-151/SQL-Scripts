use newdb2; 
create table test (rollno tinyint);
-- tinyint = 1byte = 8 bit => 8 power to 2 
-- small int - 2 byte
-- int = 4 byte 
-- big int = 8 byte 

-- ------------------------------------------------------------------------- 

-- string datatype 
-- varchar = jhan fix char nhi pata vnha varchar() use karenge 
-- char = fixd size of charcter 
-- 10 = size ko fixd size fix kar deta he 10 dal diya to 10 fix kar diya 

create table test1 (gender char(30));
insert into test1  values ("male"); 
-- always use of varchar () 
create table test1 (name varchar(10)); -- no memory block fix varchar it use only need of char 
insert into test1 value ("Monish") ;
-- all are char in world -,." " ''334 dfa 

-- varchar also store the trailing whitespaces last wale spaces 
-- char will remove  the trailing whitespaces 
create table t (name char(10), lastname varchar(10));
insert into t value("abc    ","ddd   ");
select name ,char_length(name), lastnmae,char_length(lastname) from t;


select table_name , data_length from 
information_schema.tables 
where table_schema = database() 
and table_name in ("t","test1"); -- table name 

-- --------------------------------------------------------------
-- constraints 
-- set of rules that apply on the column 
-- to prevent invaild data entry 
-- mela  = > entry security guard  
-- simple mean of constraint set of rules are not table invalid values 

-- not null constraint 
create table test8 (id int, name varchar(10) not null);
insert into test8 values (10,"abhishek");
insert into test8 values(20,null) ;-- constraint worked they not insert the null value in the table 
select * from test8;

-- default

create table test12 (id int, name varchar(10) default"hello");
insert into test12 values (10,"abhishek");
insert into test12 (id)values(20) ;-- constraint worked they not insert the null value in the table 
insert into test12 (name) values ("monish");
select * from test12; 

-- unique constraint 

create table test12 (id int unique, name varchar(10) default"hello");
insert into test12 values (10,"abhishek");
insert into test12 (id)values(20) ;-- constraint worked they not insert the null value in the table 
insert into test12 (name) values ("monish");
select * from test12;
-- but null multiple time aa skate he unique constraint me bhi null hamesha unique rhta he 

-- primary key  only 1 table priamry key 
-- primary key = unique + not null 
create table test14 (id int primary key , name varchar(20));
insert into tes14 values(10,"ankit");
insert into tes14 values(10,"sohan"); -- duplicate not allow primary key 
insert into tes14 values(null,"ankit") -- not null constraint 













