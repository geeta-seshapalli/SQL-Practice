select * from Orders;

select *
from Orders
where Quantity between 3 and 5
order by Quantity desc;

select * from Orders
where Ship_Mode in ('First Class', 'Same Day');

select top 5 * from Orders
where Quantity in (3,5,4)
order by Quantity desc;

select distinct Ship_Mode from Orders
where Ship_Mode = 'First Class' or Ship_Mode = 'Same Day';

select cast (Order_Date as date) as order_date_new, *
from Orders;

select cast (Order_Date as date) as order_date_new, *
from Orders
where cast (Order_Date as date) = '2020-11-08';

select *, Profit / Sales as Ratio, Profit * Discount as Misc, getdate() as Today
from Orders
order by Order_Date

select Order_ID, Order_Date, Customer_Name
From Orders
Where Customer_Name like 'Chris%'

select Order_ID, Order_Date, Customer_Name
From Orders
Where Customer_Name like '%allen'

select Order_ID, Order_Date, Customer_Name
From Orders
Where Customer_Name like '%ven%'

select Order_ID, Order_Date, Customer_Name
From Orders
Where Customer_Name like 'a%a'

select Order_ID, Order_Date, Customer_Name, upper (Customer_Name) as Upper
From Orders
Where Customer_Name like '%allen'

select Order_ID, Order_Date, Customer_Name, upper (Customer_Name) as Upper
From Orders
Where(Customer_Name) like '_l%'

--% 0 or more
-- _ one char

select Order_ID, Order_Date, Customer_Name, upper (Customer_Name) as Upper
From Orders
Where(Customer_Name) like '_l%' escape '%';

-- Geeta% Seshapalli


-- start with C second char is A/L rest anything
-- if you give = after where it will do exat matching
select Order_ID, Order_Date, Customer_Name, upper (Customer_Name) as Upper
From Orders
Where(Customer_Name) like 'C[albo]%';

--second char is not O/R
select Order_ID, Order_Date, Customer_Name, upper (Customer_Name) as Upper
From Orders
Where(Customer_Name) like 'C[^or]%';

-- second char can range from a to o
select Order_ID, Order_Date, Customer_Name, upper (Customer_Name) as Upper
From Orders
Where(Customer_Name) like 'C[a-o]%'
order by Customer_Name;

-- second char cannot range from a to o
select Order_ID, Order_Date, Customer_Name, upper (Customer_Name) as Upper
From Orders
Where(Customer_Name) like 'C[^a-h]%'
order by Customer_Name;

select Order_ID, Order_Date, Customer_Name
From Orders
Where(Order_ID) like 'CA-202[1-5]%'
order by Order_ID;





























