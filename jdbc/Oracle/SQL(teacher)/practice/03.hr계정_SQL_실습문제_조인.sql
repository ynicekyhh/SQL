-- 1번
select a.employee_id,
       a.first_name,
	   b.department_name, 
	   c.first_name
  from employees a,
       departments b,
	   employees c
 where a.department_id = b.department_id
   and a.manager_id = c.employee_id;

-- 2번
  select a.region_name,
         b.country_name
    from regions a,
         countries b
   where a.region_id = b.region_id
order by a.region_name asc, b.country_name asc;  	   


-- 3번
select a.department_id,
	   a.department_name,
       b.first_name,
	   c.city,
	   d.country_name,
	   e.region_name 
  from departments a,
       employees b,
	   locations c,
	   countries d,
	   regions e
 where a.manager_id = b.employee_id
   and a.location_id = c.location_id
   and c.country_id = d.country_id
   and d.region_id = e.region_id;

-- 4번
select a.employee_id, a.first_name || ' ' || a.last_name
  from employees a,
       job_history b,
	   jobs c
 where a.employee_id = b.employee_id
   and b.job_id = c.job_id
   and c.job_title = 'Public Accountant';

-- 5번
  select a.employee_id, a.last_name, a.first_name, b.department_name
    from employees a,
         departments b
   where a.department_id = b.department_id
order by a.last_name; 	      	   

-- 6번
select emp.employee_id,
       emp.last_name,
	   to_char(emp.hire_date, 'yyyy-mm-dd')
  from employees emp, employees man
 where emp.manager_id = man.employee_id
   and emp.hire_date < man.hire_date;