-- inner join (equi join)

-- alias를 사용하여 명확하게 명시를 해 주는 것이 좋다.
select e.employee_id, 
		d.department_id,
		e.first_name,
		d.DEPARTMENT_NAME
  from employees e, departments d
 where e.DEPARTMENT_ID = d.DEPARTMENT_ID -- join 조건
   and e.SALARY > 5000;	-- row 선택 조건

-- theta join은 잘 안씀
-- natural join은 두 테이블에 id가 있을 때, 컬럼명이 'id'로 같을 때, 잘 안씀

-- inner join(self join, equi join)
select emp.FIRST_NAME as "직원이름",
		man.FIRST_NAME as "매니저 이름"
  from employees emp, employees man
 where emp.MANAGER_ID = man.EMPLOYEE_ID;

-- 위와 같은 결과, 다른 표현
 select emp.EMPLOYEE_ID, emp.FIRST_NAME, emp.MANAGER_ID,
 		man.EMPLOYEE_ID, man.FIRST_NAME, man.MANAGER_ID
 from employees emp, employees man
 where man.EMPLOYEE_ID  = emp.MANAGER_ID ;
 
 -- ansi
 select emp.EMPLOYEE_ID, emp.FIRST_NAME, emp.MANAGER_ID,
 		man.EMPLOYEE_ID, man.FIRST_NAME
 from employees emp
 	inner join employees man on emp.MANAGER_ID = man.EMPLOYEE_ID
	;
 
select * from employees;

-- outer join
select count(*)
  from employees e, departments d
 where e.DEPARTMENT_ID = d.DEPARTMENT_ID; -- join 조건

select count(*) from employees;

select employee_id, department_id 
  from employees
 where department_id is null;
 
-- 위와 결과가 다르게 (+)를 붙여줘서 department_id가 null인 녀석도 outer join으로 다 표시하게 한다.
select count(*)
  from employees e, departments d
 where e.DEPARTMENT_ID = d.DEPARTMENT_ID(+);
 

select e.FIRST_NAME as "사원 이름",
		nvl(d.DEPARTMENT_NAME, '대기발령') as "부서 이름"
  from employees e, departments d
 where e.DEPARTMENT_ID = d.DEPARTMENT_ID(+);

select emp.FIRST_NAME as "직원이름",
		nvl(man.FIRST_NAME, '매니저 없음') as "매니저 이름"
  from employees emp, employees man
 where emp.MANAGER_ID = man.EMPLOYEE_ID(+);
 
select * from employees where manager_id is null;