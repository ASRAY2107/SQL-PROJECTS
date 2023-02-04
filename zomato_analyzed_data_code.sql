create database zomato_database;
-- drop database zomato_databse;
CREATE TABLE goldusers_signup(user_id int,gold_signup_date varchar(50)); 

INSERT INTO goldusers_signup(user_id,gold_signup_date) 
 VALUES (1,'09-22-2017'),
(3,'04-21-2017');
use zomato_database;
select * from goldusers_signup;

CREATE TABLE users(userid integer,signup_date varchar(50)); 
drop table users;

INSERT INTO users(userid,signup_date) 
 VALUES (1,'09-02-2014'),
(2,'01-15-2015'),
(3,'04-11-2014');
select * from users;

CREATE TABLE sales(userid integer,created_date varchar(50),product_id integer); 

INSERT INTO sales(userid,created_date,product_id) 
 VALUES (1,'04-19-2017',2),
(3,'12-18-2019',1),
(2,'07-20-2020',3),
(1,'10-23-2019',2),
(1,'03-19-2018',3),
(3,'12-20-2016',2),
(1,'11-09-2016',1),
(1,'05-20-2016',3),
(2,'09-24-2017',1),
(1,'03-11-2017',2),
(1,'03-11-2016',1),
(3,'11-10-2016',1),
(3,'12-07-2017',2),
(3,'12-15-2016',2),
(2,'11-08-2017',2),
(2,'09-10-2018',3);
select * from sales;

CREATE TABLE product(product_id integer,product_name text,price integer); 

INSERT INTO product(product_id,product_name,price) 
 VALUES
(1,'p1',980),
(2,'p2',870),
(3,'p3',330);


select * from sales;
select * from product;
select * from goldusers_signup;
select * from users;
-- 
--  what is the total amount each customer spent on zomato
select s.userid,sum(p.price) as total_amount
from sales s 
join product p
on s.product_id = p.product_id
group by s.userid;

--  how many days has each cutomer has visited zomato ?

select userid,count(distinct created_date ) as date from sales group by userid;

--  first product purchase by each  cutomer?

select *,rank() over(partition by userid order by created_date)as ranks from sales;

--  what is the most purchased item on the menu and how many timeswas it purchased by all customers ?

select product_id,count(product_id) from sales group by product_id order by count(product_id) desc limit 1;
 
--  which item is most popular for each of the customers ?

select userid,product_id ,count(product_id) as most_purchased from sales group by userid,product_id;



--  which item was purchased first after they became a member ?
select s.userid,s.created_date,s.product_id,b.gold_signup_date from sales s
inner join goldusers_signup  b 
on s.userid = b.user_id;

-- what is the total order and amount spent for each member before they became a member ?

select userid,count(created_date),sum(price) from
(select c. *, d.price from
(select s.userid,s.created_date,s.product_id,b.gold_signup_date from sales s
inner join goldusers_signup  b 
on s.userid = b.user_id and created_date <= gold_signup_date) c
 join product d 
 on c.product_id = d.product_id) e
 group by userid;

-- NOTE -> IF YOU WANT TO ACCESS THE CODE JUST RUN IT ON ANY OF THE COMPILER LIKE MYSQL.
--         ZOMATO DATA ANALYSIS -- 


-- END OF THE PROJECT -- 