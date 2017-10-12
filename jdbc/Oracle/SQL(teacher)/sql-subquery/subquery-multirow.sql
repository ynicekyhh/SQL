-- multi row subquery

-- 문) job_id가 'IT_PROG'인 직원이 많은 월급 보다 
--     많이 받고 직원의 이름과 월급
--     >all, <all  
select salary 
  from employees 
 where job_id='IT_PROG';
 
 select first_name,
        salary
   from employees
  where salary >all ( select salary 
                     from employees 
                    where job_id='IT_PROG' );
					
-- 문) job_id가 'IT_PROG'인 직원이 많은 월급과 같은
--     월급을 받고 직원들의 이름과 월급   		
  select first_name,
        salary
   from employees
  where salary in ( select salary 
                     from employees 
                    where job_id='IT_PROG' );
 
  select first_name,
        salary
   from employees
  where salary =any ( select salary 
                        from employees 
                       where job_id='IT_PROG' ); 
					   
-- >any, <any					   