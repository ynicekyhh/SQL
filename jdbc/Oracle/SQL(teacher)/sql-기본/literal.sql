--literal

select sysdate from dual;

select 'Name is ' || 
       first_name || 
	   'id is ' ||
	   employee_id
  from employees;	   