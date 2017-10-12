-- multi row subquery
-- subquery결과가 둘 이상일 땐, any, all, in을 써야함

-- 문) job_id가 'IT_PROG'인 직원이 많은 월급 보다
--		많이 받고 직원의 이름과 월급

select salary
  from employees 
 where job_id = 'IT_PROG'; 

select max(salary)
  from employees 
 where job_id = 'IT_PROG';
 
-- salary > all 은 subquery로 나온 row들 중에서 max값보다 더 큰 salary들만 뽑아낸다
select first_name,
		salary 
  from employees 
 where salary > all ( select salary
 						from employees
					   where job_id = 'IT_PROG');
					   
-- 문) job_id가 'IT_PROG'인 직원이 많은 월급과 같은
--		월급을 받고 직원들의 이름과 월급

select first_name,
		salary 
  from employees 
 where salary in ( select salary
 						from employees
					   where job_id = 'IT_PROG');
					   
-- =any나 in이나 같음 : 한개라도 같은 값이 있으면
select first_name,
		salary 
  from employees 
 where salary =any ( select salary
 						from employees
					   where job_id = 'IT_PROG');
					   
-- >any, <any : 한개라도 작거나 크면