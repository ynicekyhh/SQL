SELECT value FROM nls_session_parameters WHERE parameter = 'NLS_DATE_FORMAT';

SELECT * FROM nls_session_parameters;

select add_months( sysdate, 3 ) from dual;
select add_months( '15/01/01', 3 ) from dual;
select add_months( '15-01-01', 3 ) from dual;

select last_day( sysdate ) from dual;
select last_day( '2015-02-01' ) from dual;

select
	months_between( add_months(sysdate, 5), sysdate )
	from dual;
	
select employee_id,
		job_id,
		round(months_between( end_date, start_date )) as "기간"
	from job_history;

-- 요일
-- 1 -> sun, 7 -> sat
select next_day( sysdate, 7 ) from dual;