-- 문제1
select first_name || ' ' || last_name as "이름",
		email as "이메일",
		phone_number as "전화번호"
	from employees
	order by hire_date;

-- 문제2
select job_title, max_salary from jobs order by max_salary desc;

-- 문제3
select count(*) 
	from employees
	where manager_id is null;

-- 문제4 ???
select job_title
	from jobs
	order by max_salary desc;

-- 문제5
select count(*) from departments;

-- 문제6
select * from departments order by length(department_name) desc;

-- 문제7
select count(*) from departments where manager_id is null;

-- 문제8 ???
select upper(country_name) 
	from COUNTRIES 
	where country_id IN (select country_id from locations)
	order by upper(country_name) asc;

-- 문제9 ???
select region_name from regions order by length(region_name) asc;

-- 문제10
select lower(city) from locations order by lower(city) asc;