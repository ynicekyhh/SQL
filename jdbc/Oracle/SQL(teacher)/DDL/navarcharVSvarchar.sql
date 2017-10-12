--navarchar2 vs varchar2

-- characterset 확인
 select value 
  from nls_database_parameters 
 where parameter = 'NLS_CHARACTERSET';
 
 
drop table book;

create table book(
	no number(10),
	title varchar2(4000), -- max 4000byte
	author nvarchar2(2000), -- max 2000 자 (내부적으로 6000byte)
	pub_date date
);

-- error 5byte 을 넘음, '가나' -> 6byte
insert 
  into book 
values( 1, '토지', '가나', sysdate);

insert 
  into book 
values( 1, '토지', '가12', sysdate);

select rowid, no from book;