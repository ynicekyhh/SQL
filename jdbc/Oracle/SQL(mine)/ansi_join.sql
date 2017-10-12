-- ansi join sql 문(1999 syntax)

-- natural join 테이블들의 칼럼 이름이 동일한 경우 : join.sql에 있는 inner join예제와 다르게 같은 이름 칼럼들을 모두 equi join을 하여 개수가 확 줄었다.
	  select count(*)
  		from employees
natural join departments;

-- natural join을 사용하는데 using을 사용하면 정한 칼럼 하나만으로 join하겠다는 의미
select count(*)
  from employees
  join departments
 using (department_id);

-- 위와 같은 결과, inner join
select count(*)
  from employees a
  join departments b
	on a.DEPARTMENT_ID=b.DEPARTMENT_ID
 where a.SALARY > 5000;
 

