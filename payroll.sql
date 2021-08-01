---------UC1--------------
create database payroll_services;
use payroll_services;
----------UC2------------
create table employee_payroll
(
Id int identity(1,1) primary key,
Name varchar(200) not null,
Salary float not null,
StartDate date
);
--For delete a table =>drop table employee_payroll;
----------UC3---------
insert into employee_payroll(Name,StartDate,Salary) values ('Ram','2020-09-3',19448),('Ravi','2010-08-3',99448),('sai','2021-06-21',909448);
----Used to delete all rows in table -->delete from employee_payroll;
----Used to delete specified rows in table -->delete from employee_payroll where condition;
-------------UC4----------
select * from employee_payroll;
------------UC5------------
select Name,Salary from employee_payroll where name = 'sai';
--changing string to date by using cast 
select * from employee_payroll where StartDate between cast('2020-01-1' as date) and getdate();
-----------UC6--------------
insert into employee_payroll values ('Ramya',29448,'2020-07-21'),('Ravali',90448,'2010-09-6');

alter table employee_payroll add Gender char(1);
---effect all rows----------
update employee_payroll set Gender='M';
---------effect  according to condition---(or) both should update--
update employee_payroll set Gender='F' where Id = 4 or Id = 5;

