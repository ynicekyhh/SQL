-- rollup, cube

-- 문) 부서별, 직책별 사원수, 평균월급을 출력하세요.
select department_id,
		job_id,
		count(*),
		avg(salary)
  from EMPLOYEES
group by department_id, job_id
order by department_id, job_id;

-- rollup 방법	-- grouping이 된 것인지 아닌지 분명히 알 수 있음( '1'이면 grouping이 안된 것 )
select 	case grouping( department_id )
			when 1 then '모든 부서'
			else nvl(to_char(department_id), '없음')
		end as "부서",
		
		case grouping(job_id)
			when 1 then '모든 직책'
			else job_id
		end as "직책",
		
		count(*),
		round(avg(salary),0)
  from EMPLOYEES
group by rollup(department_id, job_id)
order by department_id, job_id;


-- cube는 교재참고
