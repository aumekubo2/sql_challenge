--steps
-- 1 create the tables
-- 2 import data via import
-- 3 create the PK id serial for each table
-- 4 rename the columns using AS attribute to make it easier to call 

--Step 1 - create the tables

--table 1 --note will add primary key using postgres
CREATE TABLE department (
	dept_no varchar (4) NOT NULL,
	dept_name varchar NOT null
);

--table 2
drop table department_employee

CREATE TABLE department_employee (
	emp_no int,
	dept_no varchar (4) NOT NULL
);

--table 3
CREATE TABLE department_manager (
	dept_no varchar (4) NOT NULL,
	emp_no int
);

--table 4
CREATE TABLE employees (
	emp_no int NOT null,
	emp_title_id varchar (5) NOT NULL,
	birth_date date NOT NULL,
	first_name varchar NOT NULL,
	last_name varchar NOT NULL,
	sex char,
	hire_date date NOT NULL
);

--table 5	
CREATE TABLE salaries (
	emp_no int,
	salary int 
	);

--table 6	
CREATE TABLE titles (
	title_id varchar (5) NOT NULL,
	title varchar NOT NULL
	);
	
	
-- 2 import data via import -->sql_challenge(database)-->schemas-->tables-->table name-->right click import
----validate import
select *
from department;

select *
from department_employee;

select *
from department_manager;

select *
from employees;

select *
from salaries;

select *
from titles;

-- 3 create the PK id serial for each table

ALTER TABLE department
ADD COLUMN id serial PRIMARY KEY;

ALTER TABLE department_employee
ADD COLUMN id serial PRIMARY KEY;

ALTER TABLE department_manager
ADD COLUMN id serial PRIMARY KEY;

ALTER TABLE employees
ADD COLUMN id serial PRIMARY KEY;

ALTER TABLE salaries
ADD COLUMN id serial PRIMARY KEY;

ALTER TABLE titles
ADD COLUMN id serial PRIMARY KEY;

-- 4 rename the columns using AS attribute to make it easier to call 
