-- 문자열 함수

-- 'dual'은 테스트용 임시 테이블로 테이블이 따로 생성되지는 않음. 오라클에서만 사용 가능
select lower( 'Database management System' ) from dual;

select first_name
  from employees
 where lower(first_name) like 'al%';
 
select upper( 'Database management System' ) from dual;

select first_name
  from employees
 where upper(first_name) like 'A%';
 
select last_name, upper(last_name) from employees;

-- 단어의 맨 앞글자만 대문자로
select initcap( 'database management system' ) from dual;

select first_name || ' ' || last_name from employees;

-- concat은 두 문자열만 가능하다
select concat( first_name, concat( ' ', last_name ) ) as "이름" from employees;


select length( 'database management system' ) as "length" from dual;


select distinct city from locations;

select distinct job_id from employees order by job_id;

select count(job_id) from employees;

select count(distinct job_id) from employees;

select count(*) from jobs;