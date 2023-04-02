--SQL_DDL
--Первая часть
--
--Таблица emloyees
--1) Создать таблицу emloyees

create table employees(
	id serial primary key,
	employee_name Varchar(50) not null
);
--------------------------------------
--2) Наполнить таблицу employees 70 строками. 

insert into employees(employee_name)
values('Olivia'),
      ('Ava'),
      ('Amelia'),
      ('Emily'),
      ('Jessica'),
      ('Isla'),
      ('Isabella'),
      ('Poppy'),
      ('Mia'),
      ('Sophie'),
      ('Lily'),
      ('Ruby'),
      ('Evie'),
      ('Sophia'),
      ('Chloe'),
      ('Scarlett'),
      ('Freya'),
      ('Isabelle'),
      ('Phoebe'),
      ('Alice'),
      ('Ellie'),
      ('Bethany'),
      ('Maryam'),
      ('Heidy'),
      ('Paige'),
      ('Faith'),
      ('Rose'),
      ('Ivy'),
      ('Florence'),
      ('Hurriet'),
      ('Maddison'),
      ('Zoe'),
      ('Samuel'),
      ('Jack'),
      ('Joseph'),
      ('Harry'),
      ('Alfie'),
      ('Jacob'),
      ('Thomas'),
      ('Charlie'),
      ('Oscar'),
      ('James'),
      ('William'),
      ('Joshua'),
      ('George'),
      ('Ethan'),
      ('Noah'),
      ('Archie'),
      ('Henry'),
      ('Leo'),
      ('John'),
      ('Oliver'),
      ('David'),
      ('Ryan'),
      ('Dexter'),
      ('Connor'),
      ('Albert'),
      ('Austin'),
      ('Stanley'),
      ('Theodore'),
      ('Owen'),
      ('Caleb'),
      ('Hana'),
      ('Sandra'),
      ('Pamela'),
      ('Nicole'),
      ('Lora'),
      ('Caroline'),
      ('Melanie'),
      ('Jenna');
     
 ===========================================
-- Таблица salaries 
-- 3)Создать таблицу salaries
     
create table salaries(
	id serial primary key,
	monthly_salaries int not null
);

--------------------------------------
--4) Наполнить таблицу salaries 15 строками 

insert into salaries(monthly_salaries)
values (1000),
       (1100),
       (1200),
       (1300),
       (1400),
       (1500),
       (1600),
       (1700),
       (1800),
       (1900),
       (2000),
       (2100),
       (2200),
       (2300),
       (2400);
===================================================

--Таблица employee_salary
--5) Создать таблицу emplyee_salary

create table emplyee_salary(
	id serial primary key,
	emplyee_id int not null unique,
	salary_id int not null
);
----------------------------------------

--Наполнить таблицу emplyee_salary 40 строками. 
--В 10 строках из 40 всавить несуществующие emplyee_id

insert into emplyee_salary(emplyee_id, salary_id)
values(1,2),
      (2,1),
      (3,15),
      (4,13),
      (5,14),
      (6,11),
      (7,10),
      (8,9),
      (9,8),
      (10,7),
      (75,7),
      (88,6),
      (98,6),
      (100,10),
      (309,11),
      (15,12),
      (16,13),
      (17,14),
      (18,15),
      (19,5),
      (20,4),
      (21,2),
      (22,2),
      (23,1),
      (24,11),
      (25,9),
      (101,8),
      (166,7),
      (234,6),
      (95,10),
      (111,11),
      (60,12),
      (59,13),
      (58,14),
      (57,15),
      (56,5),
      (55,4),
      (54,3),
      (53,2),
      (52,1);
      
====================================

--Таблица roles    
--7) Создать таблицу roles1
     
create table roles1(
	id serial primary key,
	role_name int not null unique
);    

--------------------------------------
--8) Поменять тип столбца role_name с int на varchar(30)
alter table roles1 alter column role_name type VARCHAR(30);

----------------------------------------------------------
--9) Наполнить таблицу roles1 20 строками

insert into roles1(role_name)
values  ('Junior Python developer'),
	    ('Middle Python developer'),
		('Senior Python developer'),
		('Junior Java developer'),
		('Middle Java developer'),
		('Senior Java developer'),
		('Junior JavaScript developer'),
		('Middle JavaScript developer'),
		('Senior JavaScript developer'),
		('Junior Manual QA engineer'),
		('Middle Manual QA engineer'),
		('Senior Manual QA engineer'),
		('Project Manager'),
		('Designer'),
		('HR'),
		('CEO'),
		('Sales manager'),
		('Junior Automation QA engineer'),
		('Middle Automation QA engineer'),
		('Senior Automation QA engineer');

====================================================

--Таблица roles_employees
--10) Создать таблицу roles_employees

create table roles_employees(
	id serial primary key,
	employee_id int not null unique,
	role_id int not null,
	foreign key (employee_id)
			references employees(id),
	foreign key (role_id)
			references roles1(id)
);

--11) Наполнить таблицу roles_employees

insert into roles_employees(employee_id, role_id)
values (65, 20),
	   (55, 10),
	   (44, 5),
	   (33, 1),
	   (22, 2),
	   (11, 3),
	   (1, 4),
	   (2, 6),
	   (3, 7),
	   (4, 8),
	   (5, 9),
	   (12, 15),
	   (13, 14),
	   (14, 13),
	   (15, 12),
	   (16, 11),
	   (17, 16),
	   (18, 17),
	   (19, 18),
	   (20, 19),
	   (21, 20),
	   (23, 10),
	   (24, 15),
	   (25, 5),
	   (26, 1),
	   (27, 2),
	   (64, 3),
	   (63, 4),
	   (62, 6),
	   (58, 7),
	   (52, 8),
	   (53, 9),
	   (47, 14),
	   (49, 13),
	   (36, 12),
	   (31, 11),
	   (38, 1),
	   (41, 18),
	   (68, 17),
	   (54, 16);



