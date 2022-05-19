
--author 테이블 생성
create table author(
    author_id number(10),
    author_name varchar2(100) not null,
    author_desc varchar2(500),
    primary key(author_id)
);

--author 내용 추가
insert into author 
values(1,'박경리','토지 작가');

--author 내용 부분 추가
insert into author(author_id, author_name)
values(2,'이문열');

--순서가 바뀌어도 돌아감
insert into author(author_name, author_id)
values('기안84', 3);

-- not null 부분은 비워둘 수 없음
insert into author(author_id)
values(4);

select *
from author;

--book table 생성
create table book(
    book_id number(10),
    title varchar2(100) not null,
    pubs varchar2(100),
    pub_date date,
    author_id number(10),
    primary key(book_id),
    constraint book_fk foreign key(author_id)
    references author(author_id)
);

select *
from book;

-- 1, 토지, 마로니에북스, 2012-08-15 , 1
insert into book
values(1, '토지', '마로니에북스', '2012-08-15', 1);

-- 2, 삼국지, 민음사, 2002-03-01, 2
insert into book
values(2, '삼국지', '민음사', '2002/03/01', 2);

-- 내용 수정
update author
set author_desc = '삼국지 작가'
where author_id = 2;

--내용 수정 // where절에 영역을 구분해주지 않으면 author_desc 전체 부분이 바뀜
update author
set author_desc = '웹툰작가';

update author
set author_name = '김경리',
    author_desc = ''
where author_id = 1;

delete from author
where author_id = 3;





select *
from author;
--행 삭제
delete from book;

delete from author;

--table 삭제
drop table book;
drop table author;