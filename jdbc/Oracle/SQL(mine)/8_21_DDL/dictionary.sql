-- dictionary : toad같은 DB view 툴을 만들고 싶다면, oracle이 제공하는 dictionary를 통해 모든 정보를 받아올 수 있다.

select * from dictionary;

select * from user_objects;

select *
  from user_objects
 where object_type = 'SEQUENCE';
 
select *
 from user_objects
where object_type = 'TABLE';

select * from user_users;
select * from all_users;
-- select * from dba_users;

-- 제약조건 조회
-- user나 all 등으로 시작하는 애들은 view table
select * 
  from user_constraints
 where table_name = 'BOOK';
 
-- 현재 접속한 계정 정보
select * from user_users;