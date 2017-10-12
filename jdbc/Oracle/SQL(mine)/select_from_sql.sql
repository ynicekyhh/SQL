-- select from
select count(*) from EMPLOYEES;
select * from EMPLOYEES;
select first_name, last_name from EMPLOYEES;

select first_name || ' ' || last_name as "이름"
	from EMPLOYEES;