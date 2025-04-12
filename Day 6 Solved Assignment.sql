
--Run the following command to add and update dob column in employee table
alter table  employee add dob date;
update employee set dob = dateadd(year,-1*emp_age,getdate());
SELECT * FROM employee

--1- write a query to print emp name , their manager name and diffrence in their age (in days) 
SELECT E1.emp_name, E2.emp_name, DATEDIFF(DAY, E1.DOB, E2.DOB)
FROM employee E1 INNER JOIN employee E2 ON E1.manager_id = E2.emp_id
WHERE DATEPART(YEAR, E1.DOB) < DATEPART(YEAR, E2.DOB)

--2- write a query to find subcategories who never had any return orders in the month of november (irrespective of years)
SELECT * FROM ORDERS
select sub_category
from orders o
left join returns$ r on o.order_id=r.order_id
where DATEPART(month,order_date)=11
group by sub_category
having count(r.order_id)=0;

-- 3- orders table can have multiple rows for a particular order_id when customers buys more than 1 product in an order.
-- write a query to find order ids where there is only 1 product bought by the customer.
SELECT Order_ID
FROM Orders
GROUP BY Order_ID
HAVING COUNT(1)= 1

-- 4- write a query to print manager names along with the comma separated list(order by emp salary) of all employees directly reporting to him.
SELECT E2.emp_name, STRING_AGG(E1.emp_name, ', ') AS EMP_LIST
FROM employee E1 INNER JOIN employee E2 ON E1.manager_id = E2.emp_id
GROUP BY E2.emp_name

-- 5- write a query to get number of business days between order_date and ship_date (exclude weekends). 
--Assume that all order date and ship date are on weekdays only
SELECT Order_Date, Order_Date, Ship_Date, DATEDIFF(DAY, Order_Date, Ship_Date)-2
FROM Orders

-- 6- write a query to print 3 columns : category, total_sales and (total sales of returned orders)
SELECT Category, SUM(SALES) AS TOTAL_sALES, SUM(CASE WHEN R.Order_Id IS NOT NULL THEN SALES END ) AS return_orders_sales
FROM Orders O INNER JOIN returns$ R ON O.ORDER_ID = R.ORDER_id
GROUP BY CATEGORY

-- 7- write a query to print below 3 columns category, total_sales_2019(sales in year 2019), total_sales_2020(sales in year 2020)
SELECT CATEGORY, SUM (CASE WHEN DATEPART(YEAR, Order_Date)=2019 THEN SALES END) AS total_sales_2019,
SUM (CASE WHEN DATEPART(YEAR, Order_Date)=2020 THEN SALES END) AS total_sales_2020
FROM Orders
GROUP BY Category

-- 8- write a query print top 5 cities in west region by average no of days between order date and ship date.
SELECT TOP 5 City, AVG(DATEDIFF(DAY, Order_Date, Ship_Date)) AS AVG_DAYS
FROM ORDERS
WHERE Region = 'West'
GROUP BY CITY
ORDER BY AVG_DAYS DESC

-- 9- write a query to print emp name, manager name and senior manager name (senior manager is manager's manager)
SELECT E1.emp_name AS EMP_NAME, E2.emp_name AS MANAGER_NAME, E3.emp_name AS SENIOR_MANAGER
FROM employee E1 INNER JOIN employee E2 ON E1.manager_id = E2.emp_id
INNER JOIN employee E3 ON E2.manager_id = E3.emp_id

