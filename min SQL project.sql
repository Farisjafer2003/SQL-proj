create database office;

use office;

create table departments(
	department_id int primary key,
    department_name varchar(100)
);
insert into departments values 
(1, "IT"),
(2, "HR"),
(3, "Finance"),
(4, "Marketing");

create table employees(
	emp_id int auto_increment primary key not null,
    Name varchar(100) not null,
    email varchar(100) not null,
    salary int not null,
    department_id int
);
insert into employees (name,email,salary,department_id) values
("Raj","raj@gmail.com",50000,2),
("Sam", "sam@gmail.com", 12000,3),
("Alice", "alice@gmail.com",55000,1),
("Bob", "bob@gmail.com", 10000,4),
("Sameer","sameer@gmail.com",13000,4),
("Jhon","john@gmail.com",55000,1),
("Sara","sara@gmail.com",60000,2),
("Tonny","tonny'gmail.com",100000,1),
("Stive","stive@gmail.com",50000,2),
("Siraj","siraj@gmail.com",70000,1),
("Sajjad","sajjad'gmail.com", 55500,3),
("Roger","roger@gmail.com",75000,4),
("Peter","Peter@gmail.com",45000,4),
("Wanda","wanda@gmail.com",13000,3),
("Garp","garp@gamil.com",70000,2),
("Loki","loki@gmail.com",60000,4),
("Rohan","rohan@gmail.com",55000,2),
("Kalam","kalam@gmail.com",33500,4),
("Taysir","taysir@gmail.com",7000,3),
("Arshed", "arshed@gmail.com",9000,4),
("Paul","paul@gmail.com",14000,3),
("Zaid","zaid'gmail.com",55000,4),
("Faris","Faris@gmail.com",10000,1),
("Nifer","nifer@gmail.com",40000,3),
("Yaseen","yaseen@gmail.com",98000,2);

select *from employees;

select *from departments;

#Q.to find the highest salary
select MAX(salary)from employees;

#Q. to filter all the employees in IT department
select * from employees
where department_id=1;

#Q. show only name and email from employees
select Name , email from employees;

#Q. insert a new employee in the employees table
insert into employees (name,email,salary,department_id) values("David","david@gmail.com",62000,3);

#Q. update the salary of a employee
update employees
set salary = 60000
where emp_id = 6;

#Q. removde the record of the employee 
delete from employees
where emp_id=5;

#Q. show employee name and department for all employee (using inner join)
select employees.Name,departments.department_name
 from employees
 inner join departments
on employees.department_id = departments.department_id;

#Q. list all departments and employees (using left join)
select departments.department_name, employees.Name
from departments
left join employees
on departments.department_id = employees.department_id;
insert into employees(Name,email, salary) value("Parker", "parker@gmail.com",300);
insert into departments values (5,"Broker");

#Q. show only departments that have no employee
SELECT departments.department_name
FROM departments 
LEFT JOIN employees  
ON departments.department_id = employees.department_id
WHERE employees.emp_id IS NULL;

#Q. fin the total number of employee in each department
SELECT dmployees.department_name, COUNT(employees.emp_id) AS total_employees
FROM departments 
LEFT JOIN employees  
ON departments.department_id = employees.department_id
GROUP BY departments.department_name;

#Q. get the average salary of each department
SELECT departments.department_name, AVG(employees.salary) AS avg_salary
FROM departments 
LEFT JOIN employees  
ON departments.department_id = employees.department_id
GROUP BY departments.department_name;

#Q. show the department with the maximum number of employees
SELECT departments.department_name, COUNT(employees.emp_id) AS total_employees
FROM departments 
LEFT JOIN employees  
ON departments.department_id = employees.department_id
GROUP BY departments.department_name
ORDER BY total_employees DESC
LIMIT 1;

#Q. get all the employees whose salary is above the average salary
SELECT * 
FROM employees
WHERE salary > (
    SELECT AVG(salary) FROM employees
);

#Q. find the depart name of the employee with emp_id = 10
SELECT departments.department_name
FROM employees 
INNER JOIN departments  
ON employees.department_id = departments.department_id
WHERE employees.emp_id = 10;

#Q. show employee nameand a colum "Salary Level" as "High" if salary is grater then 50000, otherwise "Low"
select Name , email,
		CASE
			when salary > 50000 then "high"
            else "Low"
         end as salary
from 
			employees;
