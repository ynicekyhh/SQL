-- null 함수

select nvl( null, 0 ) from dual;

-- nvl2는 1번 값이 null 이면 뒤의 값을, null이 아니면 앞의 값을 리턴
select nvl2( null, 10, 20 ),
		nvl2( 0, 10, 20 ) 
	from dual;

-- nvl로 해결	
select employee_id, 
		salary, 
		salary + salary*nvl(commission_pct, 0)
	from employees;

-- nvl2 로 해결
select employee_id, 
		salary, 
		nvl2(commission_pct, salary + salary*commission_pct, salary) as "연봉"
	from employees;
	
-- nullif
select nullif( 10, 5 + 5 ) from dual;
select nullif( 10, 5 + 4 ) from dual;

-- coalesce : 파라미터 개수제한 X, 첫 번째 파라미터가 null이면 다음 파라미터, null이 아닌놈이 나올 때까지
select coalesce( null, null, 1, 2, 3, 4 ) from dual;
select coalesce( 10, null, 1, 2, 3, 4 ) from dual;