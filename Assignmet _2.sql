use Sql_batch;
-- Employee table--
create table Employee(employee_id int primary key, first_name varchar(20),last_name varchar(20), salary decimal, joining_date datetime, department varchar(15));
desc Employee;
show tables;
insert into Employee values(1,'Johan','Abraham',1000000,'2013-01-01 12:00:00', 'Banking');
insert into Employee values(2 ,'Michael','Clark',800000,'2013-01-01 12:00:00', 'Insurance');  
insert into Employee values(3 ,'Roy','Thomas',700000,'2013-02-01 12:00:00', 'Banking');  
insert into Employee values(4 ,'Tom','Joes',600000,'2013-02-01 12:00:00', 'Insurance');  
insert into Employee values(5 ,'Jerry','Pinto',650000,'2013-02-01 12:00:00', 'Insurance');  
insert into Employee values(6 ,'Philip','Mathew',750000,'2013-01-01 12:00:00', 'Services');  
insert into Employee values(7 ,'TestName','123',650000,'2013-01-01 12:00:00', 'Services');  
insert into Employee values(8 ,'TestName2','Lname%',600000,'2013-02-01 12:00:00', 'Insurance');  

select *from Employee;

-- Incentive table -- 
create table Incentives(Employee_ref_id int, Incentive_date date, Incentive_amount decimal, 
foreign key(Employee_ref_id) references Employee(employee_id), primary key(Incentive_amount));

show tables;
insert into Incentives values(1,'2013-02-01',5000);
insert into Incentives values(2,'2013-02-01',3000);
insert into Incentives values(3,'2013-02-01',4000);
insert into Incentives values(4,'2013-01-01',4500);
insert into Incentives values(5,'2013-01-01',3500);

select * from Incentives;

-- write sql to drop freign key on employee table--
alter table Incentives drop Employee_ref_id; -- erreor-- 
Show create table Incentives;
alter table Incentives drop foreign key incentives_ibfk_1;

-------------------------------------------------------------------------------------------------------------
-- Topic Select --
-- 1 get all the details from employee table--
select * from Employee;

-- 2 get first name and last name  from employee table--
select first_name, last_name from employee;

-- 3 get first name from empployee table in upper case--
select upper(first_name) from Employee;

----------------------------------------------------------------------------------------------------------------------------
-- topic order by--
-- get unique department from employee table--
select distinct department from Employee;

--  get all details from employee table order by first name asendig --
select * from Employee order by first_name asc;

-- get all details from employee table order by first name asendig and salary desending--
select * from Employee order by first_name asc , salary desc;

----------------------------------------------------------------------------------------------------------------------------------
-- group by query--
-- get department, total salary with respect to a department from employee table--
select department, sum(salary) as total_salary from employee group by department;

-- get department, total salary with respect to a department from employee table and sort salry in desc-
select department, sum(salary) as total_salary from employee group by department order by total_salary desc;

-- get department,no of employee, total salary with respect to a department from employee table and sort salry in desc--
select department,count(employee_id) as total_employee,sum(salary) as total_salary
 from employee group by department order by total_salary desc;
 
 -- get department wise avrage salary from employee table order by salary asending--
 select department, avg(salary) as avarage_salary from employee group by department order by avarage_salary;
 
 -- get department wise maximum salary from employee table order by salary asending--
 select department,max(salary) as maximum_salary from employee group by department order by maximum_salary;
 
 -- select no of employees join with respect to year and month from employee table--
 select count(employee_id) as no_of_employee, extract(year from joining_date) as year , extract(month from joining_date) as month 
 from employee group by extract(year from joining_date) , extract(month from joining_date);
 
 -- get department, total salary with respect to a department from employee table--
 -- where salary grether than 800000 and sort salry in desc--
 select department, sum(salary) as total_salary from employee group by department 
 having sum(salary)>800000 order by total_salary desc;


----------------------------------------------------------------------------------------------------------------
-- sql where condition--
-- get employee details from employee tables whose employe ename is johan--
select *from Employee where first_name='johan';

-- get employee details from employee tables whose employee name are johan and roy--
select *from Employee where first_name in('Johan','Roy');

