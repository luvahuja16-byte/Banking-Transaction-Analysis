create database banking;
use banking;
create table customers(
customer_id int primary key auto_increment,
first_name varchar(50),
last_name varchar(50),
gender varchar(10),
city varchar(50),
phone varchar(15),
email varchar(100)
);
create table accounts(
account_id int primary key auto_increment,
customer_id int,
account_type varchar(20),
balance decimal(12,2),
opening_date date,
foreign key (customer_id) references customers (customer_id)
);
create table transactions(
transaction_id int primary key auto_increment,
account_id int,
transaction_date date,
transaction_type varchar(20),
amount decimal(10,2),
description varchar(100),
foreign key (account_id) references accounts (account_id)
);
insert into customers
(first_name,last_name,gender,city,phone,email)
values
('john','smith','male','delhi','9876543210','john@gmail.com'),
('emma','johnson','female','mumbai','9876543211','emma@gmail.com'),
('michael','brown','male','bangaore','9876543212','michael@gmail.com'),
('sohphia','davis','female','kolkata','9876543213','sohphai@gmail.com'),
('david','wilson','male','hyderabad','9876543214','david@gmailcom');
insert into accounts
(customer_id,account_type,balance,opening_date)
values
(1,'savings',85000,'2023-01-10'),
(2,'current',120000,'2022-05-18'),
(3,'savings',65000,'2024-2-11'),
(4,'saving',92000,'2021-11-15'),
(5,'current',45000,'2023-07-20');
insert into transactions
(account_id,transaction_date,transaction_type,amount,description)
values
(1,'2025-01-02','deposit',25000,'salary credit'),
(1,'2025-01-05','withdrawal',5000,'atm withdrawal'),
(1,'2025-01-10','transfer',7000,'upi transfer'),

(2,'2025-01-03','deposit',40000,'business income'),
(2,'2025-01-07','withdrawl',10000,'cheque payment'),
(2,'2025-01-15','transfer',15000,'vendor payment'),

(3,'2025-01-04','deposit',20000,'salary'),
(3,'2025-01-08','withdrawal',3000,'atm'),
(3,'2025-01-18','transfer',5000,'electricity bill'),

(4,'2025-01-06','deposit',30000,'salary'),
(4,'2025-01-11','withdrawal',8000,'shopping'),
(4,'2025-01-20','transfer',6000,'insurance'),

(5,'2025-01-09','deposit',15000,'cash deposit'),
(5,'2025-01-14','withdrawal',4000,'atm'),
(5,'2025-01-21','transfer',9000,'rent');
select * from customers;
select * from accounts;
select * from transactions;
-- 1
select sum(balance) as total_balance 
from accounts;
-- 2
select avg(balance) as average_balance
from accounts;
-- 3
select max(balance) as highest_balance
from accounts;
-- 4
select min(balance) as lowest_balance
from accounts;
-- 5
select sum(amount) as total_deposits
from transactions
where transaction_type='deposit';
-- 6
select sum(amount) as total_withdrawals
from transactions
where transaction_type='withdrawal';
-- 7
select transaction_type,
count(*) as total
from transactions
group by transaction_type;
-- 8
select c.first_name,
c.last_name,
a.account_type,
a.balance
from customers c
join accounts a
on c.customer_id=a.customer_id;
-- 9
select account_id,
sum(amount) as total_transaction
from transactions
group by account_id;
-- 10
select c.first_name,
c.last_name,
a.balance
from customers c
join accounts a 
on c.customer_id=a.customer_id
where a.balance>80000;
-- 11
select c.first_name,
c.last_name,
a.balance
from customers c
join accounts a
on c.customer_id=a.customer_id
order by a.balance desc
limit 3;
-- 15
select month(transaction_date) as month,
sum(amount) as total_amount
from transactions
group by month(transaction_date);