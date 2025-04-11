select * from returns$;
select * from Orders;
EXEC sp_rename 'returns$.[Order Id]', 'Order_Id', 'COLUMN';
EXEC sp_rename 'returns$.[Return Reason]', 'ReturnReason', 'COLUMN';



-- database join
select * from orders o inner join returns$ r on o.Order_ID = r.Order_Id

-- distinct join
select distinct o.Order_ID from orders o inner join returns$ r on o.Order_ID = r.Order_Id

-- all cols from 1 table
select r.* from orders o inner join returns$ r on o.Order_ID = r.Order_Id

-- all col from 1 tabe and some col from 2nd table
select o.*, r.ReturnReason from orders o inner join returns$ r on o.Order_ID = r.Order_Id

--
select o.Order_ID, o.Product_ID, r.ReturnReason
from Orders o inner join returns$ r on o.Order_ID = r.Order_Id

-- put null in empty records - left join
select * from orders o left join returns$ r on o.Order_ID = r.Order_Id

-- those records that arent returned
select * from orders o left join returns$ r on o.Order_ID = r.Order_Id
where r.Order_Id IS NULL

-- sales of returned products
select r.ReturnReason, SUM(Sales) as Total_Sales from orders o left join returns$ r on o.Order_ID = r.Order_Id
group by r.ReturnReason

-- 2 more tables
create table employee(
    emp_id int,
    emp_name varchar(20),
    dept_id int,
    salary int,
    manager_id int,
    emp_age int
);


insert into employee values(1,'Ankit',100,10000,4,39);
insert into employee values(2,'Mohit',100,15000,5,48);
insert into employee values(3,'Vikas',100,10000,4,37);
insert into employee values(4,'Rohit',100,5000,2,16);
insert into employee values(5,'Mudit',200,12000,6,55);
insert into employee values(6,'Agam',200,12000,2,14);
insert into employee values(7,'Sanjay',200,9000,2,13);
insert into employee values(8,'Ashish',200,5000,2,12);
insert into employee values(9,'Mukesh',300,6000,6,51);
insert into employee values(10,'Rakesh',500,7000,6,50);
select * from employee;

create table dept(
    dep_id int,
    dep_name varchar(20)
);
insert into dept values(100,'Analytics');
insert into dept values(200,'IT');
insert into dept values(300,'HR');
insert into dept values(400,'Text Analytics');
select * from dept;

-- full join
select * from dept, employee order by employee.emp_age

-- same as above
select * from dept inner join employee on 100=100 order by employee.emp_age

select * from employee;
select * from dept;

--joined based on dept id
select * from employee e inner join dept d on e.dept_id = d.dep_id
select * from employee e left join dept d on e.dept_id = d.dep_id
select * from employee e right join dept d on e.dept_id = d.dep_id
select * from employee e full join dept d on e.dept_id = d.dep_id

-- 
create table people (manager varchar(20), region varchar (10));
insert into people values ('Ankit', 'West'),('Deepak', 'Eest'),
('Vishal', 'Central'),('Sanjay', 'South')
select * from people;

select o.Order_ID, o.Product_ID, r.ReturnReason, p.manager
from Orders o inner join returns$ r on o.Order_ID = r.Order_Id
inner join people p on p.region = o.Region