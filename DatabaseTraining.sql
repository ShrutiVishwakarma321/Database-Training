select * from emp; --projection
select * from dept;
select empno, ename, sal, sal*12 as Annual_salary from emp;--aliasing
select ename||' Works as '||job||' earns '||sal as emp_details from emp;--concatenation
select empno,ename from emp where sal>200; --selection/filtering using where clause
select * from emp order by sal desc; --sorting data using order by clause

--BuiltIn Function in sql
--Scaler function or Single row function - for every input there is an output 
--numereic, character,date,conversion, generic

select upper('Pune')from dual;
--to evaluate an expression dual table is used this is a virtual table
select 10+10,10+10/2,sysdate,length('pune') from dual;
--Character function
select ename, ltrim(ename,'S'),lpad(ename,10,'*'),length(ename),replace(ename,'A','@') from emp;
select ename, substr(ename,2),substr(ename,2,3),substr(ename,-2) from emp;
select instr('xyz@db.com','@') from dual; -- position of character in string, if not found it returns 0
select substr('xyz@db.com',1,(instr('xyz@db.com','@')-1)) from dual;

--Numeric function
select sign(-20),abs(-200),power(4,2),sqrt(81),round(3456.78),round(346.789,2),
round(567,-1),round(567,-2),floor(-9.234),ceil(8.234),mod(54,8) from dual;

--Date Functions
select sysdate from dual;
select sysdate,sysdate + 1,sysdate - 1 from dual;
select hiredate,add_months(hiredate,2),add_months(hiredate,-2) from emp;
select round(months_between(sysdate,hiredate)/12) as emp_yrsof_exp from emp;
select round((sysdate-hiredate)/365) as emp_yrsof_exp from emp;
select next_day(sysdate,'sunday'),next_day(sysdate,6), last_day(sysdate) from dual;



--conversion function to_char,to_date,to_number
-- to_char is widely used with dates (date format conversion)
select to_char(sysdate,'ddth MONTH YYYY') from dual;
--format specifiers - dd, ddth, ddspth, MONTH , Month, MON, mon, DAY , Dy, dy, YYYY
--Year, yy, HH, MM, SS
select * from emp where to_char(hiredate,'mon') = 'frb';
select systimestamp from dual;
select sal,to_char(sal,'$9,999.00') from emp;

--generic functions -- nvl,decode,case
--nvl checks if a field is null then replace
select empno, ename, sal, comm, nvl(comm,10) from emp;
select empno,ename,sal,comm,nvl(to_char(comm),'N/A') from emp;

--if else logic in a query
select empno,ename,deptno, decode(deptno,10,'A',20,'B',null,'X','unknown') from emp;

--range based criteria --case construct
select empno,ename,sal,
case
when sal between 500 and 1000 then 'Lgrade'
when sal between 1001 and 2000 then 'Mgrade'
else 'xgrade' end as empgrade from emp;


