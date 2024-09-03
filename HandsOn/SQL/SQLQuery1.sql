create database university

create table tblgender
(Id int Not Null Primary Key,
Gender nvarchar(50))

insert into tblperson (Id, Name,Email,GenderId)
values(1,'Tom','Tom@gmail.com',1),
(2,'Jessy','Jessy@gmail.com',2),
(3,'Kristy','Kristy@gmail.com',2),
(4,'John','John@gmail.com',1),
(5,'Rob','Rob@gmail.com',1)

INSERT into tblgender (Id ,Gender)
values (1, 'Male'),
(2, 'Female'),
(3 , 'Others')

update tblperson
set Email ='TomUpdated@gmail.com'
where Id=1;

delete from tblperson
where Id = 3;

select * from tblPerson