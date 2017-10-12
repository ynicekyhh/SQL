-- alter table

select * from article;

alter table book add( pubs varchar2(120) );

alter table book modify( pubs varchar2(200) );

alter table book rename column pubs to publishing;

alter table book drop column publishing;

alter table book modify( author varchar2(120) not null );

alter table book set unused( author );

alter table book drop unused columns;

-- truncate vs drop

truncate table book; -- 데이터만 삭제

drop table book; --테이블과 데이터 까지 삭제

-- comment
comment on table book is '북정보를 저장하는 테이블';

rename book to article; 
 