-- create table

create table book(
	no number(10),
	title varchar2(120),
	author varchar2(50),
	pub_date date
);

-- 에러 예약어는 이름으로 사용 못함
create table user(
   no number(10)
); 


-- insert
insert 
  into book
values (1, '토지', '박경리', to_date('2017/08/21', 'yyyy/mm/dd'));

-- delete
delete 
  from book
 where no = 1;

-- update
update book
   set title = '토지2'
 where no = 1;  

commit;
rollback;

select * from book;

