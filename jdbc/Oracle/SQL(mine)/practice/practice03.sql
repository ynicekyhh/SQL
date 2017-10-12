-- 문제1
select emp.EMPLOYEE_ID,
	   emp.FIRST_NAME,
	   d.DEPARTMENT_NAME,
	   e.FIRST_NAME
  from employees emp,
  	   DEPARTMENTS d,
	   EMPLOYEES e
 where emp.DEPARTMENT_ID = d.DEPARTMENT_ID
   and emp.MANAGER_ID = e.EMPLOYEE_ID
order by emp.EMPLOYEE_ID;

-- 현민이형 답, ansi
select emp.EMPLOYEE_ID,
	   emp.FIRST_NAME,
	   d.DEPARTMENT_NAME,
	   e.FIRST_NAME
  from employees emp
  	LEFT OUTER JOIN DEPARTMENTS d ON emp.DEPARTMENT_ID = d.DEPARTMENT_ID
	LEFT OUTER JOIN EMPLOYEES e ON emp.MANAGER_ID = e.EMPLOYEE_ID
order by emp.EMPLOYEE_ID;

-- 문제2
select r.REGION_NAME, c.COUNTRY_NAME
  from REGIONS r
  	LEFT JOIN COUNTRIES c ON r.REGION_ID = c.REGION_ID
order by r.REGION_NAME desc, c.COUNTRY_NAME desc;

-- 문제3
select d.DEPARTMENT_ID,
		d.DEPARTMENT_NAME,
		e.FIRST_NAME,
		city,
		country_name,
		region_name
  from DEPARTMENTS d
  	LEFT JOIN EMPLOYEES e ON d.MANAGER_ID = e.EMPLOYEE_ID
	LEFT JOIN LOCATIONS l ON l.LOCATION_ID = d.LOCATION_ID
	LEFT JOIN COUNTRIES c ON l.COUNTRY_ID = c.COUNTRY_ID
	LEFT JOIN REGIONS r ON c.REGION_ID = r.REGION_ID
order by d.DEPARTMENT_NAME;

-- 문제4


-- 문제5
-- 문제6