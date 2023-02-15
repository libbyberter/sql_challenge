CREATE TABLE departments (
    dept_no varchar(30)   NOT NULL,
    dept_name varchar(255)   NOT NULL,
    CONSTRAINT pk_departments PRIMARY KEY (
        dept_no
     )
);

CREATE TABLE titles (
    title_id varchar(30)   NOT NULL,
    title varchar(255)   NOT NULL,
    CONSTRAINT pk_titles PRIMARY KEY (
        title_id
     )
);

CREATE TABLE employees (
    emp_no int   NOT NULL,
    emp_title_id varchar(30)   NOT NULL,
    FOREIGN KEY (emp_title_id) REFERENCES titles(title_id),
    birth_date date  NOT NULL,
    first_name varchar(255)   NOT NULL,
    last_name varchar(255)   NOT NULL,
    sex varchar(5)   NOT NULL,
    hire_date date   NOT NULL,
    CONSTRAINT pk_employees PRIMARY KEY (
        emp_no
     )
);

CREATE TABLE dept_emp (
    emp_no int   NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    dept_no varchar(30)   NOT NULL,
    foreign key (dept_no) references departments(dept_no),
    CONSTRAINT pk_dept_emp PRIMARY KEY (
        emp_no, dept_no
     )
);

CREATE TABLE dept_manager (
    dept_no varchar(30)   NOT NULL,
    foreign key (dept_no) references departments (dept_no),
    emp_no int   NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    CONSTRAINT pk_dept_manager PRIMARY KEY (
        dept_no, emp_no
     )
);

CREATE TABLE salaries (
    emp_no int   NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    salary int not null,
    CONSTRAINT pk_salaries PRIMARY KEY (
        emp_no, salary
     )
);

