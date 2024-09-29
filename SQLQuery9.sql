--Sub Queries--
CREATE TABLE Stu_Detail (
    Rno INT,
    sName VARCHAR(50),
    City VARCHAR(50),
    DID INT,
);

INSERT INTO Stu_Detail (Rno, sName, City, DID) VALUES
(101, 'Raju', 'Rajkot', 10),
(102, 'Amit', 'Ahmedabad', 20),
(103, 'Sanjay', 'Baroda', 40),
(104, 'Neha', 'Rajkot', 20),
(105, 'Meera', 'Ahmedabad', 30),
(106, 'Mahesh', 'Baroda', 10);

select * from stu_detail

CREATE TABLE Academic (
    Rno INT,
    SPI DECIMAL(3, 1),
    Bklog INT
);

INSERT INTO Academic (Rno, SPI, Bklog) VALUES
(101, 8.8, 0),
(102, 9.2, 2),
(103, 7.6, 1),
(104, 8.2, 4),
(105, 7.0, 2),
(106, 8.9, 3);

select * from academic

CREATE TABLE Department (
    DID INT,
    DName VARCHAR(50)
);

INSERT INTO Department (DID, DName) VALUES
(10, 'Computer'),
(20, 'Electrical'),
(30, 'Mechanical'),
(40, 'Civil');

select * from department

--Part – A:
--1. Display details of students who are from computer department.
select sname
from Stu_detail
where did=(select did
			from Department
			where dname='computer')

--2. Displays name of students whose SPI is more than 8.
select sname
from stu_detail
where rno in (select rno
			from academic
			where spi >8)  

--3. Display details of students of computer department who belongs to Rajkot city.
select * 
from stu_detail
where city='rajkot'
and did = ( select did
			from department
			where dname='computer')

--4. Find total number of students of electrical department.
select count(*)
from stu_detail
where did = ( select did
				from department
				where dname='electrical')

--5. Display name of student who is having maximum SPI.
select sname
from stu_detail
where rno = (select rno
			from academic
			where spi=(select max(spi)
						from Academic))
						
--6. Display details of students having more than 1 backlog.
select * 
from stu_detail
where rno in ( select rno 
				from Academic
				where bklog >1)

--Part – B:
--1. Display name of students who are either from computer department or from mechanical department.
select sname
from Stu_Detail
where did in ( select did
				from department
				where dname='computer' or dname='mechanical')

--2. Display name of students who are in same department as 102 studying in.
select sname,did
from Stu_Detail
where did in (select did 
			from Stu_Detail
			where rno = 102)

--Part – C:
--1. Display name of students whose SPI is more than 9 and who is from electrical department.
select sname
from Stu_Detail
where rno in (select rno
				from academic
				where spi>9)

		and did in(select did
					from department
					where dname='electrical')


--2. Display name of student who is having second highest SPI.
select sname
from stu_detail
where rno in ( select rno 
				from academic
				where spi= (select max(spi)
							from academic
							where spi<(select max(spi)
										from Academic)))


--3. Display city names whose students branch wise SPI is 9.2
select city
from Stu_Detail
where rno = ( select rno 
			from academic
			where spi=9.2)
---------------- SET Operators ---------------



CREATE TABLE Computer (
    RollNo INT,
    Name VARCHAR(50)
);


INSERT INTO Computer (RollNo, Name) VALUES
(101, 'Ajay'),
(109, 'Haresh'),
(115, 'Manish');

select * from computer

CREATE TABLE Electrical (
    RollNo INT PRIMARY KEY,
    Name VARCHAR(50)
);

INSERT INTO Electrical (RollNo, Name) VALUES
(105, 'Ajay'),
(107, 'Mahesh'),
(115, 'Manish');

select * from Electrical

--PART A
--1. Display name of students who is either in Computer or in Electrical.
select name from computer
union
select name from Electrical

--2. Display name of students who is either in Computer or in Electrical including duplicate data.
select name from computer
union all
select name from Electrical

--3. Display name of students who is in both Computer and Electrical.
select name from computer
intersect
select name from Electrical

--4. Display name of students who are in Computer but not in Electrical.
select name from computer
except
select name from Electrical 

--5. Display name of students who are in Electrical but not in Computer.
select name from Electrical
except
select name from Computer

--6. Display all the details of students who are either in Computer or in Electrical.
select * from computerunionselect * from Electrical--7. Display all the details of students who are in both Computer and Electrical.select * from computer 
intersect
select * from Electrical



------------------ PART B ----------------------
CREATE TABLE Emp_DATA (
    EID INT,
    Name VARCHAR(50)
);

INSERT INTO Emp_DATA (EID, Name) VALUES
(1, 'Ajay'),
(9, 'Haresh'),
(5, 'Manish');

select * from emp_data

CREATE TABLE Customer (
    CID INT,
    Name VARCHAR(50)
);

INSERT INTO Customer (CID, Name) VALUES
(5, 'Ajay'),
(7, 'Mahesh'),
(5, 'Manish');

select * from customer

--1. Display name of persons who is either Employee or Customer.
select name from Emp_DATA
union 
select name from Customer

--2. Display name of persons who is either Employee or Customer including duplicate data.
select name from Emp_DATA
union all
select name from Customer

--3. Display name of persons who is both Employee as well as Customer.
select name from Emp_DATA
intersect
select name from Customer

--4. Display name of persons who are Employee but not Customer.
select name from Emp_DATA
except 
select name from customer

--5. Display name of persons who are Customer but not Employee.
select name from customer
except
select name from Emp_DATA

--Part – C: 
--1. Perform all the queries of Part-B but display ID and Name columns instead of Name only.
--1)
select eid,name from Emp_DATA
union 
select cid,name from Customer

--2)
select eid,name from Emp_DATA
union all
select cid,name from Customer

--3)
select eid,name from Emp_DATA
intersect
select cid,name from Customer

--4)
select eid,name from Emp_DATA
except 
select cid,name from customer

--5)
select cid,name from customer
except
select eid,name from emp_data