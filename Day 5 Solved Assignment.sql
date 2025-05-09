select * from Orders

-- 1- write a query to get region wise count of return orders
select region,count(distinct o.order_id) as no_of_return_orders
from orders o
inner join returns$ r on o.order_id=r.order_id
group by region

--2- write a query to get category wise sales of orders that were not returned
select category,sum(o.sales) as total_sales
from orders o
left join returns$ r on o.order_id=r.order_id
where r.order_id is null
group by category

--3- write a query to print dep name and average salary of employees in that dep .
select * from dept
select * from employee

select d.dep_name, avg(e.salary) as avg_salary
from dept d inner join employee e on d.dep_id = e.dept_id
group by d.dep_name

--4- write a query to print dep names where none of the emplyees have same salary.
select d.dep_name
from employee e
inner join dept d on e.dept_id=d.dep_id
group by d.dep_name
having count(e.emp_id)=count(distinct e.salary)


-- 5- write a query to print sub categories where we have all 3 kinds of returns (others,bad quality,wrong items)
select o.sub_category
from orders o
inner join returns$ r on o.order_id=r.order_id
group by o.Sub_Category
having count(distinct r.returnreason)=3

-- 6- write a query to find cities where not even a single order was returned.
select city
from orders o
left join returns$ r on o.order_id=r.order_id
group by city
having count(r.order_id)=0

-- 7- write a query to find top 3 subcategories by sales of returned orders in east region
select top 3 sub_category,sum(o.sales) as return_sales
from orders o
inner join returns$ r on o.order_id=r.order_id
where o.region='East'
group by sub_category
order by return_sales  desc

--8- write a query to print dep name for which there is no employee
select d.dep_id,d.dep_name
from dept d 
left join employee e on e.dept_id=d.dep_id
group by d.dep_id,d.dep_name
having count(e.emp_id)=0;

--9- write a query to print employees name for which dep id is not avaiable in dept table
select e.*
from employee e 
left join dept d  on e.dept_id=d.dep_id
where d.dep_id is null;
