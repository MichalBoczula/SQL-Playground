/*1. Write a SQL statement to prepare a list with salesman name, 
customer name and their cities for the salesmen and customer who belongs to the same city.*/

--SELECT s.name, s.city, s.commission, i.cust_name from Inventory.Salesman s
--join Inventory.Customer i on i.salesman_id = s.salesman_id
--where i.city = s.city;

/*2. Write a SQL statement to make a list with order no, purchase amount, customer name and their 
cities for those orders which order amount between 500 and 2000.*/

--select o.ord_no, o.purch_amt, c.cust_name from Inventory.Orders o 
--join Inventory.Customer c on c.customer_id = o.customer_id
--where o.purch_amt between 500 and 2000;

/*3. Write a SQL statement to know which salesman are working for which customer. */

--select s.salesman_id, c.customer_id, c.cust_name, s.name as 'salesman_name' from Inventory.Customer c
--join Inventory.Salesman s on c.salesman_id = s.salesman_id;

/*4. Write a SQL statement to find the list of customers who appointed a salesman for their
jobs who gets a commission from the company is more than 12%.*/

--select s.name as 'sales_name', s.commission, c.cust_name from Inventory.Salesman s
--join Inventory.Customer c on c.salesman_id = s.salesman_id
--where s.commission > 0.12;

/*5. Write a SQL statement to find the list of customers who appointed a salesman for their jobs who does not
live in the same city where their customer lives, and gets a commission is above 12% .*/

--select s.name as 'sales_name', s.city, s.commission, c.city, c.cust_name from Inventory.Salesman s
--join Inventory.Customer c on c.salesman_id = s.salesman_id
--where s.commission > 0.12 and
--	s.city != c.city;

/*6. Write a SQL statement to find the details of a order i.e. order number, order date, amount of order, 
which customer gives the order and which salesman works for that customer and how much commission he gets for an order.*/

--select o.ord_no, o.ord_date, o.purch_amt, c.cust_name, s.name as 'sales_name' from Inventory.Orders o
--join Inventory.Customer c on c.customer_id = o.customer_id
--join Inventory.Salesman s on s.salesman_id = o.salesman_id;

/*7. Write a SQL statement to make a join on the tables salesman, customer and orders in such a form that the same
column of each table will appear once and only the relational rows will come. In MSSQL there is no Natural Join :)*/

--select o.ord_no, o.ord_date, o.purch_amt, c.cust_name, s.name as 'sales_name' from Inventory.Orders o
--join Inventory.Customer c on c.customer_id = o.customer_id
--join Inventory.Salesman s on s.salesman_id = o.salesman_id;

/*8. Write a SQL statement to make a list in ascending order for the customer
who works either through a salesman or by own. */

--select  * from Inventory.Customer c
--join Inventory.Salesman s on s.salesman_id = c.salesman_id
--order by c.customer_id;

/*9. Write a SQL statement to make a list in ascending order for the customer who holds
a grade less than 300 and works either through a salesman or by own.*/

--select * from Inventory.Customer c
--join Inventory.Salesman s on s.salesman_id = c.salesman_id
--where c.grade < 300
--order by c.customer_id;

/*10. Write a SQL statement to make a report with customer name, city, order number,
order date, and order amount in ascending order according to the order date to find that
either any of the existing customers have placed no order or placed one or more orders.*/

--select c.cust_name, c.city, c.grade, o.ord_date, o.purch_amt, o.customer_id from Inventory.Customer c
--left join Inventory.Orders o on o.customer_id = c.customer_id
--order by o.ord_date;

/*11. Write a SQL statement to make a report with customer name, city, order number, order date, order amount
salesman name and commission to find that either any of the existing customers have
placed no order or placed one or more orders by their salesman or by own. */

--select c.cust_name, c.city, o.ord_date, o.ord_no, o.purch_amt, s.name as 'sales_name' from Inventory.Customer c
--left join Inventory.Orders o on o.customer_id = c.customer_id
--left join Inventory.Salesman s on s.salesman_id = c.salesman_id
--order by c.customer_id;

--select c.customer_id, c.cust_name, Count(c.customer_id) as 'ord_quantity' from Inventory.Customer c
--left join Inventory.Orders o on o.customer_id = c.customer_id
--group by c.customer_id, c.cust_name
--order by 'ord_quantity' desc;

/*12. Write a SQL statement to make a list in ascending order for the salesmen who works either 
for one or more customer or not yet join under any of the customers. */

--select * from Inventory.Salesman s
--left join Inventory.Customer c on c.salesman_id = s.salesman_id;

/*13. Write a SQL statement to make a list for the salesmen who works either for one or more custome
or not yet join under any of the customers who placed either one or more orders or no order to their supplier. */

--select * from Inventory.Orders o
--left join Inventory.Salesman s on s.salesman_id = o.salesman_id;

/*14. Write a SQL statement to make a list for the salesmen who either work for one or more customers or
yet to join any of the customer. The customer may have placed, either one or more orders on or
above order amount 2000 and must have a grade, or he may not have placed any order to the associated supplier. */

--select * from Inventory.Orders o
--join Inventory.Salesman s on s.salesman_id = o.salesman_id
--join Inventory.Customer c on c.customer_id = o.customer_id
--where  o.purch_amt > 2000 and c.grade is not null;
	
/*15. Write a SQL statement to make a report with customer name, city, order no. order date, purchase amount
for those customers from the existing list who placed one or more orders or which order(s)
have been placed by the customer who is not on the list. */

--select c.cust_name, c.city, o.ord_no, o.ord_date, o.purch_amt from Inventory.Orders o
--join Inventory.Customer c on c.customer_id = o.customer_id;

/*16. Write a SQL statement to make a report with customer name, city, order no. order date, purchase amount
for only those customers on the list who must have a grade and placed one or more orders or which order(s)
have been placed by the customer who is neither in the list not have a grade.*/

--select * from Inventory.Orders o
--join Inventory.Customer c on c.customer_id = o.customer_id
--where c.grade is not null;