-- get employee details from employee tables whose employee name are not johan and roy--
select *from Employee where first_name not in('Johan','Roy');

----------------------------------------------------------------------------------------------------------
-- sql wild card search--
-- get employee details from employee table whose first name starts with j --
select * from Employee where First_name like('j%');

-- get employee details from employee table whose first name contains o--
select * from Employee where First_name like('%O%');

-- get employee details from employee table whose first name ends with n 
select * from Employee where First_name like('%n');


---------------------------------------------------------------------------------------------------------------------------
-- sql Pattern mathing--
-- get employee details from employee table whose first name ends with n and and name conatins 4 letter--
select * from Employee where First_name like ('___n') ;

-- get employee details from employee table whose first name starts with j and and name conatins 4 letter--
select * from Employee where First_name like ('J___') ;

-- get employee details from employee table whose salary grether than 600000--
select * from Employee where Salary>600000;

-- get employee details from employee table whose salary less than 800000--
select * from Employee where Salary<800000;

-- get employee details from employee table whose salary between 500000 and 800000--
select * from Employee where Salary between 500000 and 600000;

-- get employee details from employee tables whose employee name are johan and Michael--
select * from Employee where first_name in('Johan','Michael');

--------------------------------------------------------------------------------------------------------
-- Date function--
-- get employee details from employee table whose joining year is 2013--
select * from employee where extract(year from joining_date)=2013;

-- get employee details from employee table whose joining month is january--
select * from employee where extract(month from joining_date)=1;

-- get employee details from employee table who joining after January 31st--
 select * from employee where extract(month from joining_date)>01;
  
 -- get database date--
 select curdate();
 
 -- get employee ids from employee table who didnt receive incentives without using sub query?(minus)--
 select employee_ref_id from incentives where incentive_amount is null;
 
 -- delete data from employee table who got incentives in incentive table--
 select *from employee;
 select *from incentives;
 delete from  incentives where employee_ref_id in(1,2,3,4,5);
 delete from employee where employee_id in(1,2,3,4,5);
 
 -- update incentive table where employeee name is john--
 update employee set first_name='Tick' where employee_id=1;

 ----------------------------------------------------------------------------------------------------------------------------------------------------
 -- join--
 -- select first name,incentive amount from employee and insentive table for those employee who have incentive
 
 select * from employee;
 select * from incentives;
 select employee_id,first_name,last_name,incentive_amount
 from employee e inner join incentives s 
 on e.employee_id=s.employee_ref_id;
 
 -- select first name,incentive amount from employee and insentive table for those employee who have incentive
 -- and incentive amount greater than 3000
 select first_name,incentive_amount
 from employee e inner join incentives s 
 on e.employee_id=s.employee_ref_id
 where incentive_amount>3000;
 
 -- select first name,incentive amount from employee and insentive table for all the employee even if didnt get incentives
 select first_name,incentive_amount
 from employee e left join incentives s 
 on e.employee_id=s.employee_ref_id;
 
-- select first name,incentive amount from employee and insentive table for all the employee who got incentive using left join
select first_name,incentive_amount
 from employee e left join incentives s 
 on e.employee_id=s.employee_ref_id
 where incentive_amount is not null;
 
 ----------------------------------------------------------------------------------
 -- topic union
 
 -- select first name and last name from employee as seprate row
 select first_name from employee union select last_name  from employee;
 
 ---------------------------------------------------------------------------
 -- topic view
 -- create view for employee which display emp id and name
 create or replace view view_v1 as
 select employee_id,first_name,last_name,salary from employee;
 
 select * from view_v1;
 
 -- update view to add salary column to view
 -- note that we can not update view we can just modify it by using dml commands
 
 -- drop view
 drop view view_v1;
 
 --------------------------------------------------------------------
 -- index
 -- create index on table emploee
 create index l1 on employee(employee_id);
 
 -- create forced index on new table which is not exist in database
 create table newtable(name varchar(10),salary decimal(10,2));
 
 create index index_sal on newtable(salary);
 select * from newTable force index(index_sal) where salary>5000;