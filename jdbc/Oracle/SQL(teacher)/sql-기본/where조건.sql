-- WHERE 조건

-- job_id 가 AD_PRES 이거나 AD_VP

select employee_id,
       job_id
  from employees
 where job_id = 'AD_PRES'
    or job_id = 'AD_VP';
	
select employee_id,
       job_id
  from employees
 where job_id IN ('AD_PRES','AD_VP');
 
select employee_id,
       salary 
  from employees
 where 10000 < salary and salary < 20000;
 
select employee_id,
       salary 
  from employees
 where salary between 1000 and 20000;
 
-- null값을 가지는 커럼을 where절에 사용할 때
select employee_id,
       commission_pct
  from employees
 where commission_pct is null; 	   

select employee_id,
       commission_pct
  from employees
 where commission_pct is not null; 	   

-- LIKE
select first_name
  from employees
 where first_name like 'Al%';
  
select first_name
  from employees
 where first_name like '%a';
   
select first_name
  from employees
 where first_name like 'a%';
 
 select first_name
  from employees
 where first_name like 'A___';
 
 select first_name
  from employees
 where first_name like '__y';
 
   	    
	  