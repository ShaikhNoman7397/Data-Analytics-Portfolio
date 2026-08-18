CREATE DATABASE SQL_Assignment;
USE SQL_Assignment;

CREATE TABLE employees(
employee_id INT PRIMARY KEY ,
employee_name VARCHAR(50),
dept_id int ,
FOREIGN KEY (dept_id) REFERENCES department(dept_id),
manager_id int,
salary bigint,
city VARCHAR(50),
hire_date  date
);

 INSERT INTO employees
(employee_id, employee_name ,dept_id ,manager_id, salary, city ,hire_date)
VALUES 
 (101 ,"Alice" ,10, 201, 60000 ,"Hyderabad" ,"2022-01-15"),
(102, "Bob", 20, 202, 55000,"Bangalore" ,"2021-06-20"),
(103 ,"Charlie",10, 201, 70000," Hyderabad","2020-03-10"),
(104 ,"David", 30, 203, 50000, "Mumbai", "2023-02-18"),
(105 ,"Emma", 40, 204, 65000 ,"Delhi" ,"2022-11-05"),
(106 ,"Frank" ,NULL ,201 ,45000 ,"Hyderabad" ,"2024-01-10"),
(107 ,"Grace", 20 ,202, 58000, "Bangalore", "2023-07-12"),
(108 ,"Henry", 30 ,203 ,52000 ,"Mumbai" ,"2021-09-25"),
(109 ,"Irene", 10, 201 ,72000 ,"Hyderabad" ,"2019-05-14"),
(110 ,"Jack" ,50, NULL ,48000 ,"Chennai","2024-04-01");

select*from employees;

CREATE TABLE department(
dept_id int PRIMARY KEY , 
department_name VARCHAR(50),
 location VARCHAR(50),
 budget bigint
);
INSERT INTO department
(dept_id ,department_name, location ,budget)
VALUES
(10 ,"Data Science ","Hyderabad ",500000),
(20," HR"," Bangalore", 300000),
(30 ,"Finance"," Mumbai ",400000),
(40, "Sales ","Delhi", 450000),
(50," Marketing"," Chennai", 350000),
(60, "IT ","Pune ",600000);

CREATE TABLE projects(
project_id int PRIMARY KEY,  
project_name VARCHAR(50),
dept_id int,
FOREIGN KEY (dept_id) REFERENCES department(dept_id),
budget bigint
);
INSERT INTO projects
(project_id, project_name ,dept_id, budget)
VALUES
(1," AI Platform", 10, 250000),
(2 ,"Recruitment System ",20, 150000),
(3, "Fraud Detection", 30, 200000),
(4 ,"Sales Dashboard", 40 ,180000),
(5 ,"Marketing Campaign", 50, 120000),
(6 ,"Cloud Migration ",60, 300000);

-- Section A — Basic SQL
-- Q1. Display all employees.
SELECT * FROM employees;

-- Q2. Display only employee name and salary.
SELECT employee_name,salary FROM employees;

-- Q3. Display employees who earn more than n60,000.
SELECT employee_name,salary 
FROM employees
WHERE salary>60000;

-- Q4. Display employees who live in Hyderabad.
SELECT employee_name,city
FROM employees
WHERE city like "hyderabad";

-- Q5. Display employees whose salary is between n50,000 and n70,000.
SELECT employee_name,salary 
FROM employees
WHERE salary BETWEEN 50000 AND 70000;

SELECT employee_name,salary
FROM employees
WHERE salary>=50000  AND salary <=70000;

-- Q6. Display employees who live in either Hyderabad or Bangalore.
SELECT  employee_name,city 
FROM employees
WHERE city="hyderabad" OR "banglore";

-- Q7. Display employees whose names start with the letter 'A'.
SELECT employee_name
FROM employees
WHERE employee_name like "A%";

-- Q8. Display employees whose names end with the letter 'e'.
SELECT employee_name
FROM employees
WHERE employee_name like "%e";

-- Q9. Display all employees sorted by salary from highest to lowest.
SELECT employee_name,salary
FROM employees
ORDER BY salary desc ; 

-- Q10. Display the top 3 highest-paid employees
SELECT employee_name,salary
FROM employees
ORDER BY salary desc limit 3 ;
 
-- Section B — Aggregate Functions

-- Q11. Find the total number of employees.
SELECT count(employee_id)as Total_employees
FROM employees ;

-- Q12. Find the total salary of all employees.
SELECT sum(salary) as Total_salrys
FROM employees;

-- Q13. Find the average employee salary.
SELECT AVG(salary) as Average_salry
FROM employees;

