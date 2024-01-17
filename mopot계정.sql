-- 회원(MEMBER) 테이블
CREATE TABLE MEMBER (
    USER_NO NUMBER PRIMARY KEY,
    USER_ID VARCHAR2(30) UNIQUE NOT NULL,
    USER_PW VARCHAR2(50) NOT NULL,
    USER_NAME VARCHAR2(20) NOT NULL,
    USER_EMAIL VARCHAR2(70) NOT NULL,
    USER_NICK VARCHAR2(20),
    USER_GENDER VARCHAR2(5),
    USER_BIRTHDAY VARCHAR2(10),
    USER_DATE DATE DEFAULT SYSDATE NOT NULL
);




-- 게시판(CONTENT) 테이블 
CREATE TABLE CONTENT (
    CON_NO NUMBER PRIMARY KEY,
    CON_TITLE VARCHAR2(50) NOT NULL,
    CON_DETAIL VARCHAR2(100) NOT NULL,
    CON_WRITER VARCHAR2(30) NOT NULL,
    CON_CREATE_DATE DATE DEFAULT SYSDATE NOT NULL,
    CON_MODIFY_DATE DATE NOT NULL,
    CON_TAG VARCHAR2(10),
    CON_CATEGORY VARCHAR2(10) NOT NULL,
    CON_STATUS NUMBER DEFAULT 0 NOT NULL,
    USER_NO NUMBER,
    FOREIGN KEY(USER_NO) REFERENCES MEMBER(USER_NO)
);


-- 댓글(Reply) 테이블
CREATE TABLE REPLY (
    RE_NO NUMBER PRIMARY KEY,
    RE_DETAIL VARCHAR2(100) NOT NULL,
    RE_CREATE DATE NOT NULL,
    RE_MODIFY DATE NOT NULL,
    CON_NO NUMBER,
    FOREIGN KEY(CON_NO) REFERENCES CONTENT(CON_NO)
);


-- 태그(TAG) 테이블(보류_말머리)
CREATE TABLE TAG (
    TAG_NO NUMBER PRIMARY KEY,
    TAG_NAME VARCHAR2(20),
    CON_NO NUMBER,
    FOREIGN KEY(CON_NO) REFERENCES CONTENT(CON_NO)
);


-- 시퀀스
CREATE SEQUENCE MOPOT_MEMBER_SEQ;
CREATE SEQUENCE MOPOT_CONTENT_SEQ;
CREATE SEQUENCE MOPOT_REPLY_SEQ;
-- CREATE SEQUENCE MOPOT_TAG_SEQ;

commit;
