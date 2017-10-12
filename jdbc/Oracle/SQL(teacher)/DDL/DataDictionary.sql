-- Data Dictionary

select * from dictionary;

select * 
  from user_objects;
  
select * 
  from user_objects
 where object_type = 'TABLE';
 
select * from user_users;
select * from all_users;
--select * from dba_users;
  
-- 제약조건 조회
select * 
  from user_constraints
 where table_name = 'BOOK'; 
 
-- 현재 접속한 계정 정보
select * from user_users;  
  