-- Q14. Find the highest salary.
SELECT  max(salary) As highest_salary
FROM employees;

-- Q15. Find the lowest salary.
SELECT min(salary) AS lowest_salary
FROM employees;

-- Q16. Find the number of employees living in Hyderabad.
SELECT count(employee_id)
FROM employees
WHERE city like "hyderabad";

-- Q17. Find the total salary paid to employees living in Mumbai.
SELECT sum(salary) as total_salary
FROM employees 
WHERE city="mumbai";

-- Q18. Find the average salary of employees living in Bangalore
SELECT avg(salary)as Average_salary
FROM employees
WHERE city like "Bangalore";

-- Section C — GROUP BY and HAVING

-- Q19. Find the number of employees in each department.
SELECT department_name ,count(employee_id) 
FROM department
INNER JOIN employees
ON department.dept_id=employees.dept_id
GROUP BY department_name
;

-- Q20. Find the average salary in each department.
SELECT department_name,AVG(salary)as average_salary 
FROM department as d
INNER JOIN employees as e 
ON d.dept_id=e.dept_id
GROUP BY department_name;

-- Q21. Find the maximum salary in each department.
SELECT department_name, max(salary) as highest_salaries
FROM department as d
INNER JOIN employees as e 
ON d.dept_id=e.dept_id
GROUP BY department_name;

-- Q22. Find the minimum salary in each department.
SELECT department_name, min(salary) as highest_salaries
FROM department as d
LEFT JOIN employees as e 
ON d.dept_id=e.dept_id
GROUP BY department_name;

-- Q23. Find the total salary paid by each department.
SELECT department_name, sum(salary) as highest_salaries
FROM department as d
LEFT JOIN employees as e 
ON d.dept_id=e.dept_id
GROUP BY department_name;

-- Q24. Find the number of employees in each city.
SELECT DISTINCT city, count(employee_id)AS Total_employee
FROM employees
GROUP BY city;

-- Q25. Find the average salary for each city.
SELECT DISTINCT city,avg(salary) AS Average_salary
FROM employees
GROUP BY city ;

-- Q26. Find cities having more than 2 employees.
SELECT city,count(employee_id) As total_employees
FROM employees 
GROUP BY city
HAVING count(employee_id)>2;

-- Q27. Find departments where the average salary is greater than n60,000.
SELECT department_name,avg(salary) as Average_salary
FROM department as d
LEFT JOIN employees as e
ON d.dept_id=e.dept_id
GROUP BY department_name
HAVING avg(salary)>60000;

-- Q28. Find departments where the total salary is greater than n150,000
SELECT department_name,sum(salary) as Total_salary
FROM department as d
LEFT JOIN employees as e 
ON d.dept_id=e.dept_id
GROUP BY department_name
HAVING sum(salary)>150000;

-- Section D — Constraints

-- Q29. Create the students table using the following constraints: student_id PRIMARY KEY, student_name
-- NOT NULL, email UNIQUE, age CHECK (age >= 18), and city DEFAULT 'Hyderabad'.
CREATE TABLE students(
student_id int PRIMARY KEY ,
student_name VARCHAR(50) NOT NULL ,
email VARCHAR(20) UNIQUE,
age int CHECK(age>=18),
city VARCHAR(10) DEFAULT "hyderabad"
);

-- Q30. Insert a valid student record into the students table.
INSERT INTO students 
(student_id,student_name,email,age)
VALUES
(101,"Rahul","rahul@gmail.com",19),
(102,"Ram","ram@gmail.com",59),
(103,"John","john@gmail.com",50);

-- Q31. Attempt to insert two students with the same student_id. Identify the constraint that is violated.
INSERT INTO students 
(student_id,student_name,email,age)
VALUES
(101,"Rahul","rahul@gmail.com",19),
(101,"Ram","ram@gmail.com",59);

 -- 	Error Code: 1062. Duplicate entry '101' for key 'students.PRIMARY'	0.000 sec
 
-- Q32. Attempt to insert a student without providing student_name. Identify what happens.
 INSERT INTO students 
(student_id,student_name,email,age)
VALUES
(105,null,"rahul@gmail.com",20);

 -- Error Code: 1048. Column 'student_name' cannot be null	0.015 sec
 
 -- Q33. Attempt to insert a student whose age is 15. Identify the constraint that is violated.
INSERT INTO students 
(student_id,student_name,email,age)
VALUES
(105,"soham","rahul@gmail.com",15),
(107,"Varun","varun@gmail.com",16);

 -- Error Code: 3819. Check constraint 'students_chk_1' is violated.	0.000 sec

