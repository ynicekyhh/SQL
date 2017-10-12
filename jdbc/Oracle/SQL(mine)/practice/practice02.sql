-- 문제 1
select max(salary) as "최고임금", 
	   min(salary) as "최저임금", 
	   max(salary) - min(salary) as "최고임금 - 최저임금"
  from employees;
  
-- 문제 2
  select max(to_char(hire_date, 'yyyy"년" mm"월" dd"일"'))
	from employees;

-- 문제 3
select to_char(avg(salary), '$99999.99') as "평균임금", 
	   max(salary) as "최고임금", 
	   min(salary) as "최저임금",
	   department_id
  from employees
group by department_id
order by avg(salary) desc, max(salary) desc, min(salary) desc;

-- 문제 4
select to_char(avg(salary), '$99999.99') as "평균임금", 
	   max(salary) as "최고임금", 
	   min(salary) as "최저임금",
	   job_id
  from employees
group by job_id
order by avg(salary) desc, max(salary) desc, min(salary) desc;

-- 문제 5	포기(안됨)
select max(hire_date), e.EMPLOYEE_ID
  from employees e, JOB_HISTORY j
 where e.EMPLOYEE_ID = j.employee_id
group by hire_date, e.EMPLOYEE_ID
order by max(j.end_date-j.start_date) desc;

select emp.HIRE_DATE, max("근속연수")
from
	(
	select j.employee_id, sum(end_date-start_date) as "근속연수" 
	  from job_history j 
	group by j.employee_id
	) t
inner join EMPLOYEES emp on t.employee_id = emp.employee_id
order by "근속연수" desc;
 

-- 문제 6
select avg(salary) as avg,
	   min(salary) as min,
	   avg(salary)-min(salary) as "평균임금 - 최저임금"
  from employees
 where avg(salary)-min(salary) < 2000
order by avg(salary)-min(salary) desc;

select emp.EMPLOYEE_ID,
	   avg(emp.SALARY) as "평균임금",
	   min(emp.SALARY) as "최저임금",
	   avg(emp.SALARY)-min(emp.SALARY) as "평균임금 - 최저임금"
  from employees emp
group by emp.EMPLOYEE_ID
having (avg(emp.SALARY)-min(emp.SALARY)) < 2000
order by "평균임금 - 최저임금";
 
-- 문제 7
select b.JOB_TITLE, a.DIFF as "최고연봉 - 최소연봉"
  from (   select JOB_ID,
	              (max(SALARY)-min(SALARY)) as DIFF
             from EMPLOYEES
         group by JOB_ID) a,
	   JOBS b 	 
 where a.JOB_ID = b.JOB_ID
   and DIFF = ( select max( DIFF )
                  from (   select JOB_ID,
	                              (max(SALARY) - min(SALARY)) as DIFF
                             from EMPLOYEES
                         group by JOB_ID));
						 