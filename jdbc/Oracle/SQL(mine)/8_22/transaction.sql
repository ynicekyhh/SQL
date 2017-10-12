SET TRANSACTION READ ONLY;
commit;

select * from author;
update author set name = '둘리2' where no=7;
commit;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
commit;
select * from author;

update author set name = '둘리40' where no=7;