-- 모든 사용자 확인 ( dba 권한으로 접속함 )
select * from all_users;
select * from dba_users;

-- 사용자 생성
create user ynicekyhh identified by "ynicekyhh";

-- 접속 권한 부여
grant create session to ynicekyhh;

-- 접속 권한 없애기
revoke create session from ynicekyhh;

-- 롤 단위
grant connect, resource to ynicekyhh;

revoke connect, resource from ynicekyhh;

drop user ynicekyhh;

-- 특정 테이블에 권한주기
grant select on dev.book to ynicekyhh;