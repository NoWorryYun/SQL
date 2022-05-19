create table author(
    author_id number(10),
    author_name varchar2(100) not null,
    author_desc varchar2(500),
    primary key(author_id)
);

--작가 시퀀스 만들기
create SEQUENCE seq_author_id   --이름 설정
increment by 1      --1씩 올려라
start with 1
nocache;

drop table author;


insert into author
values(seq_author_id.nextval, '박경리', '토지 작가');


insert into author
values(seq_author_id.nextval, '이문열', '삼국지 작가');


insert into author
values(seq_author_id.nextval, '기안84', '웹툰 작가');

insert into author
values(seq_author_id.nextval, '윤성한', '너무어렵당');

insert into author
values(seq_author_id.nextval, '유재석', '개그맨');

--sequence 확인
select *
from user_sequences;

--현재 몇번까지 번호가 진행됬는지 확인
select seq_author_id.currval
from dual;


--다음 번호가 몇번인지 확인
select seq_author_id.nextval
from dual;


drop sequence seq_author_id;


select *
from author;

--현재 상태 저장
commit;

--마지막 commit한 상태로 돌아감 //dml이 아니기 때문에 테이블을 삭제했을 경우 복구가 안됨. 백업한게 없으면 큰일남
rollback;


insert into author
values (seq_author_id.nextval, '이효리', '가수');


create table book (
book_id number(10),
title varchar2(100) not null,
pubs varchar2(100),
pub_date date,
author_id number(10),
primary key(book_id)
);

