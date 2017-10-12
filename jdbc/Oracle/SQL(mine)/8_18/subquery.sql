-- subquery



-- 문) 이름(first_name)이 Lex이 사원보다 많은 월급은
--		많은 직원들의 이름과 월급

select salary from employees where first_name = 'Lex';
select salary from employees where first_name like '%a';

select first_name, salary
  from employees
 where salary > 17000;
 
-- 위와 같이 두번에 나눠서 보내게 되면 보통 자바로 받아서 처리하게 되는데, 조건이 바뀔 때 문제가 될 수 있으니 한번에 하자!
select first_name, salary
  from employees
 where salary > (select salary from employees where first_name = 'Lex');

-- 이렇게 where에서 조건을 걸려고 한다면 true, false가 나와야하고, 비교니까 subquery의 결과 row가 여러개이면 에러발생함
-- 여기선 lex하나만 구한 subquery table과 비교하니 결과값이 나옴
select first_name, salary
  from employees
 where salary = (select salary from employees where first_name = 'Lex');

select a.first_name, b.salary
  from employees a,
  		(select salary 
		   from employees 
		  where first_name = 'Lex') b
 where a.salary > b.salary;

-- <>는 not equal
select first_name, salary
  from employees
 where salary <> (select salary from employees where first_name = 'Lex');


-- 전체 직원의 평균 월급 보다 많이 받고 있는 직원들의 이름, 월급 출력
select (select avg(salary) from employees), first_name, salary
  from employees
 where salary > (select avg(salary) from employees);
