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
--------------------UC9----------------
---using stored procedure (sp_rename) to rename existing colum
Exec sp_rename 'employee_payroll.Salary','Base_Pay','COLUMN';

alter table employee_payroll add TaxablePay float , Deductions float ,NetPay float,IncomeTax float ;

update employee_payroll set Deductions=11.4 ,NetPay=2300,TaxablePay=100,IncomeTax=33 where Gender='F';

update employee_payroll set Deductions=19.4 ,NetPay=200,TaxablePay=100,IncomeTax=23 where Gender='M';

update employee_payroll set Deductions=20.0 ,NetPay=500,TaxablePay=300,IncomeTax=203 where Department='HR';
----------------UC10----------------
Insert into employee_payroll values ('Terissa',203939,'1998-03-09','M',98448483992,'Sales and Marketing','AP',400,10.05,3000,300);
select * from employee_payroll;
---------------- UC11: ER Diagram-------------------
--Creating Table for Company
Create Table Company
(CompanyID int identity(1,1) primary key,
CompanyName varchar(100));
--Insert Values into Company table
Insert into Company values ('TCS'),('OCS'),('TATA');
Select * from Company;

--Creating Employee Table
create table Employee
(EmployeeID int identity(1,1) primary key,
CompanyIdentity int,
EmployeeName varchar(200),
EmployeePhoneNumber bigInt,
EmployeeAddress varchar(200),
StartDate date,
Gender char(1),
Foreign key (CompanyIdentity) references Company(CompanyID)
);
--Insert Values in Employee Table
insert into Employee values
(1,'sai',999005050,'12, rue des Bouchers,France','2010-01-28','M'),
(2,'vijaya',848488439,'Constitution Ave Fairfield, 94533','2005-04-02','F'),
(3,'kumar',98484848339,'Bernard Shaw,Italy ','2011-08-23','M'),
(2,'Ramya',8894849300,'120 Hanover Sq,London','2002-09-09','F');
Select * from Employee;

--Creating EMPPayroll Table
create table EMPPayroll
(BasicPay float,
Deductions float,
TaxablePay float,
IncomeTax float,
NetPay float,
EmployeeIdentity int,
Foreign key (EmployeeIdentity) references Employee(EmployeeID)
);
--Insert Values in EMPPayroll Table
insert into EMPPayroll(BasicPay,Deductions,IncomeTax,EmployeeIdentity) values 
(9000000,2000000,2000,1),
(503000,90000,4000,2),
(6780000,19000,5000,3),
(9088400,30944,45684,4);

--Update Derived attribute values 
update EMPPayroll
set TaxablePay=BasicPay-Deductions;

update EMPPayroll
set NetPay=TaxablePay-IncomeTax;

select * from EMPPayroll;

--Creating Department Table
create table Department
(
DepartmentId int identity(1,1) primary key,
DepartName varchar(100)
);
--Insert Values in Department Table
insert into Department values
('HR'),
('Marketing'),
('Sales'),
('IT');

select * from Department

--Creating table EmployeeDepartment
create table EmployeeDepartment
(
DepartmentIdentity int ,
EmployeeIdentity int,
Foreign key (DepartmentIdentity) references Department(DepartmentID),
Foreign key (EmployeeIdentity) references Employee(EmployeeID)
);

--Insert Values in EmployeeDepartment
insert into EmployeeDepartment values
(3,1),
(2,2),
(1,1),
(4,4),
(4,3);

select * from EmployeeDepartment
