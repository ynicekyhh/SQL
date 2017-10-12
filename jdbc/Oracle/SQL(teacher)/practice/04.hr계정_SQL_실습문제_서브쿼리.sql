-- 1번
select count(*)
  from employees
 where salary < ( select avg(salary)
                    from employees );
 
-- 2번
  select employee_id, last_name, salary
    from employees
   where (department_id, salary) in (   select department_id, max(salary)
                                          from employees
									  group by department_id )
order by salary desc;


-- 3번
  select a.job_title, b.sum_salary
    from jobs a,
         (   select job_id,
                    sum( salary ) as sum_salary
               from employees
           group by job_id ) b
   where a.job_id = b.job_id
order by b.sum_salary desc;
   
-- 4번
select a.employee_id, a.last_name, a.salary
  from employees a
 where salary > ( select avg(salary)
                    from employees
				   where department_id = a.department_id);


-- 4번 별해			   
select employee_id, a.department_id, last_name, salary
  from employees a,
       (  select department_id, avg(salary) as avg_salary
            from employees
	    group by department_id ) b
 where a.department_id = b.department_id
   and a.salary > b.avg_salary; 