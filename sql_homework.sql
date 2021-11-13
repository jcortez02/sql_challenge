------ Schema (base)

CREATE TABLE departments
(dept_no VARCHAR,
dept_name VARCHAR
);

CREATE TABLE dept_emp
(emp_no INT,
dept_no VARCHAR
);

CREATE TABLE dept_manager
(dept_no VARCHAR,
emp_no INT
);

CREATE TABLE employees
(emp_no INT,
emp_title VARCHAR,
birth_date DATE,
first_name VARCHAR,
last_name VARCHAR,
sex VARCHAR,
hire_date DATE
);

CREATE TABLE salaries
(emp_no INT,
salary INT
);

CREATE TABLE titles
(title_id VARCHAR,
title VARCHAR
);


----- Data Analysis

SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees JOIN salaries on employees.emp_no = salaries.emp_no;

SELECT * FROM employees;
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date >= '1986-01-01' AND hire_date <= '1986-12-31';

SELECT departments.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name
FROM departments
JOIN dept_manager ON departments.dept_no = dept_manager.dept_no
JOIN employees ON dept_manager.emp_no = employees.emp_no;

SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
JOIN employees ON dept_emp.emp_no = employees.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no;

SELECT first_name, last_name, sex
FROM employees
WHERE
first_name = 'Hercules'
AND last_name LIKE 'B%';

SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
JOIN employees ON dept_emp.emp_no = employees.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales';

SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
JOIN employees ON dept_emp.emp_no = employees.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE
departments.dept_name = 'Sales'
OR departments.dept_name = 'Development';

SELECT last_name, COUNT (last_name) AS “frequency”
FROM employees
GROUP BY last_name
ORDER BY “frequency” DESC;

