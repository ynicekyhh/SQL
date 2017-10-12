-- constraint
-- primary key로 지정한 놈은 max(no)값을 받아 java code에서 max(no) + 1을 해서 처리할 수 있으나, DB동시 접근성때문에 문제가 될 수 있다.
-- 따라서 sequence를 사용하여 DB동시접근성을 허용하게 해 준다. 자동으로 값을 증가시킨다.

-- 내가 쓰던건 날라가서 강사님걸로 대체할 것...

-- constraints

drop table book;

create table book(
	no number(10),
	title varchar2(200) not null,
	author nvarchar2(50) not null,
	state varchar2(12) not null,
	pub_date date,
	
	primary key( no ),
	constraint c_book_check check( state in ('대여중', '대여가능'))
);

create sequence seq_book
start with 1
increment by 1
maxvalue 9999999999;

select seq_book.nextval from dual;
select seq_book.currval from dual;

-- primary key 은 null 안됨(not null)
insert 
  into book
values ( null, '토지', '박경리', sysdate);  

insert 
  into book
values ( 1, '토지', '박경리', sysdate);  

-- primary key는 중복 되면 안됨(unique)
insert 
  into book
values ( 1, '토지2', '박경리2', sysdate);  

insert 
  into book
values ( seq_book.nextval, 
         '토지2', 
		 '박경리2', 
		 sysdate);  

insert 
  into book
values ( seq_book.nextval, 
         '토지2', 
		 '박경리2', 
		 '대여가능',
		 sysdate); 

select * from book;
