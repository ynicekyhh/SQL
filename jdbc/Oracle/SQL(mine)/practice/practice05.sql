-- 문제1
-- 가장 늦게 입사한 직원의 이름, 연봉, 부서이름

-- max()를 이용해서 못하겠음...
select first_name, last_name, salary, department_name
  from EMPLOYEES a,DEPARTMENTS b
 where a.HIRE_DATE = (select max(HIRE_DATE) from EMPLOYEES)
   and a.DEPARTMENT_ID = b.DEPARTMENT_ID;

select *
  from EMPLOYEES e, DEPARTMENTS d
 where e.HIRE_DATE = (select max(HIRE_DATE) from EMPLOYEES)
   and e.DEPARTMENT_ID = d.DEPARTMENT_ID;
  		

-- top-k방법 (1명만 나오니 잘못됨)
select order_ed.first_name, 
	   order_ed.last_name, 
	   order_ed.salary, 
	   order_ed.department_name
  from (
  		select rownum as rn, 
			   ed.first_name, 
			   ed.last_name, 
			   ed.salary, 
			   ed.department_name
		  from (select *
				  from EMPLOYEES e,DEPARTMENTS d
				 where e.DEPARTMENT_ID = d.DEPARTMENT_ID
			  order by e.HIRE_DATE desc) ed
		) order_ed
 where rn = 1;
 
-- 문제2
-- 부서 평균 급여보다 연봉이 많은 사원의 사번, 성, 연봉
select e.EMPLOYEE_ID, e.LAST_NAME, e.SALARY
  from (
  		select DEPARTMENT_ID, avg(salary) avg_salary
		  from EMPLOYEES
	  group by DEPARTMENT_ID
		) d_avg,
		EMPLOYEES e
 where d_avg.DEPARTMENT_ID = e.DEPARTMENT_ID
   and e.SALARY > d_avg.avg_salary;

;

-- 문제3
-- 평균연봉이 가장 높은 부서 사원들의 사번, 이름, 성, 업무, 연봉
select e.EMPLOYEE_ID, e.LAST_NAME, j.JOB_TITLE, e.SALARY
  from EMPLOYEES e 
  	JOIN JOBS j ON e.JOB_ID = j.JOB_ID
 where e.DEPARTMENT_ID = (
							select ae.DEPARTMENT_ID
							  from (
										select DEPARTMENT_ID, avg(salary) as avg_salary
										  from EMPLOYEES
									  group by DEPARTMENT_ID
									  order by avg_salary desc
									) ae
							 where rownum < 2  
						);




-- 문제4
-- select max(avg(salary))	-- 오라클에서만 된다.
select b.DEPARTMENT_ID, a.avg_salary
  from (select department_id,
			   avg(salary) as avg_salary
		  from employees
	  group by department_id) a,
	  departments b
-- 		 where <- 위치상으로 group by 앞에 나와야 하기 때문에 안됨
 where a.department_id = b.DEPARTMENT_ID 
   and a.avg_salary = (	select max(avg_salary)
						  from (	select avg(salary) as avg_salary
									  from employees
								  group by department_id)
						);
 
-- 같은문제 다른풀이
select department_id,
	   avg(salary) as avg_salary
  from employees
group by department_id
having avg(salary) = (select max(avg_salary)
					    from (	select avg(salary) as avg_salary
								  from employees
							  group by department_id)
						);
						
-- 같은문제 다른풀이2 ...하다말았음
select b.DEPARTMENT_NAME,
	   avg(salary) as avg_salary
  from employees a,
  	   departments b
group by department_id
having avg(salary) = (select max(avg_salary)
					    from (	select avg(salary) as avg_salary
								  from employees
							  group by department_id)
						);
						
						
-- 문제5 (너무 어렵게 푼듯...?)
select r.REGION_NAME,
	   avg(salary) as avg_salary
  from EMPLOYEES e,DEPARTMENTS d,LOCATIONS l,COUNTRIES c,REGIONS r
 where e.DEPARTMENT_ID = d.DEPARTMENT_ID
   and d.LOCATION_ID = l.LOCATION_ID
   and l.COUNTRY_ID = c.COUNTRY_ID
   and c.REGION_ID = r.REGION_ID
group by r.REGION_NAME
having avg(salary) = (
						select max(avg_salary)
						  from (
						  		select r2.REGION_NAME, avg(e2.SALARY) as avg_salary
								  from EMPLOYEES e2,DEPARTMENTS d2,LOCATIONS l2,COUNTRIES c2,REGIONS r2
								 where e2.DEPARTMENT_ID = d2.DEPARTMENT_ID
								   and d2.LOCATION_ID = l2.LOCATION_ID
								   and l2.COUNTRY_ID = c2.COUNTRY_ID
								   and c2.REGION_ID = r2.REGION_ID
								group by r2.REGION_NAME
						  		)
						);

-- 지역별 평균
select r.REGION_NAME, avg(e.SALARY) as avg_salary
  from EMPLOYEES e,DEPARTMENTS d,LOCATIONS l,COUNTRIES c,REGIONS r
 where e.DEPARTMENT_ID = d.DEPARTMENT_ID
   and d.LOCATION_ID = l.LOCATION_ID
   and l.COUNTRY_ID = c.COUNTRY_ID
   and c.REGION_ID = r.REGION_ID
group by r.REGION_NAME;

-- 전체 지역
select * from regions;


-- 문제6
select job_title
  from (
		select job_id, avg(salary) as avg_salary
		  from EMPLOYEES
		group by job_id
		order by avg_salary desc  
  		) ae,
		JOBS j
 where ae.JOB_ID = j.JOB_ID
   and rownum < 2; 

