-- subquery

select first_name from employees where first_name = 'Lex';

-- 문) 이름(first_name)이 Lex이 사원보다 많은 월급은 
--    많은 직원들의 이름과 월급

select salary from employees where first_name like '%a%'; 
 
select first_name, salary
  from employees
 where salary > 17000;
 
select first_name, salary
  from employees
 where salary > (select salary from employees where first_name like '%a%');
 
select a.first_name, b.salary
  from employees a,
       ( select salary 
	       from employees 
		  where first_name = 'Lex' ) b
 where a.salary > b.salary;
 
  
