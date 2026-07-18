 create database sql_practice;
 use sql_practice;
 create table Department(Department_ID int primary key, Demartment_Name varchar(30),Location varchar(30));
 INSERT INTO Department VALUES
(101,'IT','Pune'),
(102,'HR','Mumbai'),
(103,'Finance','Pune'),
(104,'Sales','Nagpur'),
(105,'Marketing','Nashik');

select * from Department;

CREATE TABLE Employee(
    Employee_ID INT PRIMARY KEY,
    First_Name VARCHAR(30),
    Last_Name VARCHAR(30),
    Gender VARCHAR(10),
    Age INT,
    Salary DECIMAL(10,2),
    City VARCHAR(30),
    Hire_Date DATE,
    Department_ID INT,
    Manager_ID INT,
    Email VARCHAR(50),
    Phone VARCHAR(15),
    FOREIGN KEY (Department_ID) REFERENCES Department(Department_ID)
);

INSERT INTO Employee VALUES
(1,'Rahul','Patil','Male',25,35000,'Pune','2023-01-15',101,NULL,'rahul@gmail.com','9876543210'),

(2,'Sneha','Kulkarni','Female',27,45000,'Mumbai','2022-05-20',102,1,'sneha@gmail.com','9876543211'),

(3,'Amit','Sharma','Male',30,65000,'Pune','2021-03-18',101,1,'amit@gmail.com','9876543212'),

(4,'Priya','Patil','Female',24,38000,'Nagpur','2024-02-10',104,3,'priya@gmail.com','9876543213'),

(5,'Rohit','Jadhav','Male',32,72000,'Pune','2020-07-11',103,3,'rohit@gmail.com','9876543214'),

(6,'Neha','Pawar','Female',29,52000,'Nashik','2022-08-22',105,5,'neha@gmail.com','9876543215'),

(7,'Sagar','Patil','Male',31,58000,'Pune','2021-11-01',101,3,'sagar@gmail.com','9876543216'),

(8,'Pooja','Deshmukh','Female',26,41000,'Mumbai','2023-04-09',102,2,'pooja@gmail.com','9876543217'),

(9,'Kiran','More','Male',28,47000,'Nagpur','2022-06-15',104,4,'kiran@gmail.com','9876543218'),

(10,'Anjali','Shinde','Female',27,50000,'Pune','2023-09-05',105,6,'anjali@gmail.com','9876543219'),

(11,'Vikas','Pawar','Male',35,90000,'Mumbai','2019-10-10',101,NULL,'vikas@gmail.com','9876543220'),

(12,'Meena','Joshi','Female',33,82000,'Pune','2018-01-21',103,11,'meena@gmail.com','9876543221'),

(13,'Akash','Patil','Male',24,34000,'Nashik','2024-01-05',104,4,'akash@gmail.com','9876543222'),

(14,'Komal','Kale','Female',29,61000,'Pune','2021-12-12',105,6,'komal@gmail.com','9876543223'),

(15,'Nitin','Shinde','Male',30,56000,'Mumbai','2022-03-03',102,2,'nitin@gmail.com','9876543224');
 
-- Display all employee details--
select *from Employee;

-- Display employee name and salary--
select First_Name,Last_Name,Salary from Employee;

-- Display employee ID and department--
alter table Department rename column demartment_name to Department_name;
select employee_id from employee;
select  Department_name from department;

-- Display distinct departments --
select distinct department_name from department;

-- Display distinct cities--
select distinct city from employee;

-- Display employee names in uppercase--
select First_name,Last_name ,ucase(First_name) as First_name_uppercase,
ucase(last_name) as Last_name_uppercase from Employee;

-- Display employee names in lowercase--
select First_name,Last_name ,lcase(First_name) as F_lcase,
lcase(Last_name) as l_lcase from employee;

-- Display full name using CONCAT()--
select First_name,Last_name, concat(First_name,Last_name) as Fullname from employee;

-- Display annual salary--
select employee_id,First_name,Salary,Salary*12 as AnnualSalary from employee;

-- Display employee names with aliases--
select First_name,First_name as Fname, last_name,last_name  as l_name from employee;

-- Display employees hired after 2022--
select *from employee where hire_date>'2022-03-03';

-- Display salary rounded to nearest integer--
select salary,round(salary) as roundoff from employee;
 
 -- Display employee name length--
 select First_name,Last_name,length(First_name) as f_length,length(Last_name) as l_length from employee;
 
 -- Display all employees sorted alphabetically--
 select* from employee order by First_name,Last_name;
 
 -- Display today's date--
 select curdate() as Todays_date from dual;
 
 -- Display current time--
 select curtime() as ascurrent_time from dual;
 
 -- Display current database--
 select database() as Currentdatabase from dual;
 
 -- Display first five records--
 select* from Employee limit 5;
 
 -- Display last five records--
 select * from Employee order by Employee_Id desc limit 5;