-- SELECT * FROM "Departments"
-- SELECT * FROM "Dept_Employee"
-- SELECT * FROM "Employees"
-- SELECT * FROM "Managers"
-- SELECT * FROM "Salaries"
-- SELECT * FROM "Titles"


--List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM "Employees" AS e
INNER JOIN "Salaries" AS s
ON e.emp_no = s.emp_no;

--List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM "Employees"
WHERE hire_date BETWEEN '01/01/1986' AND '12/31/1986';

--List the manager of each department with the following information: 
--department number, department name, the manager's employee number, last name, first name.
SELECT m.dept_no, d.dept_name, m.emp_no, e.last_name, e.first_name
FROM "Managers" AS m
INNER JOIN "Departments" AS d
ON m.dept_no = d.dept_no
INNER JOIN "Employees" AS e
ON m.emp_no = e.emp_no;

--List the department of each employee with the following information:
--employee number, last name, first name, and department name.
SELECT de.emp_no, e.last_name, e.first_name, d.dept_name
FROM "Dept_Employee" AS de
INNER JOIN "Departments" AS d
ON de.dept_no = d.dept_no
INNER JOIN "Employees" AS e
ON de.emp_no = e.emp_no;


--List first name, last name, and sex for employees whose first name is:
--"Hercules" and last names begin with "B."
SELECT first_name, last_name, sex
FROM "Employees"
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

--List all employees in the Sales department, include:
--employee number, last name, first name, and department name.
SELECT de.emp_no, e.last_name, e.first_name, d.dept_name
FROM "Dept_Employee" AS de
INNER JOIN "Employees" AS e
ON de.emp_no = e.emp_no
INNER JOIN "Departments" AS d
ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales';

--List all employees in the Sales and Development departments, include:
--employee number, last name, first name, and department name.
SELECT de.emp_no, e.last_name, e.first_name, d.dept_name
FROM "Dept_Employee" AS de
INNER JOIN "Employees" AS e
ON de.emp_no = e.emp_no
INNER JOIN "Departments" AS d
ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development';

--In descending order, list the frequency count of employee last names
--i.e., how many employees share each last name.

SELECT COUNT(last_name), last_name
FROM "Employees"
GROUP BY last_name
ORDER BY count DESC;


