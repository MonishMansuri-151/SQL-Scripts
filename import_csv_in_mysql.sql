USE sakila;
drop table students;
CREATE TABLE students (
    student_id INT,
    first_name VARCHAR(20),
    last_name VARCHAR(20),
    gender VARCHAR(12),
    age INT,
    class INT,
    section VARCHAR(12),
    city VARCHAR(20),
    phone VARCHAR(20),
    email VARCHAR(50)
);
-- loard data csv file but it is throw the error secure-file-prev
-- load data infile 'C:\Users\ss\Downloads\student_table_30_records.csv' into table students fields terminated by ",";  -- 

select @@secure_file_priv;  
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/student_table_30_records.csv'
INTO TABLE students
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

select * from students;

