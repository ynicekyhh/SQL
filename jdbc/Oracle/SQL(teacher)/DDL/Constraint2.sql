-- 1) drop sequence
drop sequence seq_book; 
drop sequence seq_author; 

--2) drop tables
drop table book cascade constraint;
drop table author cascade constraint;

--3) create sequence
create sequence seq_book 
start with 1
increment by 1
maxvalue 9999999999;

create sequence seq_author 
start with 1
increment by 1
maxvalue 9999999999;


--4) create tables
create table author(
	no number(10),
	name nvarchar2(200) not null,
	profile nvarchar2(2000)
);

alter table author 
add constraint c_author_pk
primary key( no );

create table book(
	no number(10),
	title varchar2(200) not null,
	author_no number(10),
	state varchar2(12) not null,
	pub_date date
);

alter table book 
add constraint c_book_pk
primary key( no );

alter table book
add constraint c_book_check
check( state in ('대여중', '대여가능'));

alter table book
add constraint c_book_fk
foreign key( author_no )
references author(no)
on delete set null;

-- test
insert into author 
values( seq_author.nextval, '박경리', null);

select * from author;

insert into book
   values( seq_book.nextval, '토지', 1, '대여가능', sysdate);
   
select * from book;


delete from author where no = 1;
   