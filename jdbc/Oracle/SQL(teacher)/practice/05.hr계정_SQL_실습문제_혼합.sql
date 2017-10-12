--1번
select ( a.first_name || ' ' || a.last_name ) as "이름",
       a.salary as "연봉",
       b.department_name as "부서"	     
  from employees a,
       departments b
 where a.department_id = b.department_id
   and hire_date = ( select max(hire_date) from employees );

--2번
select employee_id, last_name, salary
  from employees a
 where salary > ( select avg(salary)
                    from employees
				   where department_id = a.department_id );
				   
--3번
select a.employee_id,
       a.first_name,
       a.last_name,
       b.job_title,
       a.salary  
  from employees a,
	   jobs b   
 where a.job_id = b.job_id
   and department_id = (  select department_id
                            from employees
                        group by department_id
                          having avg(salary) = ( select max( avg_salary )
                                                   from (  select department_id,
                                                                  avg(salary) as avg_salary
                                                             from employees
                                                         group by department_id ) ) ); 
				   

--4번
  select department_name
    from departments
   where department_id = (  select department_id
                              from employees
                          group by department_id   
                            having avg(salary) = (select max(avg_salary)
                                                    from (  select avg(salary) as avg_salary
                                                              from employees
	                                                      group by department_id ) ) );


--5번
select region_name
  from ( select rownum as rn, region_name, avg_salary
           from ( select e.region_name, avg(a.salary) as avg_salary 
                    from employees a,
                         departments b,
	                     locations c,
		                 countries d,
		                 regions e
                   where a.department_id = b.department_id
                     and b.location_id = c.location_id
	                 and c.country_id = d.country_id
	                 and d.region_id = e.region_id
                group by e.region_name
                order by avg_salary desc ) )
 where rn = 1;
 
--문제6
select job_title
  from ( select rownum as rn, job_title, avg_salary
           from ( select b.job_title, avg(a.salary) as avg_salary 
                    from employees a,
                         jobs b
                   where a.job_id = b.job_id
                group by b.job_title
                order by avg_salary desc ) )
 where rn = 1;
  
  
--[참고] top-k
  select rownum, employee_id, salary
    from (  select employee_id, salary
              from employees
          order by salary desc ) 
   where rownum = 1;
 
  select *
    from ( select rownum as rn, employee_id, salary
            from (  select employee_id, salary
                      from employees
                  order by salary desc ) ) 
   where 6 <= rn and rn <= 10;  		    
  		   
 
								 

 
  
   
     
  	   
  
				   	 					   