-- start with ~ connect by 절

-- 하이라키 구조가 만들어지려면 자기참조하는 구조가 되어야 한다.(꼭 그렇지만은 않으나 보통)
select level, e.MANAGER_ID, e.EMPLOYEE_ID
  from EMPLOYEES e
start with e.manager_id is NULL
connect by prior employee_id = manager_id
order by level, e.MANAGER_ID, e.EMPLOYEE_ID;