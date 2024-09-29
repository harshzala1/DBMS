--Math functions
--Part – A:
--1. Display the result of 5 multiply by 30.
SELECT 5*30 AS MULTIPLY

--2. Find out the absolute value of -25, 25, -50 and 50.
SELECT ABS(-25) AS ABSOLUTE,ABS(25) AS ABSOLUTE,ABS(-50) AS ABSOLUTE,ABS(50) AS ABSOLUTE 

--3. Find smallest integer value that is greater than or equal to 25.2, 25.7 and -25.2.
SELECT CEILING(25.2), CEILING(25.7), CEILING(-25.2)

--4. Find largest integer value that is smaller than or equal to 25.2, 25.7 and -25.2.
SELECT FLOOR(25.2), FLOOR(25.7), FLOOR(-25.2)

--5. Find out remainder of 5 divided 2 and 5 divided by 3.
SELECT 5/2, 5/3

--6. Find out value of 3 raised to 2nd power and 4 raised 3rd power.
SELECT POWER(3,2), POWER(4,3)

--7. Find out the square root of 25, 30 and 50.
SELECT SQRT(25), SQRT(30), SQRT(50)

--8. Find out the square of 5, 15, and 25.
SELECT SQUARE(5), SQUARE(15), SQUARE(25)

--9. Find out the value of PI.
SELECT PI()

--10. Find out round value of 157.732 for 2, 0 and -2 decimal points.
SELECT ROUND(157.732,2), ROUND(157.732,0), ROUND(157.732,-2)

--11. Find out exponential value of 2 and 3.
SELECT EXP(2), EXP(3)

--12. Find out logarithm having base e of 10 and 2.
SELECT LOG(10), LOG(2)

--13. Find out logarithm having base b having value 10 of 5 and 100.
SELECT LOG10(5), LOG10(100)

--14. Find sine, cosine and tangent of 3.1415.
SELECT SIN(3.1415), COS(3.1415), TAN(3.1415)

--15. Find sign of -25, 0 and 25.
SELECT SIGN(-25), SIGN(0), SIGN(25)

--16. Generate random number using function.
SELECT RAND()

--Part-B
CREATE TABLE EMP_MASTER(EMPNO INT, EMPNAME VARCHAR(20), JOININGDATE VARCHAR(50), SALARY DECIMAL(7,2), 
COMMISSION INT, CITY VARCHAR(50), DEPTCODE VARCHAR(50))

INSERT INTO EMP_MASTER VALUES(101,'KEYUR','2002-01-05',12000,4500,'RAJKOT','3@g'),
(102,'HARDIK','2004-02-15',14000,2500,'AHMEDABAD','3@'),
(103,'KAJAL','2006-03-14',15000,3000,'BARODA','3-GD'),
(104,'BHOOMI','2005-06-23',12500,1000,'AHMEDABAD','1A3D'),
(105,'HARMIT','2004-02-15',14000,2000,'RAJKOT','312A')

SELECT * FROM EMP_MASTER

--1. Display the result of Salary plus Commission.
SELECT 
    EMPNAME,
    SALARY,
    COMMISSION,
    (SALARY + COMMISSION) AS total_compensation
FROM 
    EMP_MASTER;

--2. Find smallest integer value that is greater than or equal to 55.2, 35.7 and -55.2.
SELECT CEILING(55.2) AS CEIL, CEILING(35.7) AS CEIL, CEILING(-55.2) AS CEIL

--3. Find largest integer value that is smaller than or equal to 55.2, 35.7 and -55.2.
SELECT FLOOR(55.2) AS FLOOR, FLOOR(35.7) AS FLOOR, FLOOR(-55.2) AS FLOOR

--4. Find out remainder of 55 divided 2 and 55 divided by 3.
SELECT 55/2, 55/3

--5. Find out value of 23 raised to 2nd power and 14 raised 3rd power.
SELECT POWER(23,2), POWER(14,3)

--Part – C:
--1. Find out the square root of 36, 49 and 81.
SELECT SQRT(36),SQRT(49),SQRT(81)

--2. Find out the square of 3, 9, and 12.
SELECT SQUARE(3),SQUARE(9),SQUARE(12)

