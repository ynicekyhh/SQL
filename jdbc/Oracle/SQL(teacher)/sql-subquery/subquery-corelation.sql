-- corelated subquery

--문)각 부서별로 최고 월급을 받는 직원의 이름과 월급 출력

  select department_id, max(salary)
    from employees
group by department_id;

--1) where
select department_id, first_name, salary
  from employees
 where (department_id, salary) 
       in (   select department_id, max(salary)
                from employees
             group by department_id );
			 
--2) from
select a.department_id, a.first_name, a.salary
  from employees a,
       (  select department_id, 
	             max(salary) as max_salary
            from employees
        group by department_id) b
 where a.department_id = b.department_id
   and a.salary = b.max_salary;
   
--3) corelated
select department_id, first_name, salary
  from employees a
 where salary = 
 (  select max(salary)
      from employees
     where a.department_id=department_id);


--문)자기 부서의 평균월급 보다 적은 월급 받는 직원의 이름과 월급 출력
select a.department_id, 
       a.first_name, 
	   a.salary,
	   b.avg_salary
  from employees a,
       (  select department_id, 
	             avg(salary) as avg_salary
            from employees
        group by department_id ) b
 where a.department_id = b.department_id
   and a.salary < b.avg_salary;

select department_id, first_name, salary
  from employees a
 where salary < 
 (  select avg(salary)
      from employees
     where a.department_id=department_id);   		
			    