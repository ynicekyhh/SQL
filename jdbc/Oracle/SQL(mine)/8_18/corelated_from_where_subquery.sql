-- corelated subquery

-- 문) 각 부서별로 최고 월급을 받는 직원의 이름과 월급 출력

select department_id, max(salary)
  from employees
group by department_id;

-- 1) where
select first_name, salary
  from employees
 where (department_id, salary) in ( select department_id, max(salary)
									  from employees
								  group by department_id);

-- 2) from
select a.department_id, a.first_name, a.salary
  from employees a,
  		(select department_id, 
				max(salary) as max_salary
		   from employees
	   group by department_id) b
 where a.DEPARTMENT_ID = b.DEPARTMENT_ID
   and a.SALARY = b.max_salary;
   
-- 3) corelated : subquery바깥의 테이블과 연관시켜 매번 불러오니까 속도가 느려짐
select department_id, first_name, salary
  from EMPLOYEES a
 WHERE salary = (select max(salary)
				   from employees
				  where a.department_id = department_id);

				  
-- 문) 자기 부서의 평균월급보다 적은 월급을 받는 직원의 이름과 월급 출력
-- where보다는 from절에 subquery를 쓰는게 속도도 빠르고 여러 응용이 쉬워 장점이 많음
select a.department_id, a.first_name, a.salary, b.avg_salary
  from employees a,
  		(select department_id, 
				avg(salary) as avg_salary
		   from employees
	   group by department_id) b
 where a.DEPARTMENT_ID = b.DEPARTMENT_ID
   and a.SALARY < b.avg_salary;