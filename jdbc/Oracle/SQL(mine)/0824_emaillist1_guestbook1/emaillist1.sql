-- create source 
drop SEQUENCE  seq_emillist;

create sequence seq_emaillist
start with 1
increment by 1
maxvalue 9999999999;

-- insert
insert into emaillist
values( seq_emaillist.nextval, '김', '용호', 'ynicekyhh@gmail.com');

commit;

-- list
select no, first_name, last_name, email
  from emaillist;
  
  
select * from emaillist;