select avg(salary), max(salary) from employees;

-- error 집계함수 이외의 칼럼은 프로젝션 될 수 없다.
-- select employee_id, avg(salary), max(salary) from employees;

-- 단, group by 절에 참여하고 있는 칼럼은 프로젝션 될 수 있다.
  select job_id, avg(salary), max(salary) 
	from employees
   where manager_id is not null
group by job_id;

