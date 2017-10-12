-- select from
select count(*) from employees;

select * from employees;

select first_name, last_name 
  from employees;
  
select first_name || ' ' || last_name as "이름"
  from employees;  
