
--DB에 테이블 추가
create table book (
    book_id     number(5),
    title       varchar2(50),
    author      varchar2(50),
    pub_date    date
);


--테이블에 컬럼추가
alter table book add (pubs varchar2(5));

--테이블에서 컬럼 수정
alter table book modify(title varchar2(100));
alter table book modify(pubs varchar2(50));

--컬럼 이름 변경
alter table book rename column title to subject;

--table에서 컬럼 삭제
alter table book drop (pubs);

--table 이름 변경
rename book to article;
rename article to book;

--DB에서 table 삭제
drop table book;


select *
from book;

