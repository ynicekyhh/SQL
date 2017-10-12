-- varchar vs varchar2
-- oracle에서 varchar는 다른 용도로 사용하기 위해 varchar2를 사용하기를 권장함, 아직까지 둘의 기능은 같음

-- nvarchar2 vs varchar2

drop table book;

-- varchar2는 4000byte까지
-- create table book(	no number(10),	title varchar2(4001),	author varchar2(5),	pub_date date);

create table book(
	no number(10),
	title varchar2(4000), -- max 4000byte
	author nvarchar2(2),	-- 한글 쓸 때는 nvarchar2가 좋음. 글자의 개수만큼 byte를 잡음.
	pub_date date
);

-- varchar2로 할 때는 error 5byte 를 넘음, '가나' -> 6byte(UTF-8)
insert into book values( 1, '토지', '가나', sysdate);

-- nvarchar2로 할 때 에러
insert into book values( 1, '토지', '가12', sysdate);

select * from book;


drop table book;

-- 2000자 넘으면 에러
create table book(
	no number(10),
	title varchar2(4000), -- max 4000byte
	author nvarchar2(2000),	-- max 2000자까지, 
	pub_date date
);

-- ROWID는 row의 특정 id(어떤 애가 어디에 위치되어 있는지, DDL_DCL.ppt 참고)
-- TIMESTAMP는 Date값을 Long값으로 받아 클라이언트쪽에서 값을 받아 형식을 처리하도록 하기에 편하다. 특히 클라이언트가 웹, 안드로이드 등 같이 여러개일 때 좋음


