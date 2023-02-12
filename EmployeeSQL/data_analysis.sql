--	List the employee number, last name, first name, sex, and salary of each employee
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

-- List the first name, last name, and hire date for the employees who were hired in 1986
select
    first_name,
    last_name,
    hire_date
from
    employees
where
    date_part('year', hire_date) = 1986;

-- List the manager of each department along with their department number, 
-- department name, employee number, last name, and first name
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

-- List the department number for each employee along with that 
-- employee’s employee number, last name, first name, and department name
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

-- List first name, last name, and sex of each employee 
-- whose first name is Hercules and whose last name begins with the letter B.
select
    first_name,
    last_name,
    sex
from employees
where 
    first_name = 'Hercules' and
    last_name like 'B%';