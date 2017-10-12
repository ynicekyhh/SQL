select avg(salary), max(salary)
  from employees
order by employee_id;  
  
  

-- error
-- 집계함수 이외의 칼럽은 프로젝션 될 수 없다.  
--select employee_id, avg(salary), max(salary)
--  from employees;

-- 단,
-- group by 절에 참여 하고 있는 컬럼은 플젝션 할 수 있다.
  select job_id, avg(salary), max(salary)
    from employees
   where manager_id is not null
group by job_id
  having avg(salary) > 5000
order by avg(salary);  

