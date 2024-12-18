-- SELECT
-- HR 계정내에 존재하는 EMPLOYEES 테이블
-- 107행, 11개의 컬럼으로 이루어져있다
-- 107명의 직원 데이터를 저장해놓은 연습용 테이블

-- SELECT 컬럼명 FROM 테이블명;
-- 해당 테이블에서 특정 컬럼을 선택해서 조회하겠다는 의미


SELECT first_name FROM HR.EMPLOYEES;
SELECT first_name FROM EMPLOYEES;
-- HR 계정을 작성하는 이유는 여러 계정에 같은 이름의 테이블이름이 존재할 수 있기 때문이다
-- 지금 로그인한 계정의 테이블의 우선순위가 높기 때문에 일반적으로 계정명을 생략이 가능하다

SELECT first_name, LAST_NAME 
FROM HR.EMPLOYEES;

SELECT LAST_NAME, FIRST_NAME 
FROM HR.EMPLOYEES;
-- 두개의 결과는 다르다 (출력되는 순서가 다름)

SELECT FIRST_NAME, LAST_NAME, SALARY
FROM EMPLOYEES; 
-- , 이용해서 여러 컬럼 조회하기

-- 정렬해서 조회하기
-- 사원의 이름, 성, 급여를 낮은 순서부터 조회하기

SELECT first_name, last_name, salary --2 이 세가지 컬럼을 조회하는데
FROM EMPLOYEES-- 1) EMPLOYEE 테이블에서
ORDER BY salary ASC; -- SALARY 컬럼의 오름차순으로 정렬해서 조회한다
-- ASC : 오름차순(ascending) 앞글자 3글자만 따서 ASC로 사용

-- DESC : 내림차순(DESCENDING) 앞글자 4글자를 따서 DESC로 사용함
-- 급여 내림차순 정렬
SELECT first_name, last_name, salary 
FROM EMPLOYEES
ORDER BY SALARY DESC;

-- 문자의 정렬 FIRST_NAME(a~z)
SELECT FIRST_NAME --first_name 조회 2
FROM EMPLOYEES -- employee 테이블에서 1
ORDER BY first_name ASC; -- 네임을(문자열)을 오름차순으로 조회 3


-- 날짜의 정렬
SELECT hire_date --hiredate 컬럼 조회 2
FROM EMPLOYEES --employees 테이블에서
ORDER BY HIRE_DATE DESC; -- 고용날짜 내림차순으로 정렬해서 출력

SELECT SALARY
FROM EMPLOYEES
ORDER BY SALARY;
-- ORDER BY절에서 오름차순 내림차순 명령어를 생략하면 무조건 오름차순으로 정렬된다
-- ASC, DESC 생략가능 ASC로 적용

-- ORDER BY 절의 컬럼명은 조회하는 컬럼명과 반드시 일치하지 않아도 가능하다(해당 테이블에 있는 컬럼이라면)
-- 2개의 정렬기준도 가능하다
-- 첫번째 작성한 컬럼의 값을 기준을 잡아 정렬하고 해당 컬럼의 값이 동일하다면 2차적으로 그다음 컬럼값을 기준으로 정렬함
SELECT SALARY
FROM EMPLOYEES
ORDER BY FIRST_NAME;
-- 이름의 오름차순 기준으로 급여를 조회

-- 사원테이블에서 직급을 조회하기
SELECT JOB_ID
FROM EMPLOYEES;

-- JOB_ID DISTINCT 명령어 이용해서 중복제거하고 조회하기
-- DISTINCT : 해당컬럼에서 중복되는값을 제외시킨다
SELECT DISTINCT JOB_ID
FROM EMPLOYEES;

-- 컬럼을 여러개 넣으면 DISTINCT는 어떻게 작동할까?
-- 여러 컬럼을 동시에 작성할 경우 두개의 컬럼이 모두 중복되는 경우에만 중복처리한다
--  JOBID와 HIREDATE 두개가 같을때 제거
SELECT DISTINCT JOB_ID, HIRE_DATE
FROM EMPLOYEES;

-- 별칭 붙여 조회하기
SELECT FIRST_NAME AS "이름", LAST_NAME AS "성", SALARY AS "급여", EMPLOYEE_ID AS "사원번호" 
FROM EMPLOYEES;

-- AS키워드 생략가능
-- "" 생략 가능
-- 별칭에 띄어쓰기가 있으면 "" 생략 불가능
SELECT FIRST_NAME 이름, LAST_NAME 성, SALARY 급여, EMPLOYEE_ID 사원번호 
FROM EMPLOYEES;

-- 사원의 이름, 성, 봉급을 조회하는데 봉급 내림차순으로 별칭사용하여 조회하기
SELECT FIRST_NAME 이름, LAST_NAME 성, SALARY 급여
FROM EMPLOYEES
ORDER BY 급여 DESC;
-- 쿼리문 실행순서 FROM -> SELECT -> ORDERBY


SELECT * FROM EMPLOYEES;

-- 3) 관계연산자
-- 직원의 이름, 성 급여를 조회
-- 급여가 10000 이상인 직원들 조회
SELECT FIRST_NAME 이름, LAST_NAME 성, SALARY 급여
FROM EMPLOYEES
WHERE SALARY >= 10000
ORDER BY 급여; -- 오름차순 정렬

-- 직원의 이름, 성을 조회한다
-- 단, 이름이 PETER인 직원만 골라서 조회한다
SELECT FIRST_NAME 이름, LAST_NAME 성
FROM EMPLOYEES
WHERE FIRST_NAME = 'Peter';
-- peter는 문자타입이므로 반드시 ''로 감싸줘야하며 P를 소문자로 작성하면 안된다
-- 데이터의 대소문자는 정확하게 구분을 한다





















