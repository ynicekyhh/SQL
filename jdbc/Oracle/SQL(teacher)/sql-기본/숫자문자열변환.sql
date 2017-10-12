-- 숫자 <-> 문자열

select employee_id, salary from employees;

select employee_id, 
       to_char(salary, '99999') 
  from employees;
  
select employee_id, 
       to_char(salary, '9999') 
  from employees;
  
select employee_id, 
       to_char(salary, '999999999') 
  from employees;
  
select employee_id, 
       to_char(salary, '000099999') 
  from employees;
  
select employee_id, 
       to_char(salary, '99,999') 
  from employees;
  
select employee_id, 
       to_char(salary, '9,99,99') 
  from employees;
  
select to_char( 3.14148921, '9.99' ) from dual;  
select to_char( 3.14148921, '99,999.99' ) from dual;  
  
 select employee_id, 
       to_char(salary, 'FM999999999') 
  from employees;
  
 select employee_id, 
       to_char(salary, 'FM$999999999') 
  from employees;
  
 select employee_id, 
       to_char(salary, 'FML999999999') 
  from employees;
  
select to_char( -12345, '99999MI' ) from dual;    
select to_char( -12345, 'S99999' ) from dual;    
select to_char( 12345, 'S99999' ) from dual;    
select to_char( 0, 'S99999' ) from dual;    

select to_char( 12345, '99999PR' ) from dual;    
select to_char( -12345, '99999PR' ) from dual;    
  
select to_char( 0, 'RN' ) from dual;  
select to_char( 1, 'RN' ) from dual;  
select to_char( 3999, 'RN' ) from dual;  
select to_char( 3999, 'rn' ) from dual;  

select to_char( 1234, 'XXX' ) from dual;  
select to_char( 1234, 'xxx' ) from dual;

select to_number( '1234567', '9999999' ) + 10 from dual;   
  
select to_number( '1234567', '9999999' ) from dual;   
    
