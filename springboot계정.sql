create table boardtest1 (
    no number PRIMARY key,
    title VARCHAR2(50),
    writer VARCHAR2(20),
    content VARCHAR2(500)
);

CREATE SEQUENCE BOARDTEST1_SEQ;

COMMIT;