CREATE TABLE EMP(
EID INT, ENAME VARCHAR(20), DEPARTMENT VARCHAR(20), SALARY  INT, 
JOININGDATE DATETIME, CITY VARCHAR(20))


INSERT INTO EMP VALUES(101, 'RAHUL', 'ADMIN', 56000, '1990-01-1', 'RAJKOT'),
(102, 'HARDIK', 'IT', 18000, '1990-09-25', 'AHMEDABAD'),
(103, 'BHAVIN', 'HR', 25000, '1991-05-14', 'BARODA'),
(104, 'BHOOMI', 'ADMIN', 39000, '1991-02-8', 'RAJKOT'),
(105, 'ROHIT', 'IT', 17000, '1990-07-23', 'JAMNAGAR'),
(106, 'PRIYA', 'IT', 9000, '1990-10-18', 'AHMEDABAD'),
(107, 'BHOOMI', 'HR', 34000, '1991-12-25', 'RAJKOT')

--PART A
--1. Display the Highest, Lowest, Label the columns Maximum, Minimum respectively.
SELECT MAX(SALARY) AS MAXIMUM, MIN(SALARY) AS MINIMUM FROM EMP

--2. Display Total, and Average salary of all employees. Label the columns Total_Sal and Average_Sal, respectively.
SELECT SUM(SALARY) AS TOTAL_SAL, AVG(SALARY) AS AVERAGE_SAL FROM EMP

--3. Find total number of employees of EMPLOYEE table.
SELECT COUNT(*) FROM EMP

--4. Find highest salary from Rajkot city.
SELECT MAX(SALARY) AS MAXIMUM_SALARY FROM EMP WHERE CITY='RAJKOT'

--5. Give maximum salary from IT department.
SELECT MAX(SALARY) AS MAXIMUM_SALARY FROM EMP WHERE DEPARTMENT='IT'

--6. Count employee whose joining date is after 8-feb-91.
SELECT COUNT(*) AS NUMBER FROM EMP WHERE JOININGDATE>'1991-2-8'

--7. Display average salary of Admin department.
SELECT AVG(SALARY) AS AVERAGE FROM EMP WHERE DEPARTMENT='ADMIN'

--8. Display total salary of HR department.
SELECT SUM(SALARY) AS TOTAL FROM EMP WHERE DEPARTMENT='HR'

--9. Count total number of cities of employee without duplication.
SELECT COUNT(DISTINCT CITY) AS CITY FROM EMP

--10. Count unique departments.
SELECT COUNT(DISTINCT DEPARTMENT) AS DEPARTMENT FROM EMP

--11. Give minimum salary of employee who belongs to Ahmedabad.
SELECT MIN(SALARY) AS MINIMUM FROM EMP WHERE CITY='AHMEDABAD'

--12. Find city wise highest salary.
SELECT CITY, MAX(SALARY) AS MAXIMUM FROM EMP GROUP BY CITY

--13. Find department wise lowest salary.
SELECT DEPARTMENT, MIN(SALARY) AS MINIMUM FROM EMP GROUP BY DEPARTMENT

--14. Display city with the total number of employees belonging to each city.
SELECT CITY, COUNT(*) AS TOTAL FROM EMP GROUP BY CITY

--15. Give total salary of each department of EMP table.
SELECT DEPARTMENT, SUM(SALARY) AS TOTAL FROM EMP GROUP BY DEPARTMENT

--16. Give average salary of each department of EMP table without displaying the respective department name.
SELECT AVG(SALARY) FROM EMP GROUP BY DEPARTMENT

--Part – B:
--1. Count the number of employees living in Rajkot.
SELECT COUNT(*) AS COUNT FROM EMP WHERE CITY='RAJKOT'

--2. Display the difference between the highest and lowest salaries. Label the column DIFFERENCE.
SELECT MAX(SALARY)-MIN(SALARY) AS DIFFERENCE FROM EMP

--3. Display the total number of employees hired before 1st January, 1991.
SELECT COUNT(*) AS COUNT FROM EMP WHERE JOININGDATE < '1991-1-1'

