-- date <-> 문자열

select employee_id,
	   hire_date
  from employees;
  
select employee_id,
to_char(hire_date, 'yyyy-mm-dd')
  from employees;

-- 한글 포맷으로 만들 때는 ""로 감싸줘야한다.
select employee_id,
to_char(hire_date, 'yyyy"년" mm"월" dd"일" hh"시" mi"분" ss"초"')
  from employees;

-- 12시간 단위가 아닌, 24시간단위로 변경
select employee_id,
to_char(hire_date, 'yyyy"년" mm"월" dd"일" hh24"시" mi"분" ss"초"')
  from employees;
  
-- 'pm'을 붙여서 오전, 오후 표시
select employee_id,
to_char(hire_date, 'yyyy"년" mm"월" dd"일" pm hh24"시" mi"분" ss"초"')
  from employees;

-- 'day'를 붙여서 요일 표시
select employee_id,
to_char(hire_date, 'yyyy"년" mm"월" dd"일" day pm hh24"시" mi"분" ss"초"')
  from employees;

-- 월요일, 화요일같은 한글 표현이 싫을 경우, 'd'를 쓰고 뒤에 포맷을 정해줘서 표시하도록 한다.
select employee_id,
to_char(hire_date, 'yyyy"년" mm"월" dd"일" d"요일" pm hh24"시" mi"분" ss"초"')
  from employees;

-- 'ddd'를 쓰면 몇일째인지 표시해준다.
select employee_id,
to_char(hire_date, 'yyyy"년" mm"월" dd"일" ddd"일째" pm hh24"시" mi"분" ss"초"')
  from employees;

--- 'year'로 하면 알파벳으로 표현
select employee_id,
to_char(hire_date, 'year')
  from employees;

-- 'syear'는 BC year를 표시
select employee_id,
to_char(hire_date, 'year:syear')
  from employees;

-- 'RR'포맷은 오라클에서 만든 'YY'포맷 대신 사용함. 1900년대 말 Y2K를 염려하여 만들어짐
select to_char( sysdate, 'RR' ) from dual;

-- 현재 세기(2000)
select to_char( to_date('30', 'RR'), 'yyyy' ) from dual;

-- 이전 세기(1900)
select to_char( to_date('60', 'RR'), 'yyyy' ) from dual;
