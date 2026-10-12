use da65;
create table employees(Emp_id int primary key  auto_increment, Name varchar(50) not null, Age int not null, Salary float not null, Department varchar(50) not null, joinning_date date  not null);

insert into employees(Emp_id,name, age, salary, department,joinning_date)values(1, "Alice",30, 50000.00, "IT", "2021-06-15"),(2,"Bob", 25,45000.00, "HR","2022-01-20"),
(3,"Charlie",35, 60000.00,"finance","2019-07-23"),(4,"David", 28, 48000.00,"IT","2023-03-10"),(5,"Eve", 40, 75000.00,"HR","2018-09-30"),(6,"Frank",33,52000.00,"Finance",
"2020-11-05");
select * from employees;

-- Arithmetic Operators
 
-- 1.Increase salary by 10% for all employees and display the new salary.
select emp_id, name, department,salary,salary*1.10 as New_salary from employees;

-- 2.Calculate the annual salary of each employee.
select emp_id, name, department ,salary, salary*12 as annual_salary from employees;

-- 3.Find the difference between the highest and lowest salary
select max(salary)-min(salary)as salary_diff from employees;

-- 4.Show the remainder when each employee’s salary is divided by 7000.
select emp_id,name, department ,salary%7000 as reminder from employees;

-- 5.Deduct a tax of 5% from each employee’s salary and display the remaining amount
select emp_id,name, department,salary,salary-(salary*0.005)as remainning_amount from employees;

-- 6.Find the total salary expenditure of the company.
select sum(salary)as total_salary from employees;

-- Relational Operators 

-- 1fnd employees who earn more than 50,000.
select * from employees where salary>50000;

-- 2.List employees who joined on or after January 1, 2020.
select name from employees where joinning_date < "2020-01-01";

-- 3.Retrieve employees whose age is less than 30.
select * from employees where age<30;

-- 4.Find employees who do not belong to the IT department.
select * from employees where department<>"it";

-- 5.Show employees whose salary is equal to 45,000.
select * from employees where salary=45000;

-- 6.Find employees who are 35 years old or older.
select * from employees where age<=35;

-- Logical Operators 

-- 1.Find employees who are older than 30 AND earn more than 50,000.
select * from employees where age>30 and salary> 50000;

-- 2.List employees who are in either the HR OR IT department
select * from employees where department = "hr"or department= "it";

-- 3.Find employees who joined after 2020 AND have a salary above 45,000.
select * from employees where joinning_date>"2020-01-01" and salary>45000;

-- 4.Show employees who are NOT from the Finance department.
select * from employees where department <> "finance";

-- 5.Find employees who are older than 25 BUT earn less than 60,000.
select * from employees where age>25 and salary<60000;

-- 6.Retrieve employees whose age is below 30 OR salary is above 70,000.
select * from employees where age<30 or salary>70000;


-- Special Operator: IN/ Not IN

-- 1.Find employees who work in the IT or Finance department
select name, department from employees where department in("it" , "finance");

-- 2.Retrieve employees whose salary is either 45,000, 50,000, or 60,000.
select * from employees where salary in (45000,50000,60000);

-- 3.List employees whose age is either 25, 30, or 40
select * from employees where age in(25,30,40);

-- 4.Find employees who joined on specific dates: '2021-06-15', '2022-01-20', or '2020-11-05'.
select * from employees where joinning_date in('2021-06-15', '2022-01-20', '2020-11-05');

-- 5.Retrieve employees who belong to the HR or IT department but exclude Finance.
select * from employees where department in("hr","it");

-- 6.Find employees who do not work in IT, HR, or Finance (using NOT IN)
select * from employees where department not in("it","hr","finance");

-- Special Operator: BETWEEN

-- 1.	Find employees whose salary is between 45,000 and 60,000.
select * from employees where salary between 45000 and 60000;

-- 2.Retrieve employees whose age is between 25 and 35.
select * from employees where age between 25 and 35;

-- 3.Find employees who joined the company between '2020-01-01' and '2022-12-31'.
select * from employees where joinning_date between '2020-01-01' and '2022-12-31';

-- 4.List employees whose salary is NOT between 50,000 and 70,000
select * from employees where salary not between 50000 and 70000;

-- 5.Retrieve employees who are aged between 30 and 40 and work in the IT department.
select * from employees where age between 30 and 40 and department="it";

-- 6.Find employees who joined between '2018-01-01' and '2020-12-31' and have a salary between 50,000 and 75,000.
select * from employees where joinning_date between '2018-01-01' and '2020-12-31' and salary between 50000 and 75000;

-- Special Operator: IS NULL

-- 1.Find employees whose age is missing (NULL).
select * from employees where age is null;

-- 2.Retrieve employees who have not been assigned a department (NULL value).
select * from employees where department is null;

-- 3.Find employees whose salary information is missing (NULL).
select * from employees where salary is null;

-- 4.List employees who have not been assigned a joining date (NULL).
select * from employees where joinning_date is null;

-- 5.	Retrieve employees whose age or salary is missing (NULL values).
select * from employees where age is null or salary is null;

-- 6.Find employees who have all necessary information (no NULL values in any column).
select * from employees where emp_id is not null and name is not null and age is not null and salary is not null
and department is not null and joinning_date is not null;

-- Special Operator: LIKE

-- 1.	Find employees whose names start with 'A'.
select * from employees where name like "a%";

-- 2.Retrieve employees whose names end with 'e'.
select * from employees where name like "%a";

-- 3.Find employees whose names contain 'ar' anywhere.
select * from employees where name like "%ar%";

-- 4.List employees who work in departments starting with 'F'.
select * from employees where department like "f%";

-- 5.Find employees whose names have exactly five characters.
select * from employees where name like "_____";

-- 6.Retrieve employees whose names have 'a' as the second letter.
select * from employees where name like "_a%";


-- Special Operator: AS

-- 1.	Display employee names with the column alias "Employee Name".
select name as "Employee_name" from employees;

-- 2.Show salaries with an alias "Monthly Salary".
select salary as "Monthly_salary" from employees;

-- 3.Retrieve employees' names and departments with renamed columns "Employee" and "Dept".
select name as employee , department as dept from employees;

-- 4.Find the total salary of all employees and rename the column as "Total Salary".
select sum(salary) as total_salary from employees;

-- 5.Calculate annual salary (Salary * 12) and rename the result as "Annual Salary".
select name, salary*12 as annual_salary from employees;

-- 6.Assign an alias "E" to the Employees table and retrieve employee names using the alias.
select E.name from employees as E;

-- Special Operator: DISTINCT

-- 1.Find all unique departments in the company.
select distinct department from employees;

-- 2.	Retrieve distinct salary values.
select distinct salary from employees;

-- 3.List all unique ages of employees.
select distinct age from employees;

-- 4.Get unique joining dates of employees.
select distinct joinning_date from employees;

-- 5.Find the distinct combinations of department and salary.
select distinct department , salary from employees;

-- 6.Retrieve unique names of employees who earn more than 45,000.
select distinct name, salary from employees where salary>45000;










