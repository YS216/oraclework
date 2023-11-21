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

--------------------------------------------------------------------------------------------------------------
/*    
    <distinct>
    컬럼의 중복된 값들을 한번씩만 표시하고자 할 때
*/

select job_code
from employee;

-- employee에서 직급코드 중복 제외하여 조회
select distinct job_code
from employee;

-- employee에서 부서코드 중복 제외하여 조회
select distinct dept_code
from employee;

-- 유의사항 select절에서 distinct 는 한번만 기술
--select distinct dept_code, 

--------------------------------------------------------------------------------------------------------------
/*
    <where절>
    조회하고자 하는 테이블에서 특정 조건에 만족하는 데이터만 조회할 때
    where절에 조건식을 제시
    
    [표현법]
    select 컬럼, 컬럼, 산술연산, ...
    from 테이블명
    where 조건식;
    
    >>비교연산자
    >, <, >=, <= : 대소비교
    =            : 같은지 비교
    !=, ^=, <>   : 같지않은지 비교
*/    
-- employee에서 부서코드가 'd9'인 사원들의 모든 칼럼 조회
select *
from employee
where dept_code = 'D9';

-- employee에서 부서코드가 'D1'이 아닌 사원들의 사원들의 사번, 사원명, 부서코드를 조회
select emp_id, emp_name, dept_code
from employee
where dept_code <> 'D1';    -- !=, <>, ^=

--employee에서 급여가 400만원이상인 사원들의 사원명, 부서코드, 급여 조회
select emp_name, dept_code, salary
from employee
where salary >= 4000000;

-- employee에서 재직중인 사원의 사번, 사원명, 입사일 조회
select emp_id, emp_name, hire_date
from employee
where ent_yn = 'N';

--------------------------------------------------------------------------------------------------------------
--------------------실습 문제--------------------
-- 1. 급여가 300만원 이상인 사원들의 사원명, 급여, 입사일, 연봉 조회
select emp_name 사원명, salary 급여, hire_date 입사일, salary*12 연봉
from employee
where salary > 3000000;

-- 2. 연봉이 5000만원 이상인 사원들의 사원명, 급여, 연봉, 부서코드 조회
select emp_name 사원명, salary 급여, salary*12 연봉, dept_code 부서코드
from employee
where salary*12 > 50000000;

-- 3. 직급코드가 'J3'이 아닌 사원들의 사번, 사원명, 직급코드, 퇴사여부 조회
select emp_id 사번, emp_name 사원명, dept_code 직급코드, ent_yn 퇴사여부
from employee
where dept_code <> 'J3';

--------------------------------------------------------------------------------------------------------------
/*
    >>논리연산자
    여러개의 조건을 묶어서 제시하고자 할 때
    
    AND(~이면서, 그리고)
    OR(~이거나, 또는)
    NOT (부정) : 클럼명 앞에 
*/
-- 부서코드가 'D9'이면서 급여가 500만원 이상인 사원들의 사원명, 부서토드, 급여 조회
select emp_name, dept_code, salary
from employee
where dept_code = 'D9' and salary >= 5000000;

-- 부서코드가 'D6'이거나 급여가 300만원 이상인 사원들의 사원명, 부서코드, 급여 조회
select emp_name, dept_code, salary
from employee
where dept_code = 'D6' or salary >= 3000000;

-- 급여가 350만원 이상 600만원 이하인 사원의 사번, 사원명, 급여 조회
select emp_id, emp_name, salary
from employee
where salary >= 3500000 and salary <= 6000000;

--------------------------------------------------------------------------------------------------------------
/*
    >>BETWEEN AND
    ~이상 ~이하인 범위의 조건을 제시할 때
    
    [표현법]
    비교대상컬럼 between 하한값 and 상한값
    -> 해당 컬럼값이 하한값 이상이고 상한값 이하인 경우
*/    
-- 급여가 350만원 이상 600만원 이하인 사원의 사번, 사원명, 급여 조회
select emp_id, emp_name, salary
from employee
where salary between 3500000 and 6000000;

-- 급여가 350만원 이상 600만원 이하를 제외한 사원의 사번, 사원명, 급여 조회
select emp_id, emp_name, salary
from employee
where not salary between 3500000 and 6000000;

-- 입사일이 90/01/01 ~ 01/12/31 사이인 사원의 사번, 사원명, 입사일 조회
select emp_id, emp_name, hire_date
from employee
where hire_date between '90/01/01' and '01/12/31';

