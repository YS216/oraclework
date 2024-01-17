-- 한줄 주석(ctrl+/)
/*
    여러줄 주석
    alt+shift+c
*/

--커서가 깜빡일 때 ctrl+enter 해당 줄만 실행
-- 나의 계정 보기
show user;

--사용자 계정 조회
select*from DBA_USERS;

--계정 만들기
--[표현법] create user 사용자명 identified by 비밀번호;
--오라클 12버전 부터 일반사용자는 c##을 붙여 이름을 작명한다
-- create user user1 identified by 1234;
create user c##user1 identified by u1234;
create user c##user2 identified by user2;

-- 사용자 이름에 c## 붙이는것을 회피하는 방법
alter session set "_oracle_script"=true;
create user user3 identified by user3;

-- 사용자 이름은 대소문자를 가리지 않음
-- 실제 사용할 계정 생성
create user aie IDENTIFIED by aie;

-- 권한 생성
-- [표현법] grant 권한1, 권한2, ... to 계정명;
grant RESOURCE, CONNECT to aie;

-- 테이블스페이스에 얼마만틈의 영역을 할당할 것인지를 부여
alter user aie default tablespace users quota unlimited on users;

-- 테이블스페이스의 영역을 특정 용량만큼 할당하려면 
alter user user3 quota 30M on users;

-- user 삭제
-- [표현법] drop user 사용자명; => 테이블이 없는 상태
-- [표현법] drop user 사용자명 cascade; => 테이블이 있을 때
drop user c##user1;

alter session set "_oracle_script"=true;
create user workbook identified by workbok;
grant RESOURCE, CONNECT to workbook;
alter user workbook default tablespace users quota unlimited on users;


alter session set "_oracle_script" = true;
create user ddl identified by ddl;
grant resource, connect to ddl;
alter user ddl default tablespace users quota unlimited on users;

alter session set "_oracle_script" = true;
create user mybatis identified by mybatis;
grant resource, connect to mybatis;
alter user mybatis default tablespace users quota unlimited on users;

alter session set "_oracle_script" = true;
create user springboot identified by springboot;
grant resource, connect to springboot;
alter user springboot default tablespace users quota unlimited on users;

alter session set "_oracle_script" = true;
create user mopot identified by mopot;
grant resource, connect to mopot;
alter user mopot default tablespace users quota unlimited on users;