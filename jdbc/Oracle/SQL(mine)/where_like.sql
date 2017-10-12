-- WHERE 조건

select employee_id,
	   job_id
  from employees
 where job_id = 'AD_PRES'
	or job_id = 'AD_VP';
	
select employee_id,
	   job_id
  from employees
 where job_id IN ('AD_PRES', 'AD_VP');
 
select employee_id,
	   salary
  from employees
 where 10000 < salary and salary < 20000;

select employee_id,
	   salary
  from employees
 where salary between 1000 and 20000;
 
-- null값을 가지는 컬럼을 where절에 사용할 때
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
 where first_name like 'A%';

select first_name
  from employees
 where first_name like '%a';

select first_name
  from employees
 where first_name like '%y%';
 
-- 첫글자가 'A'고, 총 4개의 문자를 찾음 : '_'는 글자의 개수를 지정할 수 있음
select first_name
  from employees
 where first_name like 'A___';
 
select first_name
  from employees
 where first_name like '__y';