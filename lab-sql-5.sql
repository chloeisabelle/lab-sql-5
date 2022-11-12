-- Q1 Drop column picture from staff.- 
alter table staff
drop column picture;
select * from staff;

-- Q2 A new person is hired to help Jon. Her name is TAMMY SANDERS, and she is a customer. Update the database accordingly.- 

Select * from customer
where first_name = 'Tammy';

insert into staff
values ('100', 'Tammy', 'Sanders', '2', 'tammy.sanders@sakilastaff.com', '1', '1', 'Tammy', '', '2022-11-12 03:57:16');

-- Q3 Add rental for movie "Academy Dinosaur" by Charlotte Hunter from Mike Hillyer at Store 1. You can use current date for the rental_date column in the rental table.--

select customer_id from sakila.customer
where first_name = 'CHARLOTTE' and last_name = 'HUNTER';
-- Customer ID is 130-

select inventory_id from sakila.inventory
where film_id = 1;
-- inventory iD = ?  Not sure how to narrow this down 

select film_id from sakila.film
where title = 'ACADEMY DINOSAUR';
-- Film ID is 1

select staff_id from sakila.staff
where last_name = 'Hillyer';
-- Staff ID is 1

select * from rental; 
-- need inventory_id + customer_id + staff_id + film_id

insert into rental
values ('100000', '2022-11-12 16:03:39', '1', '130', '2022-11-12 16:03:39', '1', '2022-11-12 16:03:39'); 
-- I don't know what is correct for Rental_Id - How do you get it to be the next number in sequence?

-- Delete non-active users, but first, create a backup table 

CREATE TABLE backup_table (
  `Customer_id` int UNIQUE NOT NULL, -- AS PRIMARY KEY
  `Email` char(20) DEFAULT NULL,
  `Date` varchar(20) DEFAULT NULL, -- char() , varchar(255)
  CONSTRAINT PRIMARY KEY (Customer_id)  -- constraint keyword is optional but its a good practice
);



select customer_id, email, create_date from sakila.customer
where active = '0';

insert into backup_table
values
('16','SANDRA.MARTIN@sakilacustomer.org','2006-02-14 22:04:36'),
('64','JUDITH.COX@sakilacustomer.org','2006-02-14 22:04:36'),
('124','SHEILA.WELLS@sakilacustomer.org','2006-02-14 22:04:36'),
('169','ERICA.MATTHEWS@sakilacustomer.org','2006-02-14 22:04:36'),
('241','HEIDI.LARSON@sakilacustomer.org','2006-02-14 22:04:36'),
('271','PENNY.NEAL@sakilacustomer.org','2006-02-14 22:04:36'),
('315','KENNETH.GOODEN@sakilacustomer.org','2006-02-14 22:04:37'),
('368','HARRY.ARCE@sakilacustomer.org','2006-02-14 22:04:37'),
('406','NATHAN.RUNYON@sakilacustomer.org','2006-02-14 22:04:37'),
('446','THEODORE.CULP@sakilacustomer.org','2006-02-14 22:04:37'),
('482','MAURICE.CRAWLEY@sakilacustomer.org','2006-02-14 22:04:37'),
('510','BEN.EASTER@sakilacustomer.org','2006-02-14 22:04:37'),
('534','CHRISTIAN.JUNG@sakilacustomer.org','2006-02-14 22:04:37'),
('558','JIMMIE.EGGLESTON@sakilacustomer.org','2006-02-14 22:04:37'),
('592','TERRANCE.ROUSH@sakilacustomer.org','2006-02-14 22:04:37');

select * from backup_table;

select * from customer;

-- *** Need help please to do the last step - delete the non active users from the cutomer table
delete from customer where active = 0;