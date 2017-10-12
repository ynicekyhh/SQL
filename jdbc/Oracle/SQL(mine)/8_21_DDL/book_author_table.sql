-- 손으로 하면 fk관계의 테이블 먼저 삭제해야하는 등 개발자가 순서를 잘 명시해줘야함
-- 그래서 이런 부분들을 해결하기 위해 alter table을 사용함
-- 모델링 툴을 사용하면 이런 불편한 부분들을 다 지원해줌

-- author sequence
drop sequence seq_author;

create sequence seq_author
start with 1
increment by 1
maxvalue 9999999999;

-- author table
drop table author;

-- author는 book에서 중복해서 계속 나올 수 있으니 따로 테이블을 만들어 빼는게 관리하는 데 있어 효율적!!
create table author(
	no number(10),
	name nvarchar2(200) not null,
	profile nvarchar2(2000),
	
	primary key(no)
);

-- book sequence
drop sequence seq_book;

create sequence seq_book
start with 1
increment by 1
maxvalue 9999999999;

-- book table
drop table book;
alter table book drop constraint c_book_fk;
alter table book drop constraint c_book_check;

create table book(
	no number(10),
	title varchar2(200) not null,
	author_no number(10) not null,
	state varchar2(12) not null,
	pub_date date,	
	
	primary key(no),
	constraint c_book_fk 
	foreign key(author_no) 
	references author(no)
	on delete cascade,	-- 참조키 삭제 시 함께 삭제 --
	constraint c_book_check check( state in ('대여중', '대여가능'))
);

insert into author values( seq_author.nextval, '박경리', null );

-- 이렇게 하면 에러, fk는 foreign key관계에 있는 테이블에 값이 있어야 한다.(author를 같이 정보를 받던지, author부터 쭉 만들어 놓고나서 해야 함)
-- '토지' 옆의 '1'이 author table의 1번째 값이니 꼭 author부터..
insert into book
  values( seq_book.nextval, '토지', 1, '대여가능', sysdate );
  
select * from book;

-- fk관계로 이미 author table의 no = 1값을 book에서 참조하고 있으니 삭제 불가(violated error)
-- 이럴 경우 무결성 유지를 위해서
-- 1. 아예 삭제를 못하게 하거나,
-- 2. fk관계에 있는 녀석들을 같이 삭제를 한다 ( on delete cascade option )
delete from author where no = 1;