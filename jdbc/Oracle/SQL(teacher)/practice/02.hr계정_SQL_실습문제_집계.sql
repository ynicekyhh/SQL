-- 1번
select max(SALARY) as "최고임금",
       min(SALARY) as "최저임금",
	   ( max(SALARY)- min(SALARY) ) as "최고임금 - 최저임금"
  from employees;
  
-- 2번
select to_char( max( hire_date ), 'yyyy"년" mm"월" dd"일"' )
  from employees;

-- 3번
  select department_id,
         avg(salary) as avg_salary,
	     max(salary) as max_salary,
		 min(salary) as min_salary
    from employees
group by department_id	 
order by avg_salary desc, max_salary desc, min_salary desc;
 
-- 4번
  select job_id,
         avg(salary) as avg_salary,
	     max(salary) as max_salary,
		 min(salary) as min_salary
    from employees
group by job_id	 
order by avg_salary desc, max_salary desc, min_salary desc;

-- 5번
select to_char( min( hire_date ), 'yyyy"년" mm"월" dd"일"' )
  from employees;
  
-- 6번
  select department_id,
         avg(salary) as avg_salary,
	     min(salary) as min_salary,
		 ( avg(salary) - min(salary) ) as diff_avg_min
    from employees
group by department_id	 
order by diff_avg_min desc;

-- 7번
  select job_title,
	     ( max(salary) - min(salary) ) as diff
    from employees a,
	     jobs b
   where a.job_id = b.job_id		 
group by job_title	 
order by diff desc;      	   

--7번 별해
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