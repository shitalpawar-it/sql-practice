show databases;

-- 1 Student Management System--
-- create student table--
create table student(rollno int, first_name varchar(10), last_name varchar(10),birthdate date);

desc student;

insert into student values('101','Seeta','Kamble','2004-02-26');
insert into student values('102', 'geeta','Rode','2002-01-01');
insert into student values(103,'Shilpa','Rathod','1998-8-15');
insert into student values(105,'Nikita','Chavan','1999-7-26');
insert into student values(106,'Priya','Pawar','2016-7-14');
insert into student values(107,'Prem','Aade','2014-04-14');
insert into student values(108,'Varsha','Patil','1999-6-28');
insert into student values(109, 'Vibhawari','Shinde','2004-8-26');
insert into student values(110,'Neha','Pawar','2002-9-10');
insert into student values(104,'Palak','Rathod','2022-5-15');

select * from student;
 
 -- add 3 duplicate records into table --
update student set rollno=103 , first_name='Shilpa', last_name='Rathod' where first_name='Nikita';
update student set rollno=110 , first_name='Neha', last_name='Pawar' where birthdate='2004-8-26';
update student set rollno=104 , first_name='Palak', last_name='Rathod' where  birthdate='2022-5-15';

-- display first name and last name--
select first_name, last_name from student;

-- display all the records from table--
select * from student;

-- add new column i.e percentage --
alter table student add percentage float after last_name ;

-- rename column name birthdate to DOB--
alter table student rename column birthdate to DOB;

-- update all the records add value in newly created column percentage--

update student set percentage=87 where rollno=101;
update student set percentage=77.20 where rollno=102;
update student set percentage=95.10 where rollno=103;
update student set percentage=75 where rollno=104;
update student set percentage=89.75 where rollno=105;
update student set percentage=90.55 where rollno=106;
update student set percentage=84.66 where rollno=107;
update student set percentage=87 where rollno=108;
update student set percentage=90 where rollno=109;
update student set percentage=99.20 where rollno=110;

-- to remove percentage column--
alter table student drop percentage;

-- delete specific record where rollno=104--
delete from student where rollno=104;

-- rename entire table from student to studentinfo--
rename table student to studentinfo;
show tables;
  
  -- truncate table--
truncate table studentinfo;

-- drop table--
drop table studentinfo;
select * from studentinfo;

-- 2 Employee Management --
create table  Employee( EmployeeID int, EmployeeName varchar(30), Deparatment varchar(30), Salary decimal, JoiningDate date);

-- insert 12 employee records--
insert into Employee values(101,'Tejas pawar', 'Accountant', 280000,'2014-06-1' );
insert into Employee values(102,'Priya Patil', 'HR', 35000,'2016-03-15' );
insert into Employee values(103,'Rahul Sharama', 'IT', 45000,'2018-07-20' );
insert into Employee values(104,'Sneha Joshi', 'Finance', 40000,'2017-11-10' );
insert into Employee values(105,'Amit Verma', 'Marketing', 32000,'2019-02-25' );
insert into Employee values(106,'Pooja kulkarni', 'Sales', 30000,'2020-08-18' );
insert into Employee values(107,'Rohan Deshmukh', 'IT', 50000,'2015-05-30' );
insert into Employee values(108,'Neha More', 'HR', 340000,'2021-01-12' );
insert into Employee values(109,'Sager Shinde', 'Finance', 42000,'2016-09-05' );
insert into Employee values(110,'Kiran Jadhav', 'Marketing', 31000,'2018-12-22' );
insert into Employee values(111,'Anjali Patil', 'Sales', 29000,'2022-04-14' );
insert into Employee values(112,'Vikas Kumbhar', 'Accountant', 36000,'2017-10-8' );

-- display all employee--
select * from Employee;

-- display only EmployeeName and Salary--
select EmployeeName , Salary from Employee;

-- add new Column Bonus--
alter table Employee add Bonus decimal after salary;

-- update Bonus for all employee by 500--
update Employee set Bonus=500;

-- delete employee whose employee id=105--
delete from Employee where EmployeeID=105;

-- Rename salary to BasicSalary--
alter table Employee rename column Salary to BacisSalary;

-- drop the bonus column--
alter table Employee drop Bonus;

-- rename the table Employee to EmployeeDetails--
rename table Employee to EmployeeDetails;
show tables;


-- 3 Producat Inventory--

-- Create table producat--
create table Producat(ProducatID int, ProducatName varchar(40), Category varchar(40), Price Decimal, Quantity int);

-- insert 10 records--
insert into Producat values(101,'Latop', 'Electronics', 55000, 10);
insert into Producat values(102,'Mobile', 'Electronics', 25000, 20);
insert into Producat values(103,'Keyboard', 'Electronics', 1200, 50);
insert into Producat values(104,'Mouse', 'Electronics', 800, 60);
insert into Producat values(105,'Chair', 'Furniture', 35000, 15);
insert into Producat values(106,'Table', 'Furniture', 6000, 8);
insert into Producat values(107,'Notebook', 'Stationery', 80, 100);
insert into Producat values(108,'Pen', 'Stationery', 20, 200);
insert into Producat values(109,'Water Bottle', 'Accessories', 350, 40);
insert into Producat values(110,'Scholl Bag', 'Accessories', 1500, 25);

-- Display all the products--
Select * from  Producat;
select ProducatName from Producat;

-- Display Producat with Price greater than 10000--
select ProducatName, Price from Producat where Price>10000;

 -- add column discount --
 alter table Producat add discount float After Price;

-- update discount for all the producat --
update Producat set discount=55 ;
  
-- delete  the producat  with ProducatId=103--
delete from Producat where ProducatID=103;

-- Truncate Table--
truncate table Producat;

-- drop table--
drop table Producat;












