use W3Resource;

--1. Write a query to display the name ( first name and last name ) 
--for those employees who gets more salary than the employee whose ID is 163. 

--declare @ele decimal;
--set @ele = (select e.salary from HR.Employees e
--	where e.employee_id = 163);

--select e.first_name, e.last_name from HR.Employees e
--	where e.salary > @ele;

--3. Write a query to display the name ( first name and last name ),
--salary, department id for those employees who earn such amount of salary which
--is the smallest salary of any of the departments.

--select e.first_name, e.last_name, e.salary, e.department_id from HR.Employees e
--where e.salary in
--(
-- select min(e.salary) from HR.Employees e
--	group by e.department_id
--);

--4. Write a query to display the employee id, employee name (first name and last name )
--for all employees who earn more than the average salary. 

--declare @ele int;
--set @ele = (select avg(e.salary) from HR.Employees e);

--select e.employee_id ,e.first_name, e.last_name  from HR.Employees e
--where e.salary > @ele; 

--5. Write a query to display the employee name ( first name and last name ),
--employee id and salary of all employees who report to Payam. 

--select e.employee_id, e.first_name, e.last_name, e.salary from HR.Employees e
--where e.manager_id = (
--select e.employee_id from HR.Employees e
--where e.first_name = 'Payam');

--11. Write a query to display all the information of the employees who does not work
--in those departments where some employees works whose manager id within the range 100 and 200.

--select * from Hr.Employees e
--where e.department_id not in (
--	select d.department_id from Hr.Departments d
--	where d.manager_id between 100 and 200);

--12. Write a query to display all the information for those employees whose id is any id who earn the second highest salary.

--select * from HR.Employees e
--where e.salary = (
--	select distinct e.salary from HR.Employees e
--	order by e.salary desc
--	offset 1 row
--	fetch next 1 row only
--);

--13. Write a query to display the employee name( first name and last name ) and hiredate
--for all employees in the same department as Clara. Exclude Clara.

--select e.first_name, e.last_name, e.hire_date from HR.Employees e
--where e.first_name <> 'Clara'
--and e .department_id = (
--	select e.department_id from Hr.Employees e
--	where e.first_name = 'Clara'
--);

--15. Write a query to display the employee number, name( first name and last name ), and salary 
--for all employees who earn more than the average salary and who work in a department 
--with any employee with a J in their name. 

--select * from HR.Employees e
--where e.salary > (
--	select avg(e.salary) from HR.Employees e)
--and
--e.department_id in (
--	select distinct e.department_id from HR.Employees e
--	where e.first_name like 'J%');

--16. Display the employee name( first name and last name ), employee id, and job title 
--for all employees whose department location is Toronto. 

--select e.employee_id, CONCAT(e.first_name, ' ', e.first_name) as 'employee_name', e.job_id 
--from HR.Employees e
--where e.department_id = (
--	select d.department_id from HR.Departments d
--	where d.location_id = (
--		select location_id from HR.Locations l
--		where l.city = 'Toronto'));

--18. Write a query to display the employee number, name( first name and last name ) and job title 
--for all employees whose salary is smaller than any salary of those employees whose job title is SA_MAN. 
--Exclude Job title MK_MAN. 

--select * from HR.Employees e
--where e.salary > any (
--	select e.salary from HR.Employees e
--	where e.job_id = 'SA_MAN'
--)
--and 
--e.job_id <> 'SA_MAN';

--20. Write a query to display the employee number, name( first name and last name ) and job title for
--all employees whose salary is more than any average salary of any department.

--select * from HR.Employees e
--where e.salary > any (
--	select avg(e.salary) from HR.Employees e
--	group by e.department_id);

--22. Write a query to display the department id and the total salary for those departments which contains at least one employee.

--select e.department_id, sum(e.salary) from HR.Employees e
--where e.department_id in (
--	select e.department_id  from HR.Employees e
--	group by e.department_id
--	having count(*) > 0
--)
--group by e.department_id;

--24. Write a query to display the employee id, name ( first name and last name ), salary and the SalaryStatus column with a title
--HIGH and LOW respectively for those employees whose salary is more than and less than the average salary of all employees.  

--declare @ele int;
--set @ele =(select avg(e.salary) from HR.Employees e);

