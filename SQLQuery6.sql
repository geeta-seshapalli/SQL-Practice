select * from employee;
select * from dept;

-- self join to fetch employee's manager
select e1.emp_name, e2.emp_name as Manager 
from employee e1 inner join employee e2 on e1.manager_id=e2.emp_id

--emp's whose salary is more than manager
select e1.emp_name, e2.emp_name
from employee e1 inner join employee e2 on e1.manager_id=e2.emp_id
where e1.salary > e2.salary

--dept id, list of employees
select e1.dept_id, count(emp_id) as no_of_employee
from employee e1
group by dept_id

-- string aggregate
select e1.dept_id, STRING_AGG(e1.emp_name, ', ') as no_of_employee
from employee e1
group by dept_id

-- string aggregate & sort
select e1.dept_id, STRING_AGG(e1.emp_name, ', ') within group (order by e1.emp_name)as no_of_employee
from employee e1
group by dept_id

--date functions get year
select Order_ID, Order_Date,
DATEPART(YEAR, Order_Date) as Year
from Orders

--date functions fetch orders placed in 2020
select Order_ID, Order_Date
from Orders
where DATEPART(YEAR, Order_Date) = 2020

--date functions get year, month
select Order_ID, Order_Date,
DATEPART(YEAR, Order_Date) as Year, DATEPART(MONTH, Order_Date) as Month
from Orders

--date functions get year, month, week
select Order_ID, Order_Date,
DATEPART(YEAR, Order_Date) as Year, DATEPART(MONTH, Order_Date) as Month, DATEPART(WEEK, Order_Date) as Week
from Orders

--date functions get month name
select Order_ID, Order_Date,
Datename (MONTH, Order_Date) as month
from Orders

select * from Orders;

-- date add fun : adds 5 days to current date
select Order_ID, Order_Date, DATEADD(day, 5, Order_Date) as orderDate5
from Orders

-- date add fun : adds 5 weeks to current date
select Order_ID, Order_Date, DATEADD(WEEK, 5, Order_Date) as orderDate5
from Orders

-- date add fun : subtract 5 days to current date
select Order_ID, Order_Date, DATEADD(day, -5, Order_Date) as orderDate5
from Orders

-- difference between 2 dates
select Order_ID, Order_Date, Ship_Date, DATEDIFF(DAY, Order_Date, Ship_Date )
as DeliveryDate 
from Orders

-- difference between 2 dates IN WEEKS
select Order_ID, Order_Date, Ship_Date, DATEDIFF(WEEK, Order_Date, Ship_Date )
as DeliveryDate 
from Orders

SELECT * FROM Orders;

--CASE STATEMENT : EXECUTED FROM TOP TO BOTTOM AND THEN BREAKS
SELECT ORDER_ID, PROFIT,
CASE
WHEN Profit < 0 THEN 'LOSS'
WHEN PROFIT < 100 THEN 'LOW PROFIT'
WHEN PROFIT < 250 THEN 'MEDIUM PROFIT'
WHEN PROFIT < 400 THEN 'HIGH PROFIT'
ELSE 'DHAMAKA'
END AS PROFIT_CAT
FROM ORDERS

-- 