--3. Find out round value of 280.8952 for 2, 0 and -2 decimal points.
SELECT ROUND(280.8952,2),ROUND(280.8952,0),ROUND(280.8952,-2)

--4. Find sine, cosine and tangent of 4.2014.
SELECT SIN(4.2014), COS(4.2014), TAN(4.2014)

--5. Find sign of -55, 0 and 95.
SELECT SIGN(-55), SIGN(0), SIGN(95)


--String functions
--Part – A:

--1. Find the length of following. (I) NULL (II) ‘ hello ’ (III) Blank
SELECT LEN(NULL) AS LENGTH, LEN('HELLO') AS LENGTH, LEN('') AS LENGTH

--2. Display your name in lower & upper case.
SELECT LOWER('AYUSHI') AS LOWER_CASE, UPPER('AYUSHI') AS UPPER_CASE

--3. Display first three characters of your name.
SELECT SUBSTRING('AYUSHI',1,3) AS NAME

--4. Display 3rd to 10th character of your name.
SELECT SUBSTRING('AYUSHI PATEL',3,10) AS NAME

--5. Write a query to convert ‘abc123efg’ to ‘abcXYZefg’ & ‘abcabcabc’ to ‘ab5ab5ab5’ using REPLACE.
SELECT REPLACE('abc123efg','123','XYZ') AS NEW_WORD, REPLACE('abcabcabc','c','5') AS NEW_WORD

--6. Write a query to display ASCII code for ‘a’,’A’,’z’,’Z’, 0, 9.
SELECT ASCII('a') AS ASCII,ASCII('A') AS ASCII,ASCII('z') AS ASCII,ASCII('Z') AS ASCII,ASCII('0') AS ASCII,ASCII('9') AS ASCII

--7. Write a query to display character based on number 97, 65,122,90,48,57.
SELECT CHAR('97') AS ASCII,CHAR('65') AS ASCII,CHAR('122') AS ASCII,CHAR('90') AS ASCII,CHAR('48') AS ASCII,CHAR('57') AS ASCII

--8. Write a query to remove spaces from left of a given string ‘hello world ‘.
SELECT LTRIM('   HELLO WORLD')

--9. Write a query to remove spaces from right of a given string ‘ hello world ‘.
SELECT RTRIM('HELLO WORLD    ')

--10. Write a query to display first 4 & Last 5 characters of ‘SQL Server’.
SELECT LEFT('SQL SERVER',4), RIGHT('SQL SERVER',5)

--11. Write a query to convert a string ‘1234.56’ to number (Use cast and convert function).
SELECT CAST('1234.56' AS DECIMAL(10,2)) AS NUMBER, CONVERT(FLOAT, 1234.56) AS NUMBER

--12. Write a query to convert a float 10.58 to integer (Use cast and convert function).
SELECT CAST(10.58 AS INT) AS NUMBER, CONVERT(INT, 10.58) AS NUMBER

--13. Put 10 space before your name using function.
SELECT SPACE(10) + 'AYUSHI'

--14. Combine two strings using + sign as well as CONCAT ().
SELECT CONCAT('DARSHAN',' ','UNIVERSITY'), 'DARSHAN'+'UNIVERSITY'

--15. Find reverse of “Darshan”.
SELECT REVERSE('DARSHAN')

--16. Repeat your name 3 times.
SELECT REPLICATE('AYUSHI',3)

--Part – B: Perform following queries on Student table of practical no 5.

CREATE TABLE STUDENT(
STUID INT, FIRSTNAME VARCHAR(25), LASTNAME VARCHAR(25),
WEBSITE VARCHAR(20), CITY VARCHAR(25), ADDRESS VARCHAR(100))