--------------------------------------------------------------------------------------------------------------
/*
    >>LIKE
    비교하고자하는 컬럼값이 내가 제시한 특정 패턴에 만족하는 경우 조회
    
    [표현법]
    비교대상컬럼 LIKE '특정패턴'
    : 특정패턴 제시시 '%', '_' 와일드카드로 사용할 수 있음
    
    * '%' : 0글자 이상
    EX) 비교대상컬럼 LIKE '문자%' => 비교대상 컬럼값이 '문자'로 시작되는 것들을 조회
        비교대상컬럼 LIKE '%문자' => 비교대상 컬럼값이 '문자'로 끝나는 것들을 조회
        비교대상컬럼 LIKE '%문자%' => 비교대상 컬럼값이 '문자'가 포함되는 것들을 조회
    
    *'_' : 1글자
    EX) 비교대상컬럼 LIKE '_문자' => 비교대상 컬럼값의 '문자'앞에 무조건 한글자가 올 경우 조회 (3글자만 가능)
        비교대상컬럼 LIKE '문자_' => 비교대상 컬럼값의 '문자'뒤에 무조건 한글자가 올 경우 조회 (3글자만 가능)
        비교대상컬럼 LIKE '_문자_' => 비교대상 컬럼박의 '문자'앞과 뒤에 무조건 한글자씩 올 경우 조회 (4글자만 가능)
*/
-- 사원들 중 성이 '진'씨인 사원들의 사번, 사원명 조회
select emp_id, emp_name
from employee
where emp_name like '전%';

-- 사원들 중 '하'가 포함되어있는 사우너들의 사번, 사원명 조회
select emp_id, emp_name
from employee
where emp_name like '%하%';

-- 사원들 중 가은데 글자에 '하'가 들어있는 사원(3글자)들의 사번, 사원명 조회
select emp_id, emp_name
from employee
where emp_name like '_하_';

-- 전화번호 중 세번째 글자가 '1'인 사원의 사번, 사원명, 전화번호 조회
select emp_id, emp_name, phone
from employee
where phone like '_1%';

-- 이메일 중 _앞애 글자가 3글자인 사원들의 사번, 사원명, 이메일 조회
select emp_id, emp_name, email
from employee
where email like '____%'; -- 언더바 4개
/*
    와일드카드로 인식이 됨
    - 데이터와 와일드카드를 구분지어야함
    : 데이터값으로 취급하고자 하는 값 앞에 나만의 와일드카드(아무거나 문자, 숫자, 특수문자)를 제시하고
      나만의 와일드카드 escpte로 등록해야함
*/    

select emp_id, emp_name, email
from employee
where email like '___$_%' escape '$';

-- 이메일중 _앞에 글자가 세글자인 사원들을 제외한 사원들의 사번, 사원명, 이메일 조회
select emp_id, emp_name, email
from employee
where not email like '___e_%'escape 'e';


--------------------실습 문제--------------------
-- 1. 이름이 '연'으로 끝나는 사원의 사번, 사원명, 입사일 조회

select emp_id, emp_name, hire_date
from employee
where emp_name like '%연';

-- 2. 전화번호 처음 3자리가 010이 아닌 사원들의 사원명, 전화번호 조회

select emp_name, phone
from employee
where not phone like '010%';

-- 3. 이름이 '하'가 포함되어 있고, 급여가 250만원 이상인 사원들의 사원명, 급여 조회

select emp_name, salary
from employee
where emp_name like '%하%' and salary >=2500000;

-- 4. department테이블에서 해외 영업부인 부서들의 부서코드, 부서명 조회

select dept_id, dept_title
from department
where dept_title like '해외%';

--------------------------------------------------------------------------------------------------------------
/*
    >>IS NULL / IS NOT NULL
    컬럼값에 NULL이 있는 경우 NULL값 비교에 사용되는 연산자
*/    
-- 보너스를 받지 않는 사원의 사번, 사원명, 급여, 보너스 조회
select emp_id, emp_name, salary, bonus
from employee
-- where bonus = null; 조회 안됨
where bonus is null;

-- 보너스를 받는 사원의 사번, 사원명, 급여, 보너스 조회
select emp_id, emp_name, salary, bonus
from employee
-- where not bonus is null; : 사용 가능
where bonus is not null;

-- 사수가 없는 사원들의 사번, 사원명, 사수번호 조회
select emp_id, emp_name, manager_id
from employee
where manager_id is null;

-- 부서배치를 받지 않았지만 보너스는 받는 사원들의 사원명, 보너스, 부서코드 조회
select emp_name, bonus, dept_code
from employee
where dept_code is null and bonus is not null;

