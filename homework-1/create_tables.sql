-- SQL-команды для создания таблиц
create table emploees(
	employee_id int primary key,
	first_name text,
	last_name text,
	title text,
	birth_dat date,
	notes text);

create table customers(
	customer_id varchar(50) primary key,
	company_name text,
	contact_name text);

create table orders(
	order_id int,
	order_date date,
	ship_city text,
	employee_id int references emploees(employee_id),
	customer_id varchar(50) references customers(customer_id))