-- Q34. Insert a student without specifying city. Verify the value assigned by the DEFAULT constraint
INSERT INTO students
(student_id,student_name,email,age)
VALUES
(109,"Nasir Sir ","nasir@gmail.com",27);
-- 1 row(s) affected	0.047 sec

-- Section E — JOINs

-- Q35. Display employee name and department name
SELECT e.employee_name,d.department_name
FROM department as d
INNER JOIN employees as e 
ON d.dept_id=e.dept_id;

-- Q36. Display employee name, salary, department name, and department location.
SELECT e.employee_name,e.salary,d.department_name,d.location
FROM department as d
INNER JOIN employees as e 
ON d.dept_id=e.dept_id;

-- Q37. Display all employees, including employees who do not belong to any department.
SELECT e.employee_name,d.department_name
FROM employees as e  
LEFT JOIN   department as d
ON d.dept_id=e.dept_id;

-- Q38. Display all departments, including departments that have no employees.
SELECT  d.department_name,e.employee_name
FROM  department as d    
LEFT JOIN  employees as e 
ON d.dept_id=e.dept_id;

-- Q39. Find employees working in the Data Science department.
SELECT e.employee_name,d.department_name
FROM employees as e  
LEFT JOIN  department as d
ON e.dept_id=d.dept_id
WHERE d.dept_id=10;

-- Q40. Find employees working in departments located in Hyderabad.
SELECT e.employee_name,e.city
FROM employees as e 
LEFT JOIN department as d
ON e.dept_id=d.dept_id
WHERE e.city="Hyderabad";

-- Q41. Find the number of employees in each department using JOIN and GROUP BY. Include departments
-- with zero employees.
SELECT d.department_name,count(employee_id)as total_employees
FROM department as d
LEFT JOIN employees as e
ON d.dept_id=e.dept_id
GROUP BY d.department_name;

-- Q42. Find the average salary for each department using JOIN and GROUP BY
SELECT d.department_name,avg(salary)as Average_salary
FROM department as d
LEFT JOIN employees as e
ON d.dept_id=e.dept_id
GROUP BY d.department_name;

-- Section F — Subqueries

-- Q43. Find employees whose salary is greater than the overall average salary.
SELECT employee_name,salary 
FROM employees
WHERE salary > (SELECT avg(salary) FROM employees); 
 
-- Q44. Find the employee with the highest salary using a subquery.
SELECT employee_name,salary
FROM employees
WHERE salary=(SELECT max(salary)as high_salary FROM employees);

-- Q45. Find employees who earn the same salary as Alice.
SELECT employee_name,salary
FROM employees
WHERE salary =(SELECT salary FROM employees WHERE employee_name='Alice')
AND employee_name <>'Alice';

-- Q46. Find employees who earn more than Alice.
SELECT employee_name,salary 
FROM employees
WHERE salary>=(select salary FROM employees WHERE employee_name='Alice');

-- Q47. Find employees who earn more than the average salary of their own department
 SELECT e.employee_name,e.salary,d.department_name
 FROM employees as e
 LEFT JOIN department as d
 ON e.dept_id=d.dept_id
 WHERE e.salary > 
 (SELECT AVG(salary)as average FROM employees 
  WHERE e.dept_id=e.dept_id);
 
-- Section G — Mixed SQL 

-- Q48. Find the department with the highest average salary.
 SELECT d.department_name,AVG(salary)
 FROM employees as e
 LEFT JOIN department as d
 ON e.dept_id=d.dept_id
GROUP BY d.department_name
ORDER BY avg(salary) DESC limit 1;

 -- Q49. Display each department with department name, employee count, average salary, maximum salary, minimum salary, 
 -- and total salary. Include departments with zero employees. 
 SELECT department_name,count(employee_id)as total_employee,avg(salary) as Average,max(salary)as highest_salary,
 min(salary)as lowest_salary,sum(salary)as totalsalary
 FROM  department as d  
 LEFT JOIN  employees as e
 ON d.dept_id=e.dept_id
 GROUP BY department_name;

--  Q50. Find employees who satisfy all conditions: salary greater than 55,000; city is Hyderabad or Bangalore;
 -- employee belongs to a valid department; 
 -- and employee salary is greater than the average salary of their department.
 SELECT employee_name,department_name,salary,city
 FROM employees as e
 INNER JOIN department as d
 ON e.dept_id=d.dept_id
 WHERE e.salary>55000 AND city IN ("Hyderabad","Bangalore") AND e.salary>(SELECT avg(salary)as average FROM employees AS e2
WHERE e2.dept_id=e.dept_id); 
 
 