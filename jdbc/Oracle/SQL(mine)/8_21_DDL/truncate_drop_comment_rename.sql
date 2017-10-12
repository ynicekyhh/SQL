-- truncate vs drop

-- 데이터만 삭제
truncate table book;

-- 테이블 삭제
drop table book;

-- comment : 테이블이나 컬럼에 주석을 달아준다.
-- sql developer나 sql을 다루는 프로그램에서 보여주는 경우가 있다. toad에선 BOOK table을 클릭하면 Quick Doc에 표시됨
comment on table book is '북정보를 저장하는 테이블';

-- rename : 테이블 이름 변경
rename book to article;