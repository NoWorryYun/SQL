/******************************************
계정관리
******************************************/

--계정 만들기
create user webdb identified by 1234;

--권한 설정
grant resource, connect to webdb;

--비밀번호 변경
alter user webdb identified by webdb;

--계정 삭제
drop user webdb cascade;