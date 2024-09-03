create database university
Use university

create table student (
    studentid int primary key,
    studentname varchar(50),
    department varchar(50),
    dateofbirth date
);

create table courses (
    courseid int primary key,
    coursename varchar(50),
    department varchar(50),
    instructor varchar(50)
);

insert into student (studentid, studentname, department, dateofbirth)
values
    (1, 'john', 'CSE', '1998-11-25'),
    (2, 'jane', 'ECE', '2000-03-15'),
    (3, 'michael ', 'AI ', '1999-07-08');

insert into courses (courseid, coursename, department, instructor)
values
    (101, 'DBMS', 'CSE', ' Adams'),
    (102, 'SQL', 'ECE', ' Brown'),
    (103, 'DS', 'AI', ' Davis');

select * from student
select * from courses

update student
set department = 'AI&DS'
where studentid = 2;

delete from courses
where courseid = 103;

select * from student
select * from courses