INSERT INTO STUDENT VALUES(1011, 'KEYUR', 'PATEL', 'techonthenet.com', 'RAJKOT', 'A-303 ''VASANT KUNJ'', RAJKOT'),
(1022, 'HARDIK', 'SHAH', 'digminecraft.com', 'AHMEDABAD', '"RAM KRUPA", RAIYA ROAD'),
(1033, 'KAJAL', 'TRIVEDI', 'bigactivities.com', 'BARODA', 'RAJ BHAVAN PLOT, NEAR GARDEN'),
(1044, 'BHOOMI', 'GAJERA', 'checkyouth.com', 'AHMEDABAD', '"JIG''S HOME", NAROL'),
(1055, 'HARMIT', 'MITEL', '@me.darshan.com', 'RAJKOT', 'B-55, RAJ RESIDENCY'),
(1066, 'ASHOK', 'JANI', NULL, 'BARODA', 'A502, CLUB HOUSE BUILDING')
--1. Find the length of FirstName and LastName columns.
SELECT FIRSTNAME, LASTNAME, LEN(FIRSTNAME) AS LENGTH,LEN(LASTNAME) AS LENGTH FROM STUDENT

--2. Display FirstName and LastName columns in lower & upper case.
SELECT FIRSTNAME, LASTNAME, LOWER(FIRSTNAME) AS LOWER, LOWER(LASTNAME) AS LOWER, UPPER(FIRSTNAME) AS UPPER, UPPER(LASTNAME) AS UPPER FROM STUDENT

--3. Display first three characters of FirstName column.
SELECT FIRSTNAME, SUBSTRING(FIRSTNAME,1,3) FROM STUDENT

--4. Display 3rd to 10th character of Website column.
SELECT WEBSITE, SUBSTRING(WEBSITE,3,10) FROM STUDENT

--5. Write a query to display first 4 & Last 5 characters of Website column.
SELECT LEFT(WEBSITE,4) AS FIRST, RIGHT(WEBSITE,5) AS LAST FROM STUDENT

--Part – C: Perform following queries on Student table of practical no 5.
--1. Put 10 space before FirstName using function.
SELECT SPACE(10)+ FIRSTNAME FROM STUDENT

--2. Combine FirstName and LastName columns using + sign as well as CONCAT ().
SELECT FIRSTNAME+LASTNAME, CONCAT(FIRSTNAME,' ', LASTNAME) FROM STUDENT

--3. Combine all columns using + sign as well as CONCAT ().
SELECT FIRSTNAME+LASTNAME+WEBSITE+CITY+ADDRESS FROM STUDENT
SELECT CONCAT(FIRSTNAME,' ' ,LASTNAME,' ',WEBSITE,' ',CITY,' ',ADDRESS) FROM STUDENT

--4. Find reverse of FirstName column.
SELECT REVERSE(FIRSTNAME) FROM STUDENT

--5. Repeat FirstName column 3 times
SELECT REPLICATE(FIRSTNAME,3) FROM STUDENT

--6. Give the Names which contains 5 characters.
SELECT FIRSTNAME FROM STUDENT WHERE FIRSTNAME LIKE'_____'

--7. Combine the result as <FirstName> Lives in <City>.
SELECT CONCAT(FIRSTNAME, ' lives in ', CITY) AS description FROM STUDENT;

--8. Combine the result as Student_ID of < FirstName > is <StuID> .
SELECT CONCAT(FIRSTNAME, ' IS ', STUID) AS STUDENT_ID FROM STUDENT


--Date Functions
--Part – A:

--1. Write a query to display the current date & time. Label the column Today_Date.
SELECT GETDATE() AS TODAY_DATE

--2. Write a query to find new date after 365 day with reference to today.
SELECT EOMONTH(GETDATE(),12) AS NEW_DATE

--3. Display the current date in a format that appears as may 5 1994 12:00AM.
SELECT FORMAT(GETDATE(),'MMM dd yyyy HH:MM') AS CURRENTDATE

--4. Display the current date in a format that appears as 03 Jan 1995.
SELECT FORMAT(GETDATE(),'dd MMM yyyy') AS CURRENTDATE

--5. Display the current date in a format that appears as Jan 04, 96.
SELECT FORMAT(GETDATE(),'MMM dd, yy') AS CURRENTDATE

--6. Write a query to find out total number of months between 31-Dec-08 and 31-Mar-09.
SELECT DATEDIFF(MONTH,'2008-12-31','2009-03-31') AS DIFFERENCE

