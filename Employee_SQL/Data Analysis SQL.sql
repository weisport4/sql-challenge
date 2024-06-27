--List the employee number, last name, first name, sex
--and salary of each employee.
SELECT
			employee.emp_no,
			last_name, 
			first_name,
			sex,
			salary
FROM 
			employee
JOIN 	
			salary
ON			
			employee.emp_no = salary.emp_no
ORDER BY
			last_name asc,
			first_name asc
;
	
--List the first name, last name, and hire date 
--for the employees who were hired in 1986.
	
SELECT
			first_name,
			last_name, 
			hire_date
FROM 
			employee
WHERE
			hire_date > timestamp '1985-12-31 23:59:59'
AND 		hire_date < timestamp '1987-01-01 00:00:00'
ORDER BY
			hire_date asc,
			last_name asc
;

--List the manager of each department 
--along with their department number, department name, 
--employee number, last name, and first name (2 points)

SELECT
			dept_manager.dept_no,
			dept_name,
			dept_manager.emp_no,
			last_name,
			first_name
FROM 
			dept_manager
JOIN 	
			department ON dept_manager.dept_no = department.dept_no
JOIN
			employee ON dept_manager.emp_no = employee.emp_no
ORDER BY
			dept_manager.dept_no asc,
			last_name asc
;

--List the department number for each employee 
--along with that employee’s employee number, last name, first name
--and department name (2 points)

SELECT
			dept_emp.dept_no,
			employee.emp_no,
			last_name,
			first_name,
			dept_name
FROM 
			employee
JOIN 	
			dept_emp ON employee.emp_no = dept_emp.emp_no
JOIN
			department ON dept_emp.dept_no = department.dept_no
ORDER BY
			dept_emp.dept_no asc,
			last_name asc,
			first_name asc
;

--List first name, last name, and sex of each employee 
--whose first name is Hercules and whose last name begins with the letter B (2 points)

SELECT
			first_name,
			last_name, 
			sex
FROM 
			employee
WHERE
			first_name = 'Hercules'
AND 		last_name like 'B%'
ORDER BY
			last_name asc
;

--List each employee in the Sales department
--including their employee number, last name, and first name (2 points)

SELECT
			employee.emp_no,
			last_name,
			first_name
FROM 
			employee
JOIN 	
			dept_emp ON employee.emp_no = dept_emp.emp_no
JOIN
			department ON dept_emp.dept_no = department.dept_no
WHERE
			dept_name = 'Sales'
ORDER BY
			last_name asc,
			first_name asc
;

--List each employee in the Sales and Development departments
--including their employee number, last name, first name, and department name (4 points)

SELECT
			employee.emp_no,
			last_name,
			first_name,
			dept_name
FROM 
			employee
JOIN 	
			dept_emp ON employee.emp_no = dept_emp.emp_no
JOIN
			department ON dept_emp.dept_no = department.dept_no
WHERE
			dept_name = 'Sales'
OR			dept_name = 'Development'
ORDER BY
			dept_name asc,
			last_name asc,
			first_name asc
;

--List the frequency counts
--in descending order of all the employee last names (that is, how many employees share each last name) (4 points)
SELECT
	last_name,
	count(emp_no) as count_last_name
FROM
	employee
GROUP BY
	last_name
ORDER BY
	count_last_name ASC
;