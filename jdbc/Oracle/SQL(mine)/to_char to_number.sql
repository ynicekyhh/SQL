-- 숫자 <-> 문자열

select employee_id, salary from EMPLOYEES;

-- 99999는 숫자 표현 자리수를 의미, 자리수 포맷을 작게 하면 데이터가 ####으로 나오고 많아지면 ' '혹은 0으로 채움
select employee_id, to_char(salary, '99999') from EMPLOYEES;		-- 5자리까지만 표시
select employee_id, to_char(salary, '9999') from EMPLOYEES;			-- 4자리수까지만 표시
select employee_id, to_char(salary, '9999999999') from EMPLOYEES;	-- ' '으로 앞자리 채움
select employee_id, to_char(salary, '0000099999') from EMPLOYEES;	-- 0으로 앞자리 채움
select employee_id, to_char(salary, '99,999') from EMPLOYEES;		-- ,를 넣어 표시함
select employee_id, to_char(salary, '9,99,99') from EMPLOYEES;		-- ,를 넣어 표시함

select to_char( 3.14148921, '9.99' ) from dual;
select to_char( 3.14148921, '99,999.99' ) from dual;

select employee_id, to_char(salary, 'FM999999999') from EMPLOYEES;	-- 'FM'을 넣어서 앞으로 자리를 채움
select employee_id, to_char(salary, 'FM$999999999') from EMPLOYEES;	-- '$'를 넣어서 표시해줌
select employee_id, to_char(salary, 'FML999999999') from EMPLOYEES;	-- 'L'을 넣어서 원화로 표시

select to_char(-12345, '99999MI' ) from dual;						-- '-'부호를 뒤에다 넣음
select to_char(-12345, 'S99999' ) from dual;						-- '-'부호를 앞에다 넣음
select to_char(12345, 'S99999' ) from dual;							-- '+'부호를 앞에다 넣음

select to_char(12345, '99999PR' ) from dual;
select to_char(-12345, '99999PR' ) from dual;						-- <>를 넣어 강조함

-- 로마숫자표기
select to_char( 0, 'RN' ) from dual;
select to_char( 1, 'RN' ) from dual;
select to_char( 9999, 'RN' ) from dual;
select to_char( 1000, 'RN' ) from dual;
select to_char( 6, 'RN' ) from dual;

-- 16진수표기
select to_char( 1234, 'XXXX' ) from dual;	-- 16진수 대문자표기
select to_char( 1234, 'xxx' ) from dual;	-- 16진수 소문자표기

-- 숫자로 표기
select to_number( '1234567', '9999999' ) + 10 from dual;	-- 숫자니까 계산 가능
select to_number( '1234567', '9999999' ) from dual;