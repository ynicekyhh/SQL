-- 문자열 함수

select lower( 'Database Management System' ) from dual;

select first_name
  from employees
 where lower(first_name) like 'al%';
 
select upper( 'Database Management System' ) from dual;

select last_name, upper(last_name) from employees;

select initcap( 'database management system' ) from dual;

select first_name || ' ' || last_name from employees;

select concat( first_name, concat( ' ', last_name ) ) from employees; 

select length( 'database management system' ) from dual;

select instr( 'database management system', 'base') from dual;

select employee_id, lpad(salary, 10, '*' ) from employees;

select employee_id, rpad(salary, 10, '*' ) from employees;

select trim( '#' from '####data#base####') from dual;

select '---' || 
	   trim( ' ' from '   data   base   ' ) || 
	   '---' 
  from dual;
	   
select '---' || 
	   ltrim( '   data   base   ', ' ' ) || 
	   '---' 
  from dual;	   
	   
select '---' || 
	   rtrim( '   data   base   ', ' ' ) || 
	   '---' 
  from dual;
  
select '---' || 
	   replace( '   data   base   ', ' ', '' ) || 
	   '---' 
  from dual;
  



