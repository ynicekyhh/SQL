select * from author;
select * from book;

-- DML
-- 암시적(컬럼 지정 x)인 경우에는 순서와, 개수 정확해야 함
insert
  into author
values (seq_author.nextval, '둘리', null);
 
-- 명시적 (컬럼 지정 O)인 경우 지정한 순서와 개수 대로 입력해야 한다.
insert
  into author( name, no )
values ('둘리', seq_author.nextval );

delete 
  from author
 where no is null; 
 
update author
   set name = '도우넛',
       profile = '어쩌고 저쩌고...'
 where no = 3;	   

commit;
   
select * from author;