-- 하나의 커넥션에서 insert, delete등의 작업은 transaction을 고립된 상태에서 진행하기 때문에 실제로 반영은 안되고 가상 테이블에서만 보여줌
-- 실제로 DDL, DCL 을 실행하거나 commit을 할 때 수행됨
select * from author;

insert
  into author
values( seq_author.nextval, '마이콜', null );

delete from author where no = 3;

insert
  into author
values( seq_author.nextval, '둘리', null );

rollback;
commit;