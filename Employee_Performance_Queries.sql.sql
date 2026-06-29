
"-- ================================
-- Employee Performance SQL Questions
-- ================================



" Q1. How many employees are there in each department?"
SELECT
    department,
    COUNT(*) AS total_employees
FROM employee_performance
GROUP BY department
ORDER BY total_employees DESC;

"Q2. What is the average monthly salary of employees in each department?"
SELECT
    department,
    AVG(monthly_salary) AS average_salary
FROM employee_performance
GROUP BY department
ORDER BY average_salary DESC;
"Q3. How many employees belong to each gender?"
SELECT
    gender,
    COUNT(*) AS total_employees
FROM employee_performance
GROUP BY gender
ORDER BY total_employees DESC;

" Q4. Which are the top 10 highest-paid employees?"
SELECT
    employee_id,
    department,
    job_title,
    monthly_salary
FROM employee_performance
ORDER BY monthly_salary DESC
LIMIT 10;

" Q5. What is the average employee satisfaction score in each department?"

SELECT
    department,
    AVG(employee_satisfaction_score) AS average_satisfaction
FROM employee_performance
GROUP BY department
ORDER BY average_satisfaction DESC;

-- ================================
-- Advanced SQL Questions
-- ================================


"Q6. Which departments have an average performance score greater than 3?"
SELECT
    department,
    AVG(performance_score) AS average_performance
FROM employee_performance
GROUP BY department
HAVING AVG(performance_score) > 3
ORDER BY average_performance DESC;

"Q7. Compare the average monthly salary of employees who resigned and those who are still working."
SELECT
    resigned,
    AVG(monthly_salary) AS average_salary
FROM employee_performance
GROUP BY resigned;


"Q8. Which job titles have the highest average employee satisfaction score? (Top 5)"


SELECT
    job_title,
    AVG(employee_satisfaction_score) AS average_satisfaction
FROM employee_performance
GROUP BY job_title
ORDER BY average_satisfaction DESC
LIMIT 5;

" "Q9. Find the top 5 employees who handled the highest number of projects while working more than 10 overtime hours per week.
"
SELECT
    employee_id,
    department,
    job_title,
    projects_handled,
    overtime_hours
FROM employee_performance
WHERE overtime_hours > 10
ORDER BY projects_handled DESC
LIMIT 5;
" Q10. Rank all departments based on their average monthly salary from highest to lowest."

SELECT
    department,
    AVG(monthly_salary) AS average_salary,
    RANK() OVER (ORDER BY AVG(monthly_salary) DESC) AS salary_rank
FROM employee_performance
GROUP BY department;
