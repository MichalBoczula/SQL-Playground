/*1. Write a query to display all the orders from the orders table issued by the salesman 'Paul Adam'.*/

--select * from Inventory.Orders o 
--where o.salesman_id = 
--(
--	select salesman_id from Inventory.Salesman s
--	where s.name = 'Paul Adam'
--);

/*2. Write a query to display all the orders for the salesman who belongs to the city London. */

--select * from Inventory.Orders o
--where o.salesman_id = 
--(
--	select s.salesman_id from Inventory.Salesman s
--	where s.city = 'London'
--);

/*3. Write a query to find all the orders issued against the salesman who may works for customer whose id is 3007.*/

--select * from Inventory.Orders o
--where o.salesman_id = 
--(
--	select salesman_id from Inventory.Orders o
--	where o.customer_id = 3007
--);

/*4. Write a query to display all the orders which values are greater than the average order value for 10th October 2012.*/

--Declare @ele int
--set @ele = (select AVG(o.purch_amt) from Inventory.Orders o
--	where o.ord_date = '2012-10-10');

--select * from Inventory.Orders o
--where o.purch_amt > @ele;

/*6. Write a query to display the commission of all the salesmen servicing customers in Paris.*/

--declare @ele int;

--set @ele = (select c.salesman_id from Inventory.Customer c 
--where c.city = 'Paris');

--select s.name, s.commission from Inventory.Salesman s
--where s.salesman_id = @ele;

/*8. Write a query to count the customers with grades above New York's average.*/

--select c.grade, count(*) as customers from Inventory.Customer c
--where c.grade > (
--	select AVG(c.grade) from Inventory.Customer c
--	where c.city = 'New York'
--)
--group by c.grade;

/*9. Write a query to extract the data from the orders table for those salesman who earned the maximum commission */

--select * from Inventory.Orders o
--where o.salesman_id = 
--(
--	select top(1) s.salesman_id from Inventory.Salesman s
--	order by s.commission desc
--);


/*12. Write a query to find all orders with order amounts which are above-average amounts for their customers.*/

--select * from  Inventory.Orders o
--where o.purch_amt > (
--	select  avg(p.purch_amt) from Inventory.Orders p
--	where o.customer_id = p.customer_id
--);

/*14. Write a query to find the sums of the amounts from the orders table, grouped by date, eliminating all 
those dates where the sum was not at least 1000.00 above the maximum order amount for that date.*/

--select o.ord_date, sum(o.purch_amt) from Inventory.Orders o
--group by o.ord_date
--having sum(o.purch_amt) > 
--(
--	select 1000 + MAX(p.purch_amt) from Inventory.Orders p
--	where o.ord_date = p.ord_date
--);

/*16. Write a query to find the salesmen who have multiple customers.*/

--select * from Inventory.Salesman s
--where s.salesman_id in (
--	select o.salesman_id from Inventory.Customer o
--	group by o.salesman_id
--	having count(o.customer_id) > 1
--);

/*17. Write a query to find all the salesmen who worked for only one customer.*/ 

--select * from Inventory.Salesman s
--where s.salesman_id in (
--	select o.salesman_id from Inventory.Customer o
--	group by o.salesman_id
--	having count(o.customer_id) = 1
--);

/*18. Write a query that extract the rows of all salesmen who have customers with more than one orders. */

--select * from Inventory.Salesman s
--where s.salesman_id in (
--	select o.salesman_id from Inventory.Orders o
--	group by o.salesman_id
--	having count(o.salesman_id) > 1
--);

/*21. Write a query to display the salesmen which name are alphabetically lower than the name of the customers.*/

--select * from Inventory.Salesman s
--where Exists 
--( select *
--	from Inventory.Customer c
--	where s.name < c.cust_name
--);	

/*23. Write a query to display all the orders that had
amounts that were greater than at least one of the orders on September 10th 2012.*/

--declare @ele decimal;

--set @ele =(select Min(o.purch_amt) from Inventory.Orders o
--	where o.ord_date = '9/10/2012');

--select * from Inventory.Orders o 
--	where o.purch_amt > @ele;

--select * from Inventory.Orders o
--where o.purch_amt > Any
--(
--	select oo.purch_amt from Inventory.Orders oo
--	where oo.ord_date = '2012/09/10'
--);

/*25. Write a query to display all orders with an amount smaller than any amount for a customer in London. (Using MAX)*/

--select * from Inventory.Orders o
--where o.purch_amt < (
--	select MAX(o.purch_amt) from Inventory.Orders o, Inventory.Customer c
--	where o.customer_id = c.customer_id and c.city = 'London'
--);

/*27. Write a query in sql to find the name, city, and the total sum of orders amount a salesman collects.
Salesman should not belong to the cities where any of the customer belongs.*/

--select a.name, a.city, subquery.sum_purch_amt from Inventory.Salesman a,
--(
--	select o.salesman_id, sum(o.purch_amt) as 'sum_purch_amt' from  Inventory.Orders o
--	group by o.salesman_id
--) as subquery
--where a.salesman_id in 
--(
--	select s.salesman_id from Inventory.Salesman s, Inventory.Customer c
--		where s.city = c.city
--)
--and 
--subquery.salesman_id = a.salesman_id;

/*28. Write a query to get all the information for those customers whose grade is not as the grade 
of customer who belongs to the city London. */

--select * from Inventory.Customer c
--where c.grade <> ALL
--(
--	select c.grade from Inventory.Customer c
--	where c.city = 'London' and c.grade is not null
--);

/*29. Write a query to find all those customers whose grade are not as the grade, belongs to the city Paris*/

--select * from Inventory.Customer c
--where c.grade not in
--(
--	select c.grade from Inventory.Customer c
--	where c.city = 'Paris' and c.grade is not null
--);

/*30. Write a query to find all those customers who hold a different grade than any customer of the city Dallas.*/

--select * from Inventory.Customer c
--where c.grade not in
--(
--	select c.grade from Inventory.Customer c
--	where c.city = 'Dallas' and c.grade is not null
--);
