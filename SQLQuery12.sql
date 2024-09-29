--Part – A:
--1. Find all persons with their department name & code.
SELECT P.PERSONNAME,D.DepartmentName,D.DepartmentCode
FROM PERSON P 
JOIN DEPT D 
ON P.DepartmentID=D.DepartmentID

--2. Find the person's name whose department is in C-Block.
SELECT P.PERSONNAME,D.LOCATION
FROM PERSON P
JOIN DEPT D
ON P.DepartmentID=D.DepartmentID
WHERE D.Location='C-BLOCK'

--3. Retrieve person name, salary & department name who belongs to Jamnagar city.
SELECT P.PERSONNAME,P.SALARY,D.DEPARTMENTNAME,P.City
FROM PERSON P
JOIN DEPT D
ON P.DepartmentID=D.DepartmentID
WHERE P.CITY='JAMNAGAR'

--4. Retrieve person name, salary & department name who does not belong to Rajkot city.
SELECT P.PERSONNAME,P.SALARY,D.DEPARTMENTNAME,P.CITY
FROM PERSON P
JOIN DEPT D
ON P.DepartmentID=D.DepartmentID
WHERE P.CITY<>'RAJKOT'

--5. Retrieve person’s name of the person who joined the Civil department after 1-Aug-2001.
SELECT P.PERSONNAME,D.DEPARTMENTNAME,P.JOININGDATE
FROM PERSON P
JOIN DEPT D
ON P.DepartmentID=D.DepartmentID
WHERE P.JoiningDate>'2001-08-01'

--6. Find details of all persons who belong to the computer department.
SELECT *
FROM PERSON P
JOIN DEPT D
ON P.DepartmentID=D.DepartmentID
WHERE D.DepartmentName='COMPUTER'

--7. Display all the person's name with the department whose joining date difference with the current date is more than 365 days.
SELECT P.PERSONNAME,D.DEPARTMENTNAME
FROM PERSON P
LEFT JOIN DEPT D
ON P.DepartmentID= D.DepartmentID
WHERE DATEDIFF(DAY,P.JOININGDATE,GETDATE())>365

--8. Find department wise person counts.
SELECT D.DEPARTMENTNAME,COUNT(*) AS COUNT
FROM PERSON P
JOIN DEPT D
ON P.DepartmentID= D.DepartmentID
GROUP BY DepartmentName

--9. Give department wise maximum & minimum salary with department name.
SELECT D.DEPARTMENTNAME,MAX(P.SALARY) AS MAX,MIN(P.SALARY) AS MIN
FROM PERSON P
JOIN DEPT D
ON P.DepartmentID=D.DepartmentID
GROUP BY D.DepartmentName

--10. Find city wise total, average, maximum and minimum salary.
SELECT P.CITY, SUM(P.SALARY) AS TOTAL, AVG(P.SALARY) AS AVERAGE,MAX(P.SALARY) AS MAXIMUM, MIN(P.SALARY) AS MINIMUM
FROM PERSON P
JOIN DEPT D
ON P.DepartmentID=D.DepartmentID
GROUP BY P.CITY

--11. Find the average salary of a person who belongs to Ahmedabad city.
SELECT P.PERSONNAME, AVG(P.SALARY) AS AVERAGE
FROM PERSON P
LEFT JOIN DEPT D
ON P.DepartmentID=D.DEPARTMENTID
WHERE P.CITY='AHMEDABAD'
GROUP BY P.PERSONNAME


--12. Produce Output Like: <PersonName> lives in <City> and works in <DepartmentName> Department. (In single column)
SELECT P.PERSONNAME + ' lives in ' + P.CITY + ' and work in ' + D.DEPARTMENTNAME + ' department '
FROM PERSON P
JOIN DEPT D
ON P.DEPARTMENTID = D.DEPARTMENTID

--Part – B:
--1. Produce Output Like: <PersonName> earns <Salary> from <DepartmentName> department monthly. (In single column)
SELECT 
    P.PERSONNAME + ' earns ' + CAST(P.SALARY AS VARCHAR(20)) + ' from ' + D.DEPARTMENTNAME + ' department monthly' AS OutputColumn
FROM 
    PERSON P
JOIN 
    DEPT D ON P.DEPARTMENTID = D.DEPARTMENTID;

--2. Find city & department wise total, average & maximum salaries.
SELECT P.CITY,D.DEPARTMENTNAME,SUM(SALARY) AS TOTAL,AVG(SALARY) AS AVERAGE,MAX(SALARY) AS MAXIMUM
FROM PERSON P
JOIN DEPT D
ON P.DEPARTMENTID=D.DEPARTMENTID
GROUP BY P.CITY,D.DEPARTMENTNAME

--3. Find all persons who do not belong to any department.
SELECT *
FROM PERSON
WHERE PERSON.DEPARTMENTID IS NULL

--4. Find all departments whose total salary is exceeding 100000
SELECT D.DEPARTMENTNAME,SUM(P.SALARY)
FROM PERSON P
JOIN DEPT D
ON P.DepartmentID=D.DEPARTMENTID
GROUP BY D.DepartmentName
HAVING SUM(P.SALARY)>100000

--Part – C:
--1. List all departments who have no person.
SELECT D.DEPARTMENTNAME,COUNT(P.PERSONID) AS NUMBER
FROM PERSON P
JOIN DEPT D
ON P.DepartmentID=D.DepartmentID
GROUP BY D.DepartmentName
HAVING COUNT(P.PERSONID)=0

--2. List out department names in which more than two persons are working.
SELECT D.DEPARTMENTNAME,COUNT(P.PERSONID) AS NUMBER
FROM PERSON P
JOIN DEPT D
ON P.DepartmentID=D.DepartmentID
GROUP BY D.DepartmentName
HAVING COUNT(P.PERSONID)>2

--3. Give a 10% increment in the computer department employee’s salary. (Use Update)
UPDATE PERSON
SET SALARY = SALARY * 1.10
WHERE DEPARTMENTID = (
    SELECT DEPARTMENTID 
    FROM DEPT 
    WHERE DEPARTMENTNAME = 'Computer'
);
