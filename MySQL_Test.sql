create database carsshop; #create a database

use carsshop; #use the database

create table clients
(
id int auto_increment not null,
name varchar(20),
age tinyint,
phone varchar(15),
primary key(id)
);   #create a table

use crasshop;

create table cars
(
car_id int auto_increment not null,
mark varchar(10) not null,
model varchar(20) not null,
speed int not null,
price int not null,
primary key(car_id)
);

insert into cars
(mark,model,speed,price)
value
('BMW','320d','225','36000'); #add data

insert into cars
(mark,model,speed,price)
value
('Audi','A5','250','50000');


insert into cars
(mark,model,speed,price)
value
('Porsche','911','285','100000');

use carsshop;

select * from cars;   #Data sampling

select mark from cars;

select model from cars;

insert into clients(name, age, phone) value('aa','23','555555');
insert into clients(name, age, phone) value('dd','40','666666');
insert into clients(name, age, phone) value('cc','32','777777');
insert into clients(name, age, phone) value('vv','28','888888');
insert into clients(name, age, phone) value('bb','18','999999');

select name,age,phone from clients;

select * from carsshop.clients
where id=1;#Fetch data by condition

select * from carsshop.clients
where id>2;

select * from carsshop.clients
where id between 2 and 4;

select * from carsshop.clients
where name='aa' or name='bb';

select * from carsshop.clients
where not name='vv';

select name, age from carsshop.clients
where name='aa' or name='bb';

select name, age from carsshop.clients
where phone like '8%';

select * from carsshop.clients where age in ('55','23','40');

select * from carsshop.cars order by model;

select * from carsshop.cars order by mark;

select * from carsshop.cars order by speed asc;

select * from carsshop.cars order by speed desc;

select car_id as id, sum(speed) as Total
from carsshop.cars
where speed in (225, 240, 250)
group by model;

select count(*) as emp
from carsshop.cars;

select mark, avg(speed) as average_speed
from carsshop.cars
group by mark
having avg(speed) > 230;

insert clients
(name,age,phone)
value ('Max',28,'050******');

select * from clients;

update clients
set age = 29
where name = 'Max'; #data changes

select * from clients;

update clients 
set name='Testname',phone='000******'
where name = 'max';

delete from clients where name='testname'; #delete data

delete from clients; # delete table

select * from cliemts;