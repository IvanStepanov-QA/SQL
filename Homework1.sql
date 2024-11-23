/* Создать таблицу employees
- id. serial,  primary key,
- employee_name. Varchar(50), not null
Наполнить таблицу employee 70 строками. */
CREATE TABLE employees(
	id serial primary key,
	employee_name Varchar(50) not null
);


INSERT INTO employees(employee_name)
VALUES ('Alice'), ('Bob'), ('Charlie'), ('David'), ('Eve'), 
       ('Frank'), ('Grace'), ('Hannah'), ('Ivan'), ('Jack'), 
       ('Karen'), ('Leo'), ('Mia'), ('Nina'), ('Oscar'), 
       ('Paul'), ('Quincy'), ('Rachel'), ('Steve'), ('Tina'), 
       ('Uma'), ('Victor'), ('Wendy'), ('Xavier'), ('Yara'), 
       ('Zack'), ('Amy'), ('Brian'), ('Clara'), ('Derek'), 
       ('Ella'), ('Felix'), ('Georgia'), ('Henry'), ('Isla'), 
       ('Jake'), ('Kelly'), ('Liam'), ('Mason'), ('Nora'), 
       ('Olivia'), ('Peter'), ('Quinn'), ('Ryan'), ('Sophia'), 
       ('Tom'), ('Ursula'), ('Vera'), ('Will'), ('Xena'), 
       ('Yvonne'), ('Zara'), ('Abel'), ('Bella'), ('Chris'), 
       ('Diana'), ('Elliot'), ('Faith'), ('Gavin'), ('Hazel'), 
       ('Ian'), ('Julia'), ('Kevin'), ('Lara'), ('Miles'), 
       ('Naomi'), ('Owen'), ('Paula'), ('Quinn'), ('Rose');

/* Создать таблицу salary
- id. Serial  primary key,
- monthly_salary. Int, not null
Наполнить таблицу salary 16 строками: */      
CREATE TABLE salary (
    id serial primary key,
    monthly_salary INT NOT NULL
);

INSERT INTO salary (monthly_salary)
VALUES 
    (1000), (1100), (1200), (1300), 
    (1400), (1500), (1600), (1700), 
    (1800), (1900), (2000), (2100), 
    (2200), (2300), (2400), (2500);

select * from salary;

/* Создать таблицу employee_salary
- id. Serial  primary key,
- employee_id. Int, not null, unique
- salary_id. Int, not null
Наполнить таблицу employee_salary 40 строками:
- в 10 строк из 40 вставить несуществующие employee_id */
create table employee_salary (
	id serial primary key,
	employee_id int not null unique, 
	salary_id int not null
);

INSERT INTO employee_salary (employee_id, salary_id)
VALUES
    (1, 1), (2, 2), (3, 3), (4, 4), (5, 5),
    (6, 6), (7, 7), (8, 8), (100, 9), (10, 10),
    (11, 11), (88, 12), (13, 13), (89, 14), (15, 15),
    (16, 16), (17, 1), (74, 2), (19, 3), (20, 4),
    (333, 5), (22, 6), (23, 7), (1488, 8), (93, 9),
    (26, 10), (27, 11), (28, 12), (29, 13), (30, 14),
    (346, 15), (47, 16), (777, 1), (49, 2), (50, 3),
    (45, 4), (44, 5), (43, 6), (999, 7), (41, 8);

/* Создать таблицу roles
- id. Serial  primary key,
- role_name. int, not null, unique
Поменять тип столба role_name с int на varchar(30)
Наполнить таблицу roles 20 строками: */
create  table roles(
	id serial primary key,
	role int not null unique
);

alter table roles
alter column role type varchar(30);

insert into roles(role)
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


/* Создать таблицу roles_employee
- id. Serial  primary key,
- employee_id. Int, not null, unique (внешний ключ для таблицы employees, поле id)
- role_id. Int, not null (внешний ключ для таблицы roles, поле id)
Наполнить таблицу roles_employee 40 строками: */
create table roles_employee(
	id serial primary key,
	employee_id int not null unique,
	role_id int not null, 
	foreign key (employee_id)
		references employees(id),
	foreign key (role_id)
		references roles(id)
);

insert into roles_employee (employee_id, role_id)
values (7, 2), (20, 4), (3, 9), (5, 13), (23, 4), (11, 2), (10, 9), (22, 13), (21, 3), (34, 4), (6, 7),
    (8, 13), (9, 10), (30, 2), (12, 5), (14, 1), (15, 6), (16, 8), (17, 5), (18, 3), (19, 7),
    (1, 2), (2, 6), (4, 1), (55, 4), (24, 10), (25, 9), (26, 5), (27, 3), (28, 7), (29, 6),
    (60, 2), (31, 8), (32, 5), (33, 1), (44, 6), (35, 2), (36, 4);

   select * from employees;
   select * from employee_salary; 
   select * from roles;
   select * from roles_employee;