-- Joining employees and titles tables
--Create new table retirement_titles
DROP TABLE retirement_titles
SELECT employees.emp_no,
    employees.first_name,
	employees.last_name,
    titles.title,
	titles.from_date,
	titles.to_date
INTO retirement_titles
FROM employees
LEFT JOIN titles
ON employees.emp_no = titles.emp_no
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no
;

SELECT * FROM retirement_titles


-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (r.emp_no) r.emp_no,
r.first_name,
r.last_name,
r.title
INTO unique_titles
FROM retirement_titles as r
WHERE (r.to_date = '9999-01-01')
ORDER BY emp_no, to_date DESC
;

SELECT * FROM unique_titles


-- Employee count by department number
SELECT COUNT(ut.title), ut.title
INTO retiring_titles
FROM unique_titles as ut
GROUP BY ut.title
ORDER BY count DESC
;
SELECT * FROM 

-- Create Mentorship Eligibility table
SELECT DISTINCT ON (emp.emp_no) emp.emp_no,
emp.first_name,
emp.last_name,
emp.birth_date,
dept_emp.from_date,
dept_emp.to_date,
titles.title
INTO mentorship_eligibility
FROM employees as emp
JOIN dept_emp
ON emp.emp_no = dept_emp.emp_no
JOIN titles
ON emp.emp_no = titles.emp_no
WHERE (dept_emp.to_date = '9999-01-01') AND (birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY emp_no
;

SELECT * FROM mentorship_eligibility