-- null test

select employee_id, salary, commission_pct
  from employees;
  
select employee_id, 
       salary, 
	   salary + salary*commission_pct
  from employees;
  
-- nvl 함수
select nvl(null, 10) from dual;
select nvl(20, 10) from dual;


select employee_id, 
       salary, 
	   salary + salary*nvl(commission_pct, 0)
  from employees;
  
select employee_id,
       nvl(manager_id, 0)
  from employees; 

-- error: nvl 함수 안의 두 파라미터 
-- 데이터 타입이 같아야 한다.
-- select employee_id,
--       nvl(manager_id, '없음')
--  from employees; 
  

  
  
  