show databases;
use sql_practice;
show tables;
select * from employee;

-- Salary greater than 50000--
select Salary from employee where Salary>50000;

-- Salary less than 30000--
select salary from employee where Salary<30000;

-- Salary between 30000 and 70000--
select Salary from employee where salary between 30000 and 70000;

-- Department = 101--
select *from employee where department_ID='101';

-- city=pune--
select *from employee where city='pune';

-- City IN (Pune, Mumbai)--
select *from employee where city in('pune','mumbai');

-- Employees whose experience >5 years--
select *,extract(year from curdate())-extract(year from Hire_Date) as experience from employee
where extract(year from curdate())-extract(year from Hire_Date)>5;

-- Manager_ID IS NUL--
select * from employee where manager_id is null;

-- Manager_ID IS NUL--
select * from employee where manager_id is not null;

-- Joined after 2023--
select *from employee where hire_date>2023-01-01;

-- display records where salary is >40000 and city=pune--
select * from employee where salary>40000 and city='pune';

-- Female employee--
select * from employee where gender='Female';

---------------------------------------------------------------------------------------------------
-- LIKE operator--
-- Name starts with A. -- Name ends with N.-- Name contains AR. -- Second character is A.--
-- Third character is R.-- Exactly 5 letters--

select *from employee where First_name like'a%';
select *from employee where First_name like'%n';
select *from employee where First_name like'%ar%';
select *from employee where First_name like'_a%';
select *from employee where First_name like'__r%';
select *from employee where First_name like'_____';

-- Starts with S and ends with A--
select * from employee where First_name like's%a';

-- Last name contains KAR--
select * from employee where last_name like'%kar%';

-- City starts with P-- City ends with E--
select * from employee where city like'p%';
select * from employee where city like'%e';

-- Email ends with .com -- Phone starts with 9--
select * from employee where email like'%.com';
select * from employee where phone like'9%';

-- Name contains two A's--
select* from employee where First_name like'%aa%';

-- Name starts with R and contains H--
select* from employee where First_name like'r%' and First_name like'%h%';

-------------------------------------------------------------------------------------------------------
-- order by--
-- City ascending then salary descending -- 
select * from Employee order by city asc ,salary desc;

-- Join date latest first--
select * from employee order by hire_Date asc;

-- Experience descending--
select extract(year from curdate())-extract(year from hire_date) as experience from employee order by experience desc;

-- Annual salary descending--
select  employee_Id,salary ,salary*12 as AnnualSalary from employee order by AnnualSalary desc;

-- Top 5 salaries--
select * from employee order by salary desc limit 5;

--  Lowest 5 salaries--
select * from employee order by salary limit 5;

-- Oldest employee first--
select *from employee order by hire_date asc;

----------------------------------------------------------------------------------
-- function--
-- Display all employee names in uppercase--
select ucase(First_name) as Fist_Name,ucase(Last_name) as Last_name from employee;

-- Display all employee last names in lowercase--
select lower(Last_name) as last_name from employee;

-- Display the length of each employee's first name--
select length(First_name) as total_lemgth from employee;

-- Display the full name of each employee--
select concat(first_name,Last_name) as fullName from employee;

-- Display salary rounded to the nearest integer--
select round(Salary) as roundoff from employee;

-- Display salary rounded up using CEIL()--
select ceil(Salary) as roundoff from employee;

-- Display salary rounded down using FLOOR()--
select floor(Salary) as floorFunc from employee;

-- find the absolute value of -500--
select abs(-500) as absolute from dual;

-- Find the remainder when 250 is divided by 7--
select mod(250,7) as reminder from dual;

-- Display today's date.--
select curdate() as todaysDate from dual;

-- Display the current date and time--
select now() as dateAndTime from dual;

-- Display the number of days each employee has worked in the company--
select employee_id,first_name,last_name,datediff(curdate(),hire_date) as workingDay from employee;

-- Display the total number of employees--
select count(*) as totalEmployee from employee;

-- Display the total salary paid to all employees--
select sum(Salary) as totalSalary from employee;

-- Display the average salary of employees--
select avg(salary) as avarage from employee;

-- Display the minimum salary in the company--
select min(salary) as minSalary from employee;

-- Display the maximum salary in the company--
select max(salary) as maxSlaray from employee;

