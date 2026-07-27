use sql_practice;
show tables;
select *from employee;
select * from department;

-- Display employee name with department name--
select first_name, last_name, department_name
from employee e, department d
where e.Department_ID=d.Department_ID;

-- Display employee name, salary and department location--
select first_name, last_name, salary, department_name
from employee e, department d
where e.Department_ID=d.Department_ID;

-- find employees working in the IT department--
select Employee_ID, department_name
from employee e, department d 
where e.Department_ID=d.Department_ID and department_name='IT';

-- Find employees whose salary is greater than 60,000 along with department name--
select Employee_ID, salary ,department_name
from employee e, department d 
where e.Department_ID=d.Department_ID and salary>60000;

-- Display all employees and their department names sorted by department.
select Employee_ID,department_name
from employee e, department d 
where e.Department_ID=d.Department_ID order by Department_name;

-- Count employees in each department.
select department_name, count(employee_id) as Dep_Count
from employee e, department d 
where e.Department_ID=d.Department_ID group by department_name;

-- Display departments having more than three employees--
select department_name, count(employee_id) as total_emp
from employee e, department d 
where e.Department_ID=d.Department_ID group by department_name having count(employee_id)>3;

-- Find the highest-paid employee in each department.
select department_name, max(salary) as hight_salary
from employee e, department d 
where e.Department_ID=d.Department_ID group by department_name;

-- Display average salary department-wise--
select department_name, avg(salary) as avg_salary
from employee e inner join department d 
where e.department_id=d.Department_ID group by department_name;

-- Display all employees and their department names (Even if an employee has no department.)--
select employee_id, Department_name
from employee e left join department d 
on e.department_id=d.department_id;

INSERT INTO Employee
VALUES
(16,'John','Doe','Male',26,40000,'Pune','2024-01-01',
NULL,NULL,'john@gmail.com','9876543235');

-- Display employees who are not assigned to any department.(Hint: LEFT JOIN + NULL)
select employee_id , first_name,department_name
from employee e left join department d
on e.department_id=d.department_id
where department_name is null;

-- Display all employees and department locations--
select first_name, location 
from employee e left join department d
on e.department_id=d.department_id;

-- Display employees whose department location is NULL
select first_name ,location
from employee e left join department d
on e.department_id=d.department_id
where location is null;

-- Display all departments along with employee names.
select department_name, first_name,last_name
from employee e right join department d
on e.department_id=d.department_id; 

-- Display department names where no employee is working--
select department_name,employee_id, first_name,last_name
from employee e right join department d
on e.department_id=d.department_id
where employee_id is null;

-- Display employee name and manager name.
select e.first_name,s.manager_id
from employee e , employee s
where e.first_name=s.first_name;

-- Display employees who do not have a manager.
SELECT 
    e.First_Name AS Employee_Name,
    m.First_Name AS Manager_Name
FROM Employee e
LEFT JOIN Employee m
ON e.Manager_ID = m.Employee_ID;

-- Display all managers.(Each manager should appear only once.)
select distinct e.manager_id
from employee e left join employee s 
on e.manager_id=s.manager_id;

-- Display the number of employees working under each manager--
select e.manager_id ,count(e.employee_id) as total_employee
from employee e inner join employee s 
on e.manager_id=s.employee_id group by manager_id;

-- Display employees working under manager Amit Sharma.
select e.employee_id,s.first_name,s.last_name
from employee e left join employee s 
on e.employee_id=s.employee_id where s.first_name='Amit'and s.last_name='sharma';


