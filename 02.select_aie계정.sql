-- 테이블 컬럼의 정보 조회
/*
(') 홑따옴표 : 문자열일 때
(") 쌍따옴표 : 컬럼명일 때
*/

/*
    <select>
    데이터 조회할 때 사용하는 구문
    
    >> result set : select문을 통해 조회된 결과물(조회된 행들의 집합)
    [표현법]
    select 조회하려는 컬럼명, 조회하려는 컬럼명, ...
    from 테이블명
*/

-- 테이블의 모든 컬럼 조회
select *
from employee;

select *
from department;

-- employee 테이블에서 사번, 이름, 전화번호 조회
select EMP_ID, EMP_NAME, PHONE
from employee;

------------실습 문제------------
-- 1. job 모든 컬럼 조회
select *
from job;
-- 2. department 테이블의 

-- 3. department 테이블의 
-- 4. employee 테이블에서 사번, 이름, 급여, 입사일만 조회
select EMP_ID, EMP_NAME, SALARY, HIRE_DATE
from employee;
/*
    <컬럼값을 통한 산술연산>
    select정 컬럼명 작성부분에 산술연산 기술 가능(이 때 산술연산된 결과 조회)
*/

-- employee에서 사원명, 사원의 연봉(급여*12) 조회
select EMP_NAME, SALARY*12
from employee;

-- employee에서 사원명, 급여, 보너스
select emp_name, salary, bonus
from employee;

-- employee에서 사원명, 급여, 보너스, 연봉, 보너스를 포함한 연봉((급여+(보너스*급여)+12)
select emp_name, salary, bonus, salary*12, (salary+bonus*salary)*12
from employee;
-- 산술연산 중 null이 존재하면 결과는 무조건 null이 됨. 별도 처리(나중에)

-- employee에서 사원명, 입사일, 근무일수(오늘날짜 - 입사일)
-- date형 끼리도 연산 가능: 결과값은 일 단위
-- * 오늘날짜 : sysdate
select emp_name, hire_date, sysdate-hire_date
from employee;
--함수수업시 date 날짜 처리하면 초단위까지 관리 가능

--------------------------------------------------------------------------------------------------------------
/*
    <컬럼명에 별칭 지정하기>
    산술연산시 산술에 들어간 수식 그대로 컬럼명이 됨. 이 때 별칭을 부여하면 깔끔하게 처리
    
    [표현법]
    컬럼명 별칭/ 컬럼명 AS 별칭 / 컬럼명"별칭" / 컬럼명 AS "별칭"
    
    별칭에 띄어쓰기나 특수문자가 포함되면 반드시 ("")쌍따옴표를 넣어줘야 한다.
*/
-- employee에서 사원명, 급여, 보너스, 연봉, 보너스를 포함한 연봉((급여+(보너스*급여)+12)
select emp_name 사원명, salary AS 급여, bonus "보너스", salary*12 "연봉(원)", (salary+bonus*salary)*12 "총 소득"
from employee;

-- employee에서 사원명, 입사일, 근무일수(오늘날짜 - 입사일)
-- date형 끼리도 연산 가능: 결과값은 일 단위
-- * 오늘날짜 : sysdate
select emp_name 사원명, hire_date AS 입사일, sysdate-hire_date "근무일수"
from employee;

--------------------------------------------------------------------------------------------------------------
/*
    <리터럴>
    임의로 지정된 문자열(')
    
    select절에 리터럴을 제시하면 마치 테이블상에 존재하는 데이터 처럼 조회 가능
    조회된 result set 의 모든 행에 반복적으로 출력

*/
-- employee에 사번, 사원명, 급여,원 AS 단위조회
select emp_id, emp_name, salary, '원' AS "단위"
from employee;

--------------------------------------------------------------------------------------------------------------
/*
    <연결 연산자 : ||>
    여러 컬럼값들을 마치 하나의 컬럼값인 것처럼 연결하거나, 컬럼값과 리터럴을 연결할 수 있읍
*/

-- employee에 사번, 사원명, 급여를 하나의 칼럼으로 조회
select emp_id || emp_name || salary
from employee;

select emp_id, emp_name, salary ||'원'
from employee;

-- 홍길동의 월급은 900000원 입니다
select emp_name || '의 월급은 '||salary||'원 입니다'
from employee;

-- 홍길동의 전화번호는 phone이고 이메일은 email입니다
select emp_name|| '의 전화번호는 '||phone||'이고 이메일은 '||email||'입니다'
from employee;