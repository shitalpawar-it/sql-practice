-- Assignment on Constraints
-- Create following tables and applyappropriate constraint for the same and add 5 records in tables.
-- 1)Employees(empid(Primary key),name (not null),phone, city,email(unique,not null)

-- 2)Products(order_id(primary key),order_date(notnull),amount(>0),qty(>0),cid(foreign key),status(Pending or Completed)

-- 3)Colleges(clg_id(Primary key),name(not null),email(not null,unique),city,contact (unique)

-- 4)Student(sid(primary key),sname(not null),email(unique,notnull),contact,city,clg_id(foreign key)

-- 5)Result(rid(primarykey),rdate(not null),grade(A,B,C,F),per(>0 and <100),sid(foreignkey),semester

show databases;
use sql_batch;
show tables;

-- 1)Employees(empid(Primary key),name (not null),phone, city,email(unique,not null)

create table employees(empid int primary key auto_increment, name varchar(40) not null,phone int,city varchar(40),email varchar(30) unique not null);
insert into employees values(1,'shital',2345678901,'pune','shital@gmail.com'); 
insert into employees values(2,'vibhawari',4567879898,'pune','ABC@gmail.com'); 
insert into employees values(3,'Shruti',7655678901,'pune','xyz@gmail.com'); 
insert into employees values(4,'Sunita',5467785431,'mumbai','pqr@gmail.com'); 
insert into employees values(5,'Kaira',234568761,'Hydrabad','mno@gmail.com'); 
select * from employees; 

-- 2)Products(order_id(primary key),order_date(notnull),amount(>0),qty(>0),cid(foreign key),status(Pending or Completed)

create table producat(order_id int primary key,order_date int not null,amount decimal,cid int,quntity decimal,status varchar(40),
constraint amt check(amount>0), constraint quy check(quntity>0),constraint sts check(status in('pending','complete')),
foreign key(cid) references employees(empid));

alter table producat modify order_date date not null;
insert into producat values(1,'2026-7-4',25000,1,2,'pending');
insert into producat values(2,'2026-4-24',3500,1,1,'complete');
insert into producat values(3,'2025-3-16',4000.50,3,2,'pending');
insert into producat values(4,'2026-4-18',7500,1,4,'complete');
insert into producat values(5,'2026-2-23',8000,1,4,'pending');
select * from producat;

-- -- 3)Colleges(clg_id(Primary key),name(not null),email(not null,unique),city,contact (unique)
create table colleges(clg_id int primary key,name varchar(40) not null,email varchar(40)not null unique,city varchar(40),contact varchar(12) unique);
insert into colleges values(101,'geeta Bhagvat','geeta@gmail.com','Latur','91 234567891');
insert into colleges values(102,'seeta Ramdev','seeta@gmail.com','Mumbai','91 298763891');
insert into colleges values(103,'Neeta Chavhan','neeta@gmail.com','kolapur','91 654789239');
insert into colleges values(104,'Getha Rathod','getha@gmail.com','Nanded','91 675857883');
insert into colleges values(105,'Nikita rathod','nikita@gmail.com','Pune','91 721888775');
select * from colleges;

-- -- 4)Student(sid(primary key),sname(not null),email(unique,notnull),contact,city,clg_id(foreign key)
create table student(sid int primary key,sname varchar(40)not null,emil varchar(40)unique not null,
contact int,city varchar(30),clg_id int,foreign key(clg_id) references colleges(clg_id));
alter table student modify contact varchar(20);
insert into student values(201,'Pragati','pragati@gmail.com',1234567890,'Pune',101);
insert into student values(202,'Sonam','Sonam@gmail.com',0987654321,'Pune',102);
insert into student values(203,'Rohit','rohit@gmail.com',3456748931,'Delhi',102);
insert into student values(204,'Natasha','Natasha@gmail.com',2345677801,'chanai',103);
insert into student values(205,'Sandeep','Sandeep@gmail.com',4567879123,'kasarsa',105);
select * from student;

-- 5)Result(rid(primarykey),rdate(not null),grade(A,B,C,F),per(>0 and <100),sid(foreignkey),semester
create table result(rid int primary key,rdate date not null,grade char(10) ,
constraint chk check(grade in('A','B','C','D')),pers decimal, constraint per check(pers>0 and pers<100),
sid int, foreign key(sid) references student(sid));
alter table result add semester varchar(30) after sid;
insert into result values(1,'2024-7-10','A',97,201,7);
insert into result values(2,'2024-7-10','B',88,202,7);
insert into result values(3,'2024-7-10','A',90,203,7);
insert into result values(4,'2024-7-10','C',67,204,7);
insert into result values(5,'2024-7-10','B',87,205,7);
select * from result;
-----------------------------------------------------------------------------------------------------------------
-- joins--
-- Assignment 1 on join
-- Consider the following tables representing a library system:

-- 1. Book(book_id,title,author_id,genre)

CREATE TABLE Book(book_id INT PRIMARY KEY,title VARCHAR(100),author_id INT,genre VARCHAR(30),
FOREIGN KEY(author_id) REFERENCES Author(author_id));

INSERT INTO Book VALUES(1,'Harry Potter',101,'Fantasy'),(2,'1984',102,'Fiction'),(3,'The Alchemist',103,'Novel'),
(4,'Five Point Someone',104,'Education'),(5,'Malgudi Days',105,'Short Stories');

select * from book;


-- 2. Author(author_id,first_name,last_name)

CREATE TABLE Author( author_id INT PRIMARY KEY, first_name VARCHAR(30),last_name VARCHAR(30));

INSERT INTO Author VALUES(101,'J.K.','Rowling'),(102,'George','Orwell'),(103,'Paulo','Coelho'),
(104,'Chetan','Bhagat'),(105,'R.K.','Narayan');

select * from author;

-- 3.Members(member_id,first_name,last_name,membership_type)

CREATE TABLE Members(member_id INT PRIMARY KEY,first_name VARCHAR(30),last_name VARCHAR(30),membership_type VARCHAR(20));

INSERT INTO Members VALUES(206,'Amit','Sharma','Gold'),(207,'Priya','Patil','Silver'),(208,'Rahul','Verma','Gold'),
(209,'Sneha','Joshi','Silver'),(210,'Karan','Patel','Gold');

select * from members;

-- 4.Loan(loan_id,book_id,member_id,loan_date,return_date)

CREATE TABLE Loan(loan_id INT PRIMARY KEY,book_id INT,member_id INT,loan_date DATE,return_date DATE);
INSERT INTO Loan VALUES(301,1,201,'2026-07-01','2026-07-10'),(302,2,202,'2026-07-03','2026-07-12'),
(303,3,203,'2026-07-05',NULL),(304,4,204,'2026-07-08','2026-07-18'),(305,5,205,'2026-07-10',NULL);

select * from loan;

-- Retrieve a list of book titles,authors’ names, and genres for books that have been loaned out.
select title,first_name,last_name,genre
from book b inner join author a 
on b.author_id=a.author_id;

--  Retrieve all books and their authors, but only show books that have been loaned to members.

select title,first_name,last_name,loan_id
from book b join author a 
on b.author_id=a.author_id 
join loan l 
on b.book_id=l.Book_id;

-- List members and the books they have borrowed, only including those who have actually borrowed books
select m.first_name,m.last_name,b.title
from members m join loan l 
on m.member_id=l.member_id
join book b
on b.book_id=l.book_id;


-- List the titles of books and the authors of books that have been returned (have a return_date).
select b.title,a.first_name,a.last_name,l.return_date
from book b join author a 
on b.author_id=a.author_id
join loan l
on l.book_id=b.book_id where l.return_date is not null;

-- List the authors and books that are being currently borrowed (books with no return_date).
select a.first_name,a.last_name,b.title,l.return_date
from author a join book b
on a.author_id=b.author_id
join loan l 
on l.book_id=b.book_id where l.return_date is null;

-----------------------------------------------------------------------------------------------------------------
-- Assignment 2 on join
-- Write an SQL query to retrieve a list of employee names along with their department names.
show databases;
use sql_practice;
show tables;
select e.first_name,e.last_name,d.department_name
from employee e join department d
on e.department_id=d.department_id;

select * from employee;
select * from department;

-- Write an SQL query to find the names of employees who have been working in IT departments.
select e.first_name,e.last_name,d.department_name
from employee e join department d
on e.department_id=d.department_id where d.department_name='IT';

-- Write an SQL query to find the names of employees who work in the Sales department
-- and were hired after January 1, 2023.
select e.first_name,e.last_name,d.department_name,e.hire_date
from employee e join department d
on e.department_id=d.department_id 
where d.department_name='sales' and e.hire_date>'2023-01-01';

-- :Write an SQL query to count how many employees work in each department.
-- Return the department name and the number of employees in that department.

select count(employee_id) as no_of_emp,d.department_name
from employee e join department d
on e.department_id=d.department_id group by department_name;

-- Write an SQL query to find the highest-paid employee in each department. 
-- Include the employee name, department name, and salary.
select e.first_name,e.last_name,d.department_name,e.salary
from employee e join department d
on e.department_id=d.department_id 
where e.salary=
(select max(salary) as high_salary from employee where d.department_id=department_id);

--------------------------------------------------------------------------------------------------------
-- Assignment 3 on 
use sql_batch;

-- Retrieve a list of all members with the books they have borrowed, 
-- showing members who haven't borrowed anybooks.
select m.member_id,b.title
from members m join loan l 
on m.member_id=l.member_id
left join book b
on l.book_id=b.book_id; 

-- Retrieve a list of all books with their authors and genres, 
-- showing all books whether they are borrowed or not.

select a.first_name,a.last_name,b.genre
from book b left join author a 
on b.author_id=a.author_id;

-- List members and their books,
-- showing members who have not borrowed any books.
select m.member_id,title
from members m left join loan l
on m.member_id=l.member_id
left join book b
on b.book_id=l.book_id;

-- Retrieve a list of all books and their members, 
-- showing all books even those that are not currently borrowed
SELECT b.title,
       m.first_name,
       m.last_name
FROM Book b
LEFT JOIN Loan l
ON b.book_id = l.book_id
LEFT JOIN Members m
ON l.member_id = m.member_id;

-- List books by the same author.
select a.first_name,a.last_name,b.title
from Author a join Book b
on a.author_id = b.author_id
where a.author_id in
(select author_id from Book group by author_id
    having COUNT(book_id) > 1);
    
-- Listall books and their members, even if no one has borrowed a book
select s.title,m.first_name,m.last_name
from book s left join loan l
on s.book_id=l.book_id
left join members m
on l.member_id=m.member_id;
