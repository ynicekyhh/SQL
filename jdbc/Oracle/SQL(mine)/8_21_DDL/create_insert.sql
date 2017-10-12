-- create
create table book(
	no number(10),
	title varchar2(120),
	author varchar2(50),
	pub_date date
);

-- insert
insert 
	into book
values('1', '토지', '박경리', to_date('2005/03/12', 'yyyy/mm/dd'));

commit;
select * from book;


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