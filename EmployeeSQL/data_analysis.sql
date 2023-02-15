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

-- List each employee in the Sales department, 
-- including their employee number, last name, and first name.
select
	concat(first_name,' ',last_name) as Employee,
	emp_no,
	last_name,
	first_name
from employees
where emp_no in
(
	select emp_no
	from dept_emp
	where dept_no in 
	(
		select dept_no
		from departments
		where dept_name = 'Sales'
	)
)
order by emp_no;

-- List each employee in the Sales and Development departments, 
-- including their employee number, last name, first name, and department name
Select concat(e.first_name,' ',e.last_name) as Employee, e.emp_no, e.last_name, e.first_name, d.dept_name
from employees e
left join dept_emp de
on e.emp_no = de.emp_no
left join departments d
on de.dept_no = d.dept_no
where d.dept_name in ('Sales', 'Development');

-- List the frequency counts, in descending order, of all the employee last names 
-- (that is, how many employees share each last name).
select last_name, count(last_name) As name_count
from employees
group by last_name
order by name_count desc;

