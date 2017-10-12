-- date <-> 문자열

select employee_id, 
       hire_date 
  from employees;
  
select employee_id, 
to_char(hire_date, 'yyyy"년" mm"월" dd"일" hh"시" mi"분" ss"초"' ) 
  from employees;

select employee_id, 
to_char(hire_date, 'yyyy"년" mm"월" dd"일" hh24"시" mi"분" ss"초"' ) 
  from employees;

select employee_id, 
to_char(hire_date, 'yyyy"년" mm"월" dd"일" pm hh24"시" mi"분" ss"초"' ) 
  from employees;
  
select employee_id, 
to_char(hire_date, 'yyyy"년" mm"월" dd"일" day pm hh24"시" mi"분" ss"초"' ) 
  from employees;
  
select employee_id, 
to_char(hire_date, 'yyyy"년" mm"월" dd"일" d"요일" pm hh24"시" mi"분" ss"초"' ) 
  from employees;
  
select 
to_char(sysdate, 'yyyy"년" mm"월" dd"일" ddd"일째 되는 날"' ) 
  from dual;

select employee_id, 
to_char(hire_date, 'year:syear' ) 
  from employees;  
  
select to_char( sysdate, 'RR' ) from dual;

-- 현재 세기(2000)
select to_char( to_date('30', 'RR'), 'yyyy' ) from dual;

-- 이전 세기(1900)
select to_char( to_date('60', 'RR'), 'yyyy' ) from dual;
  
      