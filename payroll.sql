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
