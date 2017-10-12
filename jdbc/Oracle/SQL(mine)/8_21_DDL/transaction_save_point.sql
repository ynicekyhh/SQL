-- transaction save point
delete from author;
commit;
select * from author;

-- DML1
insert 
  into author 
values( seq_author.nextval, '박경리1', null );

-- save point A
savepoint a;

-- DML2
delete from author where no = 6;

-- save point B
savepoint b;


-- DML 3
insert 
  into author 
values( seq_author.nextval, '박경리2', null );

-- test
rollback to b;

select * from author;

rollback to a;

select * from author;

rollback;
select * from author;