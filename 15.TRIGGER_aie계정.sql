/*
    < 트리거 TRIGGER >
    내가 지정한 테이블에 INSERT, UPDATE, DELETE 등의 DML문에 의해 변경사항이 생길때
    (테이블에 이벤트가 발생했을 때)
    자동으로 매번 실행할 내용을 미리 정의해둘 수 있는 객체
    
    EX)
    회원탈퇴시 기존의 회원테이블에 데이터 DELETE 후 곧바로 탈퇴된 회원들만 따로보관하는 테이블에 자동으로 INSERT처리해야된다!
    신고횟수가 일정 수를 넘었을때 묵시적으로 해당 회원을 블랙리스트로 처리되게끔
    입출고에 대한 데이터가 기록(INSERT) 될때마다 해당 상품에 대한 재고수량을 매번 수정(UPDATE) 해야될때
    
    * 트리거 종류
    - SQL문의 실행시기에 따른 분류
        > BEFORE TRIGGER : 명시한 테이블에 이벤트가 발생되기 전에 트리거 실행
        > AFTER TRIGGER : 명시한 테이블에 이벤트가 발생한 후에 트리거 실행
        
    - SQL문에 의해 영향을 받는 각 행에 따른 분류
        > STATEMENT TRIGGER (문장트리거) : 이벤트가 발생한 SQL문에 대해 딱 한번만 트리거 실행
        > ROW TRIGGER (행 트리거) : 해당 SQL문 실행할 때 마다 매번 트리거 실행
                                  (FOR EACH ROW 옵션 기술해야됨)        
                              > :OLD - 기존컬럼에 들어 있던 데이터
                              > :NEW - 새로 들어온 데이터

    * 트리거 생성 구문
    
    [표현식]
    CREATE [OR REPLACE] TRIGGER 트리거명
    BEFORE|AFTER INSERT|UPDATE|DELETE  ON 테이블명
    [FOR EACH ROW]
    [DECLARE
        변수선언 ;]
    BEGIN
        실행내용 (해당 위에 지정된 이벤트 발생시 묵시적으로 (자동으로) 실행할 구문)
    [EXCEPTION
        예외처리 구문; ]
    END;
    /
    
    트리거 삭제시 : DROP TRIGGER 트리거이름;
*/