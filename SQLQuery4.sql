select * from Orders;

update Orders
set city = null
where Order_ID in ('CA-2020-161389', 'US-2021-156909')

select * from Orders
where City IS NULL

select * from Orders
where City IS NOT NULL

--aggregation

select count(*) as Count
from Orders;

select count(distinct Category)
from orders



select count(*) as Count,
sum (sales) as Total_Sales
from Orders;

select count(*) as Count, 
SUM(Sales) as Total_sales,
MAX(Sales) as High,
MIN(Sales) as Low,
AVG(Sales) as Average
from Orders;

select top 1 * from Orders 
order by sales desc

select Region, count(*) as Count, 
SUM(Sales) as Total_sales,
MAX(Sales) as High,
MIN(Sales) as Low,
AVG(Sales) as Average
from Orders
Group by Region;

select Region, SUM(Sales) as Total_sales
from Orders
where profit > 50
Group by Region;

select sub_category, sum(sales) as Total_Sales
from orders
where profit > 50
group by Sub_Category
having sum(sales) > 100000
order by Total_Sales desc