--7. Write a query to find out total number of years between 25-Jan-12 and 14-Sep-10.
SELECT DATEDIFF(YEAR,'2012-01-25','2010-09-14') AS DIFFERENCE

--8. Write a query to find out total number of hours between 25-Jan-12 7:00 and 26-Jan-12 10:30.
SELECT DATEDIFF(HOUR,'2012-01-25 07:00:00','2012-01-26 10:30:00') AS DIFFERENCE

--9. Write a query to extract Day, Month, Year from given date 12-May-16.
SELECT DATENAME(DAY,'2016-05-12'),DATENAME(MONTH,'2016-05-12'),DATENAME(YEAR,'2016-05-12')

--10. Write a query that adds 5 years to current date.
SELECT DATEADD(yyyy,5,GETDATE())

--11. Write a query to subtract 2 months from current date.
SELECT DATEADD(MONTH, -2, GETDATE());

--12. Extract month from current date using datename () and datepart () function.
SELECT DATENAME(MONTH,GETDATE()) AS MONTH
SELECT DATEPART(MONTH,GETDATE()) AS MONTH

--13. Write a query to find out last date of current month.
SELECT EOMONTH(GETDATE())

--14. Calculate your age in years and months.
SELECT DATEDIFF(YEAR,'2004-12-29','2024-08-06') AS YEAR
SELECT DATEDIFF(MONTH,'2004-12-29','2024-08-06') AS MONTH


--PART-B
CREATE TABLE EMP_DETAIL
(EMPNO INT,
EMPNAME VARCHAR(20),
JOININGDATE DATETIME ,
SALARY DECIMAL(7,2), 
CITY VARCHAR(50))

INSERT INTO EMP_DETAIL VALUES(101,'KEYUR','2002-01-05',12000,'RAJKOT'),
(102,'HARDIK','2004-02-15',14000,'AHMEDABAD'),
(103,'KAJAL','2006-03-14',15000,'BARODA'),
(104,'BHOOMI','2005-06-23',12500,'AHMEDABAD'),
(105,'HARMIT','2004-02-15',14000,'RAJKOT')

DROP TABLE EMP_DETAIL



--1. Write a query to find new date after 365 day with reference to JoiningDate.
SELECT DATEADD(d,365,JOININGDATE) AS NEW_DATE FROM EMP_DETAIL

--2. Display the JoiningDate in a format that appears as may 5 1994 12:00AM.
SELECT FORMAT(JOININGDATE,'MMM dd yyyy HH:MM') FROM EMP_DETAIL

--3. Display the JoiningDate in a format that appears as 03 Jan 1995.
SELECT FORMAT(JOININGDATE,'dd MMM yyyy') FROM EMP_DETAIL

--4. Display the JoiningDate in a format that appears as Jan 04, 96.
SELECT FORMAT(JOININGDATE,'MMM dd,yy') FROM EMP_DETAIL

--5. Write a query to find out total number of months between JoiningDate and 31-Mar-09.
SELECT DATEDIFF(MONTH,JOININGDATE,'2009-03-31') FROM EMP_DETAIL


--Part – C: 
--1. Write a query to extract Day, Month, Year from JoiningDate.
SELECT DAY(JOININGDATE) AS DAY FROM EMP_DETAIL
SELECT MONTH(JOININGDATE) AS MONTH FROM EMP_DETAIL
SELECT YEAR(JOININGDATE) AS YEAR FROM EMP_DETAIL

--2. Write a query that adds 5 years to JoiningDate.
SELECT DATEADD(yy,5,JOININGDATE) FROM EMP_DETAIL

--3. Write a query to subtract 2 months from JoiningDate.
SELECT DATEADD(m,-2,JOININGDATE) FROM EMP_DETAIL

--4. Extract month from JoiningDate using datename () and datepart () function.
SELECT DATENAME(MONTH,JOININGDATE) AS MONTH FROM EMP_DETAIL
SELECT DATEPART(MONTH,JOININGDATE) AS MONTH FROM EMP_DETAIL

--5. Calculate your age in years and months
SELECT DATEDIFF(YEAR,'2004-12-29','2024-08-06') AS YEAR
SELECT DATEDIFF(MONTH,'2004-12-29','2024-08-06') AS MONTH