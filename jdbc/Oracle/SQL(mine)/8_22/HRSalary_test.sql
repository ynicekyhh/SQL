select * from author;
commit;
update author set name='도우너' where no=8;

insert into author values( seq_author.nextval, '', '');


select e.LAST_NAME || ' ' || e.FIRST_NAME as name, e.SALARY
  from EMPLOYEES e
 where 2000 <= e.SALARY and e.SALARY <= 10000
order by e.SALARY;