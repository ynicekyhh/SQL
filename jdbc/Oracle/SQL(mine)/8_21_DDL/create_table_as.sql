select * from employees where job_id = 'FI_ACCOUNT';

-- 이런식으로 create table ____ as 를 써서 백업 테이블을 만들어 테스트해본다. not_null, PK등의 조건은 옮겨지지 않고, 쿼리문 결과에 따라 테이블 생성된다.)
create table employees_bak01
	as (  select employee_id, first_name, last_name
			from employees 
		   where job_id = 'FI_ACCOUNT' );

-- drop table은 rollback이 되지 않으니 주의할 것!!
drop table EMPLOYEES_BAK01;
		   
select * from employees_bak01;