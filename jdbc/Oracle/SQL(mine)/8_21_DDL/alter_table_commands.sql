-- alter table

select * from book;

-- 컬럼 추가
alter table book add( pubs varchar2(120) );

-- 컬럼 수정
alter table book modify( pubs varchar2(200) );

-- 컬럼명 수정
alter table book rename column pubs to publishing;

-- 컬럼 삭제
alter table book drop column publishing;

-- 컬럼 수정 시 not null 추가방법
alter table book modify( author varchar2(120) not null );

-- 삭제(drop column)를 바로 하면 시간이 많이 걸려서 성능문제가 있으니, unused를 사용해서 체크해 놨다가 나중에 한번에 drop unused columns를 사용해 한번에 지운다.
-- 있는지 없는지 존재를 모르니 주의!!
alter table book set unused( author );
alter table book drop unused columns;