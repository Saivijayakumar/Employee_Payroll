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
