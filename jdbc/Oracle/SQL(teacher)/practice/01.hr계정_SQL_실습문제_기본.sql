-- 문제1
  SELECT first_name || ' ' || last_name as "이름",
	     salary as "월급",
	     phone_number as "전화번호"
    FROM employees	   
ORDER BY hire_date ASC;

-- 문제2
  select job_title
    from jobs
order by max_salary desc;

-- 문제3
select count(*)
  from employees
 where manager_id is null;

-- 문제4
  select job_id,
	     salary
    from employees
order by salary desc;  

-- 문제5
select count(*)
  from departments;

-- 문제6
  select department_name
    from departments
order by length( department_name ) desc;

-- 문제7
select count(*)
  from departments
 where manager_id is null;

-- 문제8
  select upper( country_name )
    from countries
order by upper( country_name ) desc;

-- 문제9
  select region_name
    from regions
order by length( region_name ) asc;


-- 문제10
  select distinct lower( city ) 
    from locations
order by lower(city) asc;  
  