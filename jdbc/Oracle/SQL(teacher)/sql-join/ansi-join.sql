-- ansi join sql 문(1999 syntax)

-- natural join 테이블들의  칼럼 이름이 동일한 경우
      select count(*)
        from employees
natural join departments;

select count(*)
  from employees
  join departments
 using (department_id);
 
select count(*)
  from employees a
  join departments b
    on a.department_id=b.department_id
 where a.salary > 5000;
 
   select count(*)
     from employees a
left join departments b
    on a.department_id=b.department_id;
	
    select count(*)
      from departments b
right join employees a
    on a.department_id=b.department_id;
	
