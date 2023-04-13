--Data Analysis
--1.List the employee number, last name, first name, sex, and salary of each employee.

SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees AS e
LEFT JOIN salary AS s on e.emp_no = s.emp_no;

--2-List the first name, last name, and hire date for the employees who were hired in 1986.

SELECT  e.first_name, e.last_name,  e.hire_date
FROM employees AS e
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

--3-List the manager of each department along with their department number, department name, employee number, last name, and first name.

SELECT m.dept_no, m.emp_no, e.first_name, e.last_name, d.dept_name
FROM department_manager AS m
LEFT JOIN employees AS e ON m.emp_no = e.emp_no
LEFT JOIN department AS d ON m.dept_no = d.dept_no
GROUP BY m.dept_no, d.dept_name, m.emp_no, e.first_name, e.last_name;

--4-List the department number for each employee along with that employee’s employee number, last name, first name, and department name.SELECT m.dept_no, m.emp_no, e.first_name, e.last_name, d.dept_name

SELECT de.dept_no, de.emp_no, e.first_name, e.last_name, d.dept_name
FROM department_employee AS de
LEFT JOIN employees AS e ON de.emp_no = e.emp_no
LEFT JOIN department AS d ON de.dept_no = d.dept_no
GROUP BY de.dept_no, de.emp_no, e.last_name, e.first_name, d.dept_name;

--5-List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B

SELECT  e.first_name, e.last_name,  e.sex
FROM employees AS e
WHERE e.first_name = 'Hercules' and e.last_name LIKE 'B%';

--6-List each employee in the Sales department, including their employee number, last name, and first name.

SELECT m.dept_no, m.emp_no, e.last_name, e.first_name, d.dept_name
FROM department_manager AS m
LEFT JOIN employees AS e ON m.emp_no = e.emp_no
LEFT JOIN department AS d ON m.dept_no = d.dept_no
WHERE d.dept_name = 'Sales'
GROUP BY m.dept_no, d.dept_name, m.emp_no, e.first_name, e.last_name;

--7-List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT m.dept_no, m.emp_no, e.last_name, e.first_name, d.dept_name
FROM department_manager AS m
LEFT JOIN employees AS e ON m.emp_no = e.emp_no
LEFT JOIN department AS d ON m.dept_no = d.dept_no
WHERE d.dept_name in ( 'Sales',  'Development')
GROUP BY m.dept_no, d.dept_name, m.emp_no, e.first_name, e.last_name;

--8-List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).

SELECT last_name, COUNT(*) AS name_count
FROM employees
GROUP BY last_name
ORDER BY name_count DESC;








