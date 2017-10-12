-- 문제1
-- 평균 연봉보다 적은 월급을 받는 직원은 몇 명이나 있습니까?
select count(e.employee_id)
  from(select avg(salary) as avg_salary
  	  	 from EMPLOYEES),
		EMPLOYEES e
 where e.SALARY < avg_salary;

-- 문제2
-- 각 부서별로 최고의 급여를 받는 사원의 사번, 성, 연봉을 조회하세요. 단, 조회결과는 연봉의 내림차순 정렬

-- 이건 NULL값이 포함됨...
select e.EMPLOYEE_ID, e.LAST_NAME, e.SALARY
  from (  select department_id,
				 max(salary) as max_salary
			from employees
		group by department_id) max
	JOIN EMPLOYEES e ON max.max_salary = e.SALARY
		  and max.department_id = e.DEPARTMENT_ID
order by e.SALARY desc;




-- NULL 제거 ( ANSI SQL ) - 포기...
select e.EMPLOYEE_ID, e.LAST_NAME, e.SALARY
  from employees a,
  	   (  select max(salary) as max_salary
			from employees emp
			LEFT JOIN ) max
	LEFT JOIN EMPLOYEES e ON max.max_salary = e.SALARY
order by e.SALARY desc;




-- 전체
select * from employees;

-- 위와 같은 문제 다른 해법 ( ORACLE )
select employee_id, last_name, salary
  from employees e
 where salary = ( select max(salary)
					from employees max
				   where max.DEPARTMENT_ID = e.department_id)
order by e.SALARY desc;


-- 문제3
-- 각 업무별로 연봉의 총합. 연봉 총합이 가장 높은 업무부터 업무명과 연봉 총합을 조회
select j.JOB_TITLE, sum_salary
  from (select e.JOB_ID, sum(salary) as sum_salary
		  from EMPLOYEES e
	  group by e.JOB_ID) sum
	LEFT JOIN JOBS j ON sum.JOB_ID = j.JOB_ID
order by sum_salary desc;
	
-- 문제4
-- 자신의 부서 평균 급여보다 연봉이 많은 사원의 사번, 성, 연봉을 조회

-- NULL값들... !!!!! 'LEFT JOIN' 은 OUTTER를 안 붙여도 OUTTER JOIN이다. 그냥 JOIN을 써야 INNER JOIN이다.
select e.EMPLOYEE_ID, e.LAST_NAME, e.SALARY, sum.avg_salary
  from (select DEPARTMENT_ID, avg(SALARY) as avg_salary
		  from EMPLOYEES
	  group by DEPARTMENT_ID) sum
	JOIN EMPLOYEES e ON sum.DEPARTMENT_ID = e.DEPARTMENT_ID
	AND e.SALARY > sum.avg_salary;

-- 이렇게 하면 NULL 없음...
select e.EMPLOYEE_ID, e.LAST_NAME, e.SALARY, sum.avg_salary
  from (select DEPARTMENT_ID, avg(SALARY) as avg_salary
		  from EMPLOYEES
	  group by DEPARTMENT_ID) sum,
	  	EMPLOYEES e
 where sum.DEPARTMENT_ID = e.DEPARTMENT_ID
   and e.SALARY > sum.avg_salary;	
			  
select * from employees;