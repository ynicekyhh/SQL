-- drop & create sequence
-- sequence는 eXERD가 지원하지 않으니까
drop sequence seq_author;
create sequence seq_author
start with 1
increment by 1
maxvalue 9999999999;

drop sequence seq_book;
create sequence seq_book
start with 1
increment by 1
maxvalue 9999999999;

select * from book;
drop table book;
commit;

-- getList
  select no, name, profile 
    from AUTHOR 
ORDER BY no; 

-- insert
insert 
  into author
values ( seq_author.nextval, '맹자', '책책책' );

insert 
  into author
values ( seq_author.nextval, '공자', '사람은 먹기 위해 태어났다.' );

insert 
  into author
values ( seq_author.nextval, '웅섭', '운동이 제일 쉬웠어요' );

insert 
  into author
values ( seq_author.nextval, '현민', '여긴어디 나는누구' );

insert 
  into author
values ( seq_author.nextval, '계현', '커피 그것은 1초간의 긴장감' );

insert 
  into author
values ( seq_author.nextval, '효연', '인생 빡빡하게 살지마' );

insert 
  into author
values ( seq_author.nextval, '혜연', '백투더퓨처' );

insert 
  into author
values ( seq_author.nextval, '서원', '인생은 6시부터' );

-- 반영되면 안되니까
rollback;
select * from author;
select * from book;

insert
  into book
values ( seq_book.nextval, '왜 우리는 술을 마시는가', '대여중', 3 );

insert
  into book
values ( seq_book.nextval, '사람은 언제나 잘 수 있다', '대여가능', 5 );

insert
  into book
values ( seq_book.nextval, '직장생활 정복기', '대여가능', 4 );

insert
  into book
values ( seq_book.nextval, '나에게 학원이란..?', '대여중', 6 );

insert
  into book
values ( seq_book.nextval, '먹어야 산다.', '대여중', 3 );

insert
  into book
values ( seq_book.nextval, '현자타임', '대여가능', 2 );

insert
  into book
values ( seq_book.nextval, '오늘부터 헬스시작', '대여가능', 7 );

insert
  into book
values ( seq_book.nextval, '★칼퇴하는법★', '대여중', 8 );


select b.NO, b.TITLE, a.NAME, b.STATE
  from BOOK b,
  	   AUTHOR a
 where b.AUTHOR_NO = a.NO;
 
update book set state='대여가능' where no='9';

commit;

select title from book where no = '3';
