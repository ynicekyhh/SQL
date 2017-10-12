-- top-k

-- 쓰레기 1
-- 이렇게 하면 where 조건문으로 걸러진 테이블에 rownum을 붙이는데, order by로 정렬이 되면서 rownum의 의미가 없어진다.
select rownum, employee_id, salary
  from employees
 where hire_date like '06%'
order by salary desc;

-- 따라서 이런식으로 subquery를 이용할 것
-- 앞에서 3개 뽑는 경우 (top-k)
select rownum, employee_id, salary
  from(select employee_id, salary
	 	 from employees
	  	where hire_date like '06%'
	 order by salary desc)
 where rownum <= 3;

-- 쓰레기 2
-- 6번째부터 10번째를 뽑는 경우 rownum은 table을 가져와서 rownum을 세팅하고 where절을 타는데, rownum 1번을 세팅하고 where절 비교 후 조건에 맞으면 출력한다.
-- 그런데, rownum의 1번이 출력되지 않으면 그 다음것이 1번으로 되어 결국 6 ~ 10은 출력되지 않게 된다.
select rownum, employee_id, salary
  from(select employee_id, salary
	 	 from employees
	  	where hire_date like '06%'
	 order by salary desc)
 where 6 <= rownum and rownum <= 10;

-- 그럼 어떻게 해결하느냐? : 앞에서 5개 뽑는 경우(top-k)
-- ****** rownum, level 등은 oracle에만 있는 것, mysql은 limit등을 이용해 더 쉽게 할 수 있음
select *
from (select rownum as rn, 
			employee_id, salary
  		from(select employee_id, salary
			  from employees
			 where hire_date like '06%'
		  order by salary desc))
--where 6 <= rn and rn <= 10;
where rn between 6 and 10;

-- rownum 사용 예시 : 게시판 페이지 계산할 때 rownum응 응용사용함
select *
from (select rownum as rn, 
			employee_id, salary
  		from(select employee_id, salary
			  from employees
			 where hire_date like '06%'
		  order by salary desc))
where 5*(3-1)+1 <= rn and rn <= 5*(3);