--------------------------------------------------------------------------------------------------------------

/*
    >> IN/ NOR IN
    IN : 컬럼값이 내가 제시한 목록중에 일치하는 값이 있는 것만 조회
    NOT IN : 컬럼값이 내가 제시한 목록중에 일치하는 값을 제외한 나머지만 조회
    
    [표현법]
    비교대상컬럼 IN ('값1', '값2', '값3', ...)
*/    

-- 부서코드가 D5, D6, D8인 사원의 사원명, 부서코드, 급여조회
select emp_name, dept_code, salary
from employee
-- where dept_code = 'D5' or dept_code = 'D6' or dept_code = 'D8';
where dept_code in ('D5', 'D6', 'D8');

--------------------------------------------------------------------------------------------------------------
/*
    <연산자 우선순위>
    1. ()
    2. 산술연산자
    3. 연결연산자
    4. 비교연산자
    5. is null / like '패턴' / in
    6. between and
    7. not(논리연산자)
    8. and(논리연산자)
    9. or(논리연산자)
*/    
-- 직급코드가 J7이거나 J2인 사원들 중 급여가 200만원 이상인 사원들의 모든 칼럼 조회
select *
from employee
where (job_code = 'J7' or job_code = 'J2') and salary >= 2000000;

--------------------실습 문제--------------------
-- 1. 사수가 없고, 부서배치도 받지 않은 사원들의 사원명, 사수사번, 부서코드 조회
select emp_name, manager_id, dept_code
from employee
where manager_id is null and dept_code is null;

-- 2. 연봉(보너스포함X)이 3000만원 이상이고 보너스를 받지 않은 사원들의 사번, 사원명, 급여, 보너스 조회
select emp_id, emp_name, salary, bonus
from employee
where salary*12 >= 30000000 and bonus is null;

-- 3. 입사일이 95/01/01 이상이고 부서배치를 받은 사원들의 사번, 사원명, 입사일, 부서코드 조회
select emp_id, emp_name, hire_date, dept_code
from employee
where hire_date >= '95/01/01' and dept_code is not null;

-- 4. 급여가 200만원 이상, 500만원 이하고 입사일이 01/01/01이상이고 보너스를 받지 않은 사원들의 사번, 사원명, 급여, 입사일, 보너스 조회
select emp_id, emp_name, salary, hire_date, bonus
from employee
where (salary between 2000000 and 5000000) and hire_date >= '01/01/01' and bonus is null;

-- 5. 보너스포함 연봉이 null이 아니고 이름에 '하'가 포함되어 있는 사원들의 사번, 사원명, 급여, 보너스포함연봉 조회 (별칭부여)
select emp_id 사번, emp_name 사원명, salary 급여, salary*12+salary*bonus 보너스포함연봉
from employee
where salary*12+salary*bonus is not null and emp_name like '%하%';

--------------------------------------------------------------------------------------------------------------
/*
    <ORDER BY 절>
    - 정렬
    - SELECT문 가장 마지막 줄에 작성, 실행순서 또한 맨마지막에 실행
    
    [표현법]
    SELECT 컬럼, 컬럼, ....
    FROM 테이블명
    WHERE 조건식
    ORDER BY 정렬기준이 되는 컬럼명 | 별칭 | 컬럼순번[ ASC | DESC ] | [NULLS FIRST | NULLS LAST]
    
    * ASC : 오름차순 정렬(생략시 기본값)
    * DESC : 내림차순 정렬
    
    * NULLS FIRST : 정렬하고자하는 컬럼값에 NULL이 있는 경우 해당 데이터를 맨 앞에 배치(생략시 DESC일때의 기본값)
    * NULLS LAST : 정렬하고자하는 컬럼값에 NULL이 있는 경우 해당 데이터를 맨 뒤에 배치(생략시 ASC일때의 기본값)
*/
-- 보너스로 정렬
SELECT EMP_NAME, BONUS, SALARY
FROM employee
-- ORDER BY BONUS;  -- 오름차순 기본값 NULL이 끝에 옴
-- ORDER BY BONUS ASC;
-- ORDER BY BONUS NULLS FIRST;
-- ORDER BY BONUS DESC;  -- 내림차순은 반드시 DESC기술, NULL은 맨 앞에 옴
ORDER BY BONUS DESC, SALARY;        -- 기준 여러개 가능

-- 전 사원의 사원명, 연봉조회(연봉의 내림차순 정렬 조회)