--Part – C:
--1. Count the number of employees living in Rajkot or Baroda.
SELECT COUNT(*) AS COUNT FROM EMP WHERE CITY='RAJKOT' OR CITY='BARODA'

--2. Display the total number of employees hired before 1st January, 1991 in IT department.
SELECT COUNT(*) AS TOTALEMPLOYEE FROM EMP WHERE JOININGDATE<'1991-1-1' AND DEPARTMENT='IT' 

--3. Find the Joining Date wise Total Salaries.
SELECT JOININGDATE, SUM(SALARY) AS TOTAL FROM EMP GROUP BY JOININGDATE

--4. Find the Maximum salary department & city wise in which city name starts with ‘R’.
SELECT DEPARTMENT,CITY, MAX(SALARY) AS MAXIMUM FROM EMP WHERE CITY LIKE 'R%' GROUP BY DEPARTMENT, CITY


--extra
--find out department wise highest paid employee name without having
Select ENAME, DEPARTMENT, SALARY AS MAXIMUM from EMP WHERE SALARY IN 
(SELECT MAX(SALARY) from EMP GROUP BY DEPARTMENT); 


--EXTRA
--1.Calculate the average salary of employees hired after 1st January, 1991. Label the column as Average_Salary_After_1991.
SELECT AVG(SALARY) AS AVERAGE_SALARY_AFTER_1991 FROM EMP WHERE JOININGDATE>'1991-01-01' 
   
--2.Find the total number of employees in each department.
SELECT DEPARTMENT,COUNT(*) AS COUNT FROM EMP GROUP BY DEPARTMENT

--3.Display the total salary of employees in each city in descending order.
SELECT DEPARTMENT,SUM(SALARY) AS TOTAL FROM EMP GROUP BY DEPARTMENT ORDER BY SUM(SALARY) DESC

--4.Find the total number of employees in each city.
SELECT CITY,COUNT(*) AS TOTAL FROM EMP GROUP BY CITY 

--5.Find the highest salary among all employees.
SELECT MAX(SALARY) AS MAXIMUM FROM EMP

--6.Retrieve the maximum salary from the IT department.
SELECT MAX(SALARY) AS MAXIMUM FROM EMP WHERE DEPARTMENT='IT'

--7.Count the total number of distinct cities where employees reside.
SELECT COUNT(DISTINCT CITY) FROM EMP

--8.Calculate the total salary of each department.
SELECT DEPARTMENT,SUM(SALARY) AS TOTAL FROM EMP GROUP BY DEPARTMENT

--9.Find the minimum salary of an employee residing in Ahmedabad.
SELECT MIN(SALARY) AS MINIMUM FROM EMP WHERE CITY='AHMEDABAD'

--10.List the departments with total salaries exceeding 50000 and located in Rajkot.
SELECT DEPARTMENT,SUM(SALARY) AS TOTAL FROM EMP WHERE CITY='RAJKOT' GROUP BY DEPARTMENT HAVING SUM(SALARY)>50000

--11.List the departments with total salaries exceeding 35000 and sort the list by total salary.
SELECT DEPARTMENT,SUM(SALARY) AS TOTAL FROM EMP GROUP BY DEPARTMENT ORDER BY SUM(SALARY)

--12.List departments with more than two employees.
SELECT DEPARTMENT,COUNT(*) AS COUNT FROM EMP GROUP BY DEPARTMENT HAVING COUNT(*)>2

--13.Show departments where the average salary is above 25000.
SELECT DEPARTMENT,AVG(SALARY) AS AVERAGE FROM EMP GROUP BY DEPARTMENT HAVING AVG(SALARY)>25000

--14.Retrieve cities with employees hired before 1st January 1991.
SELECT CITY,COUNT(*) AS EMPLOYEE FROM EMP WHERE JOININGDATE<'1991-01-01' GROUP BY CITY

--15.Find departments with a total salary between 50000 and 100000.
SELECT DEPARTMENT,SUM(SALARY) AS TOTAL FROM EMP GROUP BY DEPARTMENT HAVING SUM(SALARY) BETWEEN 50000 AND 100000