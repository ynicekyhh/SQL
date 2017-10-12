   select employee_id, 
          first_name
     from employees
 order by first_name desc;
 
  select employee_id, hire_date
    from employees
order by hire_date desc;

  select employee_id, department_id, salary
    from employees
order by department_id, salary desc, employee_id desc;
   
    	    