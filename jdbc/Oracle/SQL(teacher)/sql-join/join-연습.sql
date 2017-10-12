-- inner join (equi join)

select a.employee_id, 
       b.department_id,
	   a.first_name,
	   b.department_name
  from employees a, departments b
 where a.department_id = b.department_id -- join 조건
   and a.salary > 5000; -- row 선택 조건
   
 -- inner join(self join, equi join)
 select emp.first_name as "직원이름",
        man.first_name as "매니저 이름"
   from employees emp, employees man
  where emp.manager_id = man.employee_id;
   
-- outer join
select count(*)
  from employees a, departments b
 where a.department_id = b.department_id; -- join 조건

select count(*) from employees; 

select employee_id, department_id 
  from employees
 where department_id is null;
  
select count(*)
  from employees a, departments b
 where b.department_id(+) = a.department_id;
 
    