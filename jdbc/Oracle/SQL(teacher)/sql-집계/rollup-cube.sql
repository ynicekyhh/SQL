-- rollup, cube

-- 문) 부서별, 직책별   사원수, 평균월급를 출력하세요. 
select department_id,
       job_id,
       count(*),
	   avg(salary)
  from employees
group by department_id, job_id
order by department_id, job_id;


select case grouping( department_id )
	      when 1 then '모든 부서'
	      else nvl( to_char( department_id ), '없음' )
	   end as "부서",
	   
	   case grouping( job_id )
	   	  when 1 then '모든 직책'
		  else nvl( to_char( job_id ), '없음' )
	   end as "직책",
       
	   count(*) as "사원수",
	   
	   round(avg(salary),0) as "평균월급"
	   
  from employees
group by rollup(department_id, job_id)
order by department_id, job_id;


select case grouping( department_id )
	      when 1 then '모든 부서'
	      else nvl( to_char( department_id ), '없음' )
	   end as "부서",
	   
	   case grouping( job_id )
	   	  when 1 then '모든 직책'
		  else nvl( to_char( job_id ), '없음' )
	   end as "직책",
       
	   count(*) as "사원수",
	   
	   round(avg(salary),0) as "평균월급"
	   
  from employees
group by cube(department_id, job_id)
order by department_id, job_id;  