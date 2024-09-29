create database CSE_3A_167
 create table STU_INFO(Rno int, Name Varchar(20), Branch Varchar(20))

 insert into STU_INFO values(101,'raju','ce'),
 (102,'amit','ce'),
 (103,'sanjay','me'),
 (104,'neha','ec'),
 (105,'meera','ee'),
 (106,'mahesh','me')

 select * from STU_INFO



create table result(Rno int, SPI decimal(3,2))

insert into result values(101,8.8),
(102,9.2),(103,7.6),(104,8.2),(105,7.0),(107,8.9)

select * from result



create table EMPLOYEE_MASTER(employeeno varchar(20), name varchar(20), managerno varchar(20))

insert into EMPLOYEE_MASTER values('E01','tarun',null),
('E02','rohan','E02'),
('E03','priya','E01'),
('E04','milan','E03'),
('E05','jay','E01'),
('E06','anjana','E04')

select * from EMPLOYEE_MASTER

--Part – A:


--1. Combine information from student and result table using cross join or Cartesian product.
select * from STU_INFO
cross join result
select * from STU_INFO, result

--2. Perform inner join on Student and Result tables.
select * from 
STU_INFO as s inner join result as r
on s.rno = r.rno

--3. Perform the left outer join on Student and Result tables.
select * from
STU_INFO as s left outer join result as r
on s.rno = r.rno

--4. Perform the right outer join on Student and Result tables.
select * from
STU_INFO as s right outer join result as r
on s.rno = r.rno

--5. Perform the full outer join on Student and Result tables.
select * from
STU_INFO as s full outer join result r
on  s.rno = r.rno

--6. Display Rno, Name, Branch and SPI of all students.
select s.rno, s.name, s.branch, r.spi
from STU_INFO s left outer join result r
on s.rno=r.rno
select
s.rno,s.name, s.branch, r.spi
from STU_INFO s inner join result r
on s.rno=r.rno

--7. Display Rno, Name, Branch and SPI of CE branch’s student only.
select s.rno, s.name, s.branch, r.spi
from STU_INFO s inner join result r
on s.rno = r.rno
where s.branch='ce'

--8. Display Rno, Name, Branch and SPI of other than EC branch’s student only.
select s.rno, s.name, s.branch, r.spi
from STU_INFO s inner join result r
on s.rno = r.rno
where s.branch<>'ec'

--9. Display average result of each branch.
select branch,AVG(r.spi) as avg
from STU_INFO s inner join result r
on s.rno=r.rno
group by Branch

--10. Display average result of CE and ME branch.
select branch,AVG(r.spi) as avg
from STU_INFO s inner join result r
on s.rno=r.rno
where branch='ce' or branch='me'
group by Branch


--Part - B:

--1. Display average result of each branch and sort them in ascending order by SPI.
select branch, avg(r.spi) as avg
from  STU_INFO s inner join result r
on s.rno=r.rno
group by branch
order by avg(r.spi)

--2. Display highest SPI from each branch and sort them in descending order.
select branch, max(r.spi) as highest
from STU_INFO s inner join result r
on s.rno = r.rno
group by branch
order by max(r.spi)

--Part – C:

--1. Retrieve the names of employee along with their manager’s name from the Employee table
select e1.name as manager ,e2.name as employee
from  EMPLOYEE_MASTER e1 inner join  EMPLOYEE_MASTER e2
on e1.employeeno = e2.managerno