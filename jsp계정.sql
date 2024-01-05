create table member(
 id VARCHAR2(20) PRIMARY key,
 pwd VARCHAR2(20) not null,
 name VARCHAR2(20) not null,
 gender CHAR(1),
 birthday char(6),
 email VARCHAR2(30),
 zipcode CHAR(5),
 address VARCHAR2(100),
 detailAddress VARCHAR2(50),
 hobby CHAR(5),
 job VARCHAR2(30)
);
INSERT INTO MEMBER VALUES('kim', '1234', '홍길동', '1', '231205', 'kim@naver.com', '12345', '서울특별시 영등포구 당산동 이레빌딩', '19층','11001','학생');
INSERT INTO MEMBER VALUES('lee', '1234', '이길동', '2', '231115', 'lee@naver.com', '23456', '인천광역시 남동구 구월동', '17층','10001','교수');
INSERT INTO MEMBER VALUES('park', '1234', '박길동', '1', '231021', 'park@naver.com', '34567', '경기도 성남시 수정구', '수정아파트','01010','공무원');

commit;

CREATE TABLE votelist (
  num number PRIMARY KEY,
  question varchar2(200) NOT NULL,
  sdate date,
  edate date,
  wdate date,
  type number DEFAULT 1 NOT NULL,
  active number DEFAULT 1
);

CREATE TABLE voteitem (
  listnum NUMBER,
  itemnum NUMBER DEFAULT 0,
  item varchar2(50),
  count NUMBER DEFAULT 0,
  PRIMARY KEY (listnum, itemnum)
); 

CREATE SEQUENCE SEQ_VOTE;