--select e.employee_id, CONCAT(e.first_name, ' ', e.last_name) as 'Name', 'Case' =
--	case
--		when e.salary > @ele then 'High'
--		when e.salary < @ele then 'Low'
--		when e.salary = @ele then 'Equal'
--	end
--from HR.Employees e
--order by 'Case';

--26. Write a subquery that returns a set of rows to find all departments that do actually have one or more employees assigned to them.

--select * from Hr.Departments d
--where d.department_id in (
--	select e.department_id from HR.Employees e
--	group by e.department_id
--	having count(*) > 0);

--27. Write a query that will identify all employees who work in departments located in the Canada.

--select * from HR.Employees e
--where e.department_id = (
--	select d.department_id from HR.Departments d
--	where d.location_id in (
--		select l.location_id from HR.Locations l
--		where l.country_id = (
--			select c.country_id from HR.Countries c
--			where c.country_name = 'Canada')));


--30. Write a query to find out which employees have a manager who works for a department based in the US without managers.

--SELECT *
--FROM   hr.employees e
--WHERE  e.manager_id IN (SELECT DISTINCT e.manager_id
--                        FROM   hr.employees e
--                        WHERE  e.manager_id IN (SELECT d.manager_id
--                                                FROM   hr.departments d
--                                                WHERE  d.location_id IN
--                                                       (SELECT l.location_id
--                                                        FROM   hr.locations l
--                                                        WHERE
--                                               l.country_id = 'US')))
--       AND e.employee_id <> e.manager_id;

--32. Write a query to get the details of employees who are managers. 

--select * from HR.Employees e
--where e.employee_id in (
--	select distinct d.manager_id from HR.Departments d);

--34. Write a query to display the employee id, name ( first name and last name ), salary, department name and city 
--for all the employees who gets the salary as the salary earn by the employee which is maximum 
--within the joining person January 1st, 2002 and December 31st, 2003. 

--select concat(e.first_name, ' ' ,e.last_name) as 'name', e.salary, d.department_name, l.city  from HR.Employees e 
--join HR.Departments d on e.department_id = d.department_id
--join HR.Locations l on d.location_id = l.location_id
--where e.salary in(
--	select distinct e.salary from HR.Employees e
--	where e.hire_date > '2002-01-01'
--	and e.hire_date < '2003-12-31');

--41. Write a query in SQL to display the first and last name, and department code for all employees who work in the department Marketing. 

--select e.first_name, e.last_name, e.department_id from HR.Employees e
--where e.department_id = (
--	select d.department_id from HR.Departments d
--	where d.department_name = 'Marketing');

--46. Write a query in SQL to display the first and last name, salary and department ID 
--for those employees whose department is located in the city Toronto. 

--select e.first_name, e.last_name, e.department_id from HR.Employees e
--where e.department_id = (
--	select d.department_id from HR.Departments d
--	where d.location_id = (
--		select l.location_id from HR.Locations l
--		where l.city = 'Toronto'));

--48. Write a query in SQL to display the the details of those departments which max salary is 12000 
--or above for those employees who already done one or more jobs. 

--select  * from HR.Departments d
--where d.department_id in(
--	select e.department_id from HR.Employees e
--	group by e.department_id
--	having MAX(e.salary) <= 12000);

--49. Write a query in SQL to display the detail information of those departments which starting salary is at least 12000.

--select * from HR.Departments d
--where d.department_id in(
--	select e.department_id from HR.Employees e
--	group by e.department_id
--	having Min(e.salary) >= 12000);

--50. Write a query in SQL to display the full name (first and last name) of manager who is supervising 4 or more employees.

--select concat(e.first_name, ' ', e.last_name) as 'FullName' from HR.Employees e
--where e.employee_id in (
--	select e.manager_id from HR.Employees e
--	group by e.manager_id
--	having COUNT(e.manager_id) >= 4);

--51. Write a query in SQL to display the details of the current job for those employees who worked as a Sales Representative in the past.

--select * from HR.Employees e
--where e.employee_id =(
--	select jh.employee_id from HR.Job_History jh
--	where jh.job_id = (
--		select j.job_id from HR.Jobs j
--		where j.job_title = 'Sales Representative'));

--55. Write a query in SQL to display all the information of those employees who did not have any job in the past.  

--select * from HR.Employees e
--where e.employee_id not in (
--	select jh.employee_id from HR.Job_History jh);