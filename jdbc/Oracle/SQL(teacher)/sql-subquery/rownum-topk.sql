-- top-k

-- 쓰레기1
select rownum, employee_id, salary
  from employees
 where hire_date like '06%'
 order by salary desc;

-- 앞에서 5개 뽑는 경우 (top-k)
select rownum, employee_id, salary
from(   select employee_id, salary
          from employees
         where hire_date like '06%'
      order by salary desc )
where rownum <= 5;

-- 쓰레기2 6번째부터  10번째를 뽑는 경우
select rownum, employee_id, salary
from(   select employee_id, salary
          from employees
         where hire_date like '06%'
      order by salary desc )
where 6 <= rownum and rownum <= 10;

select *
from ( select rownum as rn, 
              employee_id, 
	          salary
         from ( select employee_id, salary
                  from employees
                 where hire_date like '06%'
                order by salary desc ) )
 where 6 <= rn and rn <= 10;				
  