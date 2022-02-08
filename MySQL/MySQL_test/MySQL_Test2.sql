use carsshop;

drop table clients;

create table clients
(
id int auto_increment not null,
name varchar(25) not null,
age varchar(15) not null,
phone varchar(25) default 'Unknown',
data datetime not null,
primary key (id)
);

insert into clients
(name, age, data)
value ('Jeremy','20', now() );

select * from clients;

alter table clients add
newFild int null;

select * from clients;

alter table clients
drop column newFild;

alter table clients add
newFild2 varchar(10) not null
default 'Unknown';

select * from clients;


use carsshop;

drop table clients;

create table clients
(
id int not null,
name varchar(25) not null,
age int not null,
phone varchar(15) default 'Unknown',
primary key (id)
);

insert into clients
(id, name, age, phone)
value
(1, 'Petro', 25, '(093)1231212'),
(2, 'Vasya', 18, '(095)2313244');

insert into clients
(id, name, age, phone)
value
(1, 'Semen', 19, '(063)4533272');

select * from clients;

drop table clients;

create table clients
(
id int not null,
name varchar(25) not null,
age int not null,
phone varchar(15) default 'Unknown',
primary key (id,name)
);

insert into clients
(id, name, age, phone)
value
(1, 'Petro', 25, '(093)1231212'),
(2, 'Vasya', 18, '(095)2313244');

insert into clients
(id, name, age, phone)
value
(1, 'Semen', 19, '(063)4533272');

select * from clients;

drop table clients;

create table clients
(
id int auto_increment not null,
name varchar(25) not null,
age varchar(15) not null,
phone varchar(25) default 'Unknown',
primary key (id));

drop table cars;

create table cars
(
id int auto_increment not null,
client_id int not null,
mark varchar(20) not null,
model varchar(20) not null,
foreign key(client_id) references clients(id),
primary key(id)
);

insert into clients
(name, age, phone)
values
('Petrenko Petr Petrocivh', 25,'(09312311212)'),
('Ivanenko Ivan Ivnovich', 35,'(095)2313244');

insert into cars
(client_id, mark, model)
values
(1, 'Audi', 'A5'),
(2,'Porsche','Panamers'),
(2,'Fiat','500'),
(1,'VAZ','Kalina');

select id, name, age from clients;
select * from cars;

insert into cars
(client_id, mark, model)
value
(3, 'Renault', 'Twizy');

drop table cars;

create table cars
(
id int auto_increment not null,
client_id int not null,
mark varchar(20) not null,
model varchar(20) not null,
primary key(id)
);

alter table cars
add constraint fk_clients_id
foreign key (client_id) references clients(id);

drop table clisents;

alter table cars
drop foreign key fk_clients_id;

alter table cars
add constraint fk_client_id
foreign key (client_id) references clients(id)
on delete cascade on update cascade;

delete from clients
where name='Petrenko Petr Petrovich';

select * from clients;
select * from cars;

use carsshop;

drop table cars;
drop table clients;

create table clients
(
id int auto_increment not null,
name varchar(25) not null,
age varchar(15) not null,
phone char(12),
primary key (id)
);

create table cars
(
id int auto_increment not null,
client_id int not null,
mark varchar(20) not null,
model varchar(20) not null,
primary key (id),
foreign key(client_id) references clients(id)
);

insert into clients
(name, age, phone)
values
('Petro','25','(093)1231212'),
('Vasya','18','(095)2313244');

insert into cars
(client_id, mark, model)
values
(1,'BMW','M3'),
(2,'Lada','Calina');

select name, age from clients;
select * from cars;

insert into cars
(client_id, mark, model)
values
(1,'BMW','525');

select * from clients;

----------------------------------------------------------------

drop table clients;
drop table cars;

create table clients
(
id int auto_increment not null,
name varchar(25) not null,
age varchar(15) not null,
phone varchar(25) default 'Unknown',
primary key (id)
);

create table cars
(
id int auto_increment not null,
client_id int not null unique,
mark varchar(20) not null,
model varchar(20) not null,
primary key (id),
foreign key(client_id) references clients(id)
);

insert into clients
(name, age, phone)
values
('Petro','25','(093)1231212'),
('Vasya','18','(095)2313244');

insert into cars
(client_id, mark, model)
values
(1,'Audi','A5'),
(2,'Lada','priora');

insert into cars
(client_id, mark, model)
values
(1,'BMW','525');

-----------------------------------

create table students
(
Studentid int not null auto_increment,
Fname varchar(30) not null,
Lname varchar(30) not null,
Email varchar(30) not null,
Phone varchar(30) not null,
primary key (Studentid)
);

create table courses
(
Courseid int not null auto_increment,
Coursename varchar(50) not null,
Price double(10,2) not null,
primary key (Courseid)
);

create table studentscourses
(
Studentid int not null,
Courseid int not null,
primary key (Studentid, Courseid),
foreign key (Studentid) references Students(Studentid),
foreign key (Courseid) references Courses(Courseid)
);

insert into Students
(Fname, Lname, Email, Phone)
values
('Petro', 'Petrov', 'PetrovPetrenko@mail.com','(093)1231212'),
('Ivan','Ivanov','Ivanenkoivan@mail.com','(095)2313144'),
('Fedor','Fedorov','MaximovMax@mail.com','(095)7658786');

insert into Courses
(Coursename, Price)
values
('SQL Essential', 100.00),
('C# Professional', 200.00),
('ASP.NET MVC', 300.00),
('Patterns Gof',400.00);

insert into studentscourses
(Studentid, Courseid)
values
(1,1),
(2,1),
(3,3),
(3,1),
(2,2);

select * from students;
select * from studentscourses;
select * from courses;