  select employee_id, 
	   	 first_name
  	from employees
order by first_name desc;

-- hire_date가 클수록 신참
  select employee_id, hire_date
	from employees
order by hire_date desc;

-- 순서정렬 시 asc는 생략가능
  select employee_id, department_id, salary
	from employees
order by department_id, salary desc, employee_id desc;

