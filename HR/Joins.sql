use W3Resource;

--1. Write a query in SQL to display the first name, last name, department number, and department name for each employee.

--select e.first_name, e.last_name, e.department_id, d.department_name from HR.Employees e
--join HR.Departments d on e.department_id  = d.department_id;

--2. Write a query in SQL to display the first and last name, department, city, and state province for each employee.

--select e.first_name, e.last_name, d.department_name, l.city from HR.Employees e
--join HR.Departments d on e.department_id = d.department_id
--join HR.Locations l on d.location_id = l.location_id;

--3. Write a query in SQL to display the first name, last name, salary, and job grade for all employees.

--select e.first_name, e.last_name, e.salary, g.grade_level from HR.Employees e
--join HR.Job_Grades g on e.salary between g.lowest_sal and g.highest_sal;

--4. Write a query in SQL to display the first name, last name, department number and department name, 
--for all employees for departments 80 or 40. 

--select e.first_name, e.last_name, e.department_id, d.department_name from HR.Employees e
--join HR.Departments d on e.department_id = d.department_id
--where d.department_id in (80, 40);

--Second query has and insted of where clause
--select e.first_name, e.last_name, e.department_id, d.department_name from HR.Employees e
--join HR.Departments d on e.department_id = d.department_id
--and d.department_id in (80, 40);

--5. Write a query in SQL to display those employees who contain a letter m to their first name 
--and also display their last name, department, city, and state province.

--select e.first_name, e.last_name, d.department_name, l.city, l.state_province from HR.Employees e
--join HR.Departments d on d.department_id = e.department_id
--join HR.Locations l on d.location_id = l.location_id
--where e.first_name like 'm%';

--6. Write a query in SQL to display all departments where are hire  10 and more employees .

--select * from HR.Departments d
--where d.department_id in (
--	select e.department_id from HR.Employees e
--	group by e.department_id
--	having count(*) >= 10);

--9. Write a query in SQL to display the department name, city, and state province for each department.

--select d.department_name, l.city, l.state_province from HR.Departments d
--join HR.Locations l on d.location_id = l.location_id;

--12. Write a query in SQL to display the first name, last name, and department number for those employees who works 
--in the same department as the employee who holds the last name as Taylor.

--select e.first_name, e.last_name, e.department_id from HR.Employees e
--where e.department_id in (
--	select e.department_id from HR.Employees e
--	where e.last_name = 'Taylor')
--and e.last_name != 'Taylor';

--13. Write a query in SQL to display the 
--job title, department name, full name (first and last name ) of employee, and starting date for all the jobs which started on 
--or after 1st January, 1993 and ending with on or before 2006-08-31 

--select e.first_name, e.last_name, jh.start_date from HR.Employees e
--join  HR.Job_History jh  on jh.employee_id = e.employee_id
--where jh.start_date > '1993-01-01' and 
--jh.end_date < '2006-08-31';

--14. Write a query in SQL to display job title, full name (first and last name ) of employee, and the difference 
--between maximum salary for the job and salary of the employee. 

--select concat(e.first_name, ' ', e.last_name) as 'name' , e.job_id, (g.highest_sal - e.salary) as 'diffance' from HR.Employees e
--join HR.Job_Grades g on e.salary between g.lowest_sal and g.highest_sal;

--15. Write a query in SQL to display the name of the department, average salary and number of employees 
--working in that department who got commission.
 
--select d.department_name, 
--	(
--		select avg(e.salary)  from HR.Employees e 
--		where d.department_id = e.department_id 
--		group by e.department_id
--	) as 'avg_salary',
--	(
--		select count(e.department_id)  from HR.Employees e 
--		where d.department_id = e.department_id
--		group by e.department_id
--	) as 'employees'
--from HR.Departments d;

--21. Write a query in SQL to display the country name, city, and number of those departments where at leaste 2 employees are working.

--select d.department_name, c.country_name, l.city from HR.Departments d
--join HR.Locations l on d.location_id = l.location_id
--join HR.Countries c on l.country_id = c.country_id
--where d.department_id in 
--(
--	select e.department_id from HR.Employees e
--	group by e.department_id
--	having COUNT(e.employee_id) > 2
--);

--22. Write a query in SQL to display the department name, full name (first and last name) of manager, and their city.

--select CONCAT(e.first_name, ' ', e.last_name) as 'emp_fullname', d.department_name, l.location_id from HR.Employees e
--join HR.Departments d on e.department_id = d.department_id
--join HR.Locations l on d.location_id = l.location_id
--where e.employee_id in 
--(
--	select e.manager_id from HR.Employees e
--);

--24. Write a query in SQL to display the full name (first and last name), and salary
--of those employees who working in any department located in Seatlle. 

--select CONCAT(e.first_name, ' ', e.last_name) as 'emp_fullname', e.salary, d.department_name from HR.Employees e
--join HR.Departments d on e.department_id = d.department_id
--join HR.Locations l on d.location_id = l.location_id
--where l.city = 'Seattle';

--27. Write a query in SQL to display the full name (first and last name ) 
--of employee with ID and name of the country presently where (s)he is working.

--select concat(e.first_name, ' ', e.last_name) as 'fullname', c.country_id, c.country_name from HR.Employees e
--join HR.Departments d on e.department_id = d.department_id
--join HR.Locations l on d.location_id = l.location_id
--join HR.Countries c on l.country_id = c.country_id;
