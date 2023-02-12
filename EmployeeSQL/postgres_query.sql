-- create tables & import data

CREATE TABLE departments (
    dept_no varchar   NOT NULL,
    dept_name varchar   NOT NULL,
    CONSTRAINT pk_departments PRIMARY KEY (
        dept_no
     )
);

select * from departments;
---

CREATE TABLE titles (
    title_id varchar   NOT NULL,
    title varchar   NOT NULL,
    CONSTRAINT pk_titles PRIMARY KEY (
        title_id
     )
);

select * from titles;
---

CREATE TABLE employees (
    emp_no int   NOT NULL,
    emp_title_id varchar   NOT NULL,
    FOREIGN KEY (emp_title_id) REFERENCES titles(title_id),
    birth_date date  NOT NULL,
    first_name varchar   NOT NULL,
    last_name varchar   NOT NULL,
    sex varchar   NOT NULL,
    hire_date date   NOT NULL,
    CONSTRAINT pk_employees PRIMARY KEY (
        emp_no
     )
);

select * from employees;
---

CREATE TABLE dept_emp (
    emp_no int   NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    dept_no varchar   NOT NULL,
    foreign key (dept_no) references departments (dept_no),
    CONSTRAINT pk_dept_emp PRIMARY KEY (
        emp_no, dept_no
     )
);

select * from dept_emp;
---

CREATE TABLE dept_manager (
    dept_no varchar   NOT NULL,
    foreign key (dept_no) references departments (dept_no),
    emp_no int   NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    CONSTRAINT pk_dept_manager PRIMARY KEY (
        dept_no, emp_no
     )
);

select * from dept_manager;
---

CREATE TABLE salaries (
    emp_no int   NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    salary int not null,
    CONSTRAINT pk_salaries PRIMARY KEY (
        emp_no, salary
     )
);

select * from salaries;
---

--Data Analysis


-- question 1
select
    employees.emp_no,
    employees.last_name,
    employees.first_name,
    employees.sex,
    salaries.salary
from
    employees,
    salaries
where
    employees.emp_no = salaries.emp_no;

-- question 2
select
    first_name,
    last_name,
    hire_date
from
    employees
where
    date_part('year', hire_date) = 1986;

-- question 3
select
    concat(employees.first_name,' ',employees.last_name) as Manager,
    departments.dept_name,
    departments.dept_no,
    dept_manager.emp_no,
    employees.first_name,
    employees.last_name
from
    employees,
	departments,
    dept_manager
where
    departments.dept_no = dept_manager.dept_no and
    employees.emp_no = dept_manager.emp_no;

-- question 4
select
    concat(employees.first_name,' ',employees.last_name) as Employee,
    employees.emp_no,
    dept_emp.dept_no,
    departments.dept_name,
    employees.last_name,
    employees.first_name
from
    employees,
	departments,
    dept_emp
where
    departments.dept_no = dept_emp.dept_no and
    employees.emp_no = dept_emp.emp_no;
	
-- question 5
select
    first_name,
    last_name,
    sex
from employees
where 
    first_name = 'Hercules' and
    last_name like 'B%';
	
-- question 6
