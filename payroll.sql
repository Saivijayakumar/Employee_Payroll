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
-----------------UC7-----------
----Shows the total salary of all employee
select sum(Salary) as TotalSalary from employee_payroll;
---shows both male and female total salary individual 
select Gender,sum(Salary) as TotalSalary from employee_payroll group by Gender;
---shows only female group salary
select Gender,sum(Salary) as TotalSalary from employee_payroll group by Gender having Gender='F';
-----------------UC8------------
alter table employee_payroll add PhoneNumber bigint;

alter table employee_payroll add Department varchar(200) not null default 'IT';

alter table employee_payroll add Address varchar(250);

update employee_payroll set PhoneNumber=984848384 , Address= 'chennai',Department = 'COMMUNICATION' where Id = 4;

update employee_payroll set PhoneNumber=8484848384 , Address= 'Nellore',Department = 'HR' where Id = 2;

update employee_payroll set PhoneNumber=994848384,Department = 'HELP DESK'  where Id = 5;

select Gender,avg(Salary) as AverageSalary from employee_payroll group by Gender having Gender='F';
---finding minimum salary in female group
select Gender,min(Salary) as MinimuSalary from employee_payroll group by Gender having Gender='F';
select Gender,Salary from employee_payroll where Gender = 'F';
select Name,Gender,Salary from employee_payroll where Salary=(select max(Salary) from employee_payroll group by Gender having Gender='F');
---finding maximum salary in male group
select Gender,max(Salary) as MaximuSalary from employee_payroll group by Gender having Gender='M';
select Gender,Salary from employee_payroll where Gender = 'M';
select Name,Gender,Salary from employee_payroll where Salary=(select max(Salary) from employee_payroll group by Gender having Gender='M');
