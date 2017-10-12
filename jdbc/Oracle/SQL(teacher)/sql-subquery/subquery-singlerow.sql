-- single row subquery

select first_name, salary
  from employees
 where salary > (select salary from employees where first_name = 'Lex');

select first_name, salary
  from employees
 where salary = (select salary from employees where first_name = 'Lex');

select first_name, salary
  from employees
 where salary < (select salary from employees where first_name = 'Lex');

select first_name, salary
  from employees
 where salary <> (select salary from employees where first_name = 'Lex');

-- 전체 직원의 평균 월급 보다 많이 받고 있는 
-- 직원들의 이름, 월급 출력
select first_name, salary
  from employees
 where salary > (select avg(salary) from employees);

