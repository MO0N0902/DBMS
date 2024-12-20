-- 2번 연산자

-- 연산자 피연산자 자리에 어떤 타입의 값이 오는지
-- 연산자가 어떻게 동작하는지
-- 연산의 결과가 어떤 타입의 값인지 아는것이 중요하다

-- 자료형 : 문자형(CHAR, VARCHAR2), 숫자형(NUMBER), 날짜(DATE)

-- 1) 연결연산자
-- A||B : A와 B를 연결해준다
-- DUAL 테이블 : 다른 테이블을 참조할 필요 없이 값을 확인하고 싶을 때 사용할 수 있는 테이블
-- 				(오라클에서 지원함)
SELECT 10 || 20
FROM DUAL;

SELECT 'A', 'B', 'A'||'B'
FROM DUAL;

--  EMPLOYEES 테이블에서 성을 붙여서 이름이라는 별칭으로 조회
SELECT FIRST_NAME, LAST_NAME, FIRST_NAME ||' '|| LAST_NAME 이름
FROM EMPLOYEES;

SELECT HIRE_DATE ||'안녕'
FROM EMPLOYEES;

-- [실습]사원의 이름과 메일주소를 출력하기
-- 이때 이름은 FIRSTNAME과 LASTNAME이 띄어쓰기로 이어져서 이름이라는 컬럼명으로 있고
-- 메일주소는 사원메일주소 @KOREAIT.COM으로 메일조소라는 컬럼명으로 되어있다
SELECT FIRST_NAME ||' '|| LAST_NAME 이름, EMAIL || '@koreait.com' "메일 주소" 
FROM EMPLOYEES;

-- 2. 산술연산자
SELECT  employee_id, employee_id + 10, employee_id - 10, employee_id *10, employee_id /2
FROM EMPLOYEES;

-- 날짜 타입과 산술연산
-- 날짜와 숫자
SELECT hire_date, hire_date + 10, hire_date-10
FROM EMPLOYEES;

-- 날짜와 날짜
SELECT SYSDATE 
FROM dual;

--날짜 + 날짜는 오류 발생
SELECT  hire_date, SYSDATE, SYSDATE  + hire_date
FROM EMPLOYEES;

SELECT  hire_date, SYSDATE, SYSDATE  - hire_date
FROM EMPLOYEES;

-- 날짜와 숫자의 연산에서 기본적으로 숫자는 일 수를 의미하기 때문에 시간, 분 단위로 연산하고 싶다면
-- 일(24h)로 환산해야한다
SELECT SYSDATE ,
	SYSDATE - 0.5
--  sysdate - 12/24 -- 12시간
--  sysdate + 1/24   -- 1시간
--  sysdate - 30/60/24 -- 30분 
	FROM dual;


-- 5) 논리 연산자
-- AND, OR, NOT
-- 피연산자 자리에 조건이 온다, 여러개의 조건을 연결할 때 사용한다

--EMPLOYEES 테이블에서 부서가 영업부서 이면서 봉급 10000이상인 직원들의 
-- 이름, 성, 급여, 부서ID 를 급여 오름차순으로 조회하기

SELECT DEPARTMENT_ID 부서ID, LAST_NAME ||' '|| FIRST_NAME 이름, SALARY 급여
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 80 AND SALARY >= 10000
ORDER BY SALARY;




--6) SQL 연산자
-- BETWEEN a AND b 

-- employees 테이블에서 salary가 10000이상 12000이하인 직원의 
-- first_name, last_name, salary를 오름차수능로 조회
SELECT first_name, last_name, salary
FROM EMPLOYEES
WHERE SALARY BETWEEN 10000 AND 12000
ORDER BY salary;


-- 10000, 11000, 12000 인 사원만 조회
SELECT first_name ||' '|| last_name 이름, salary 급여
FROM EMPLOYEES
WHERE SALARY IN(10000, 11000, 12000)
ORDER BY salary;

-- LIKE : 문자 조건, 패턴을 만들 때 사용한다
-- % : ~아무거나 _ : 자리수
SELECT FIRST_NAME
FROM EMPLOYEES
WHERE  FIRST_NAME  LIKE '____e'

SELECT FIRST_NAME
FROM EMPLOYEES
WHERE  FIRST_NAME  LIKE '%e'

SELECT FIRST_NAME
FROM EMPLOYEES
WHERE  FIRST_NAME  LIKE '%e%n%'
	

-- %e% : e를 포함하는 문자 의미
-- %en% : en을 포함하는 문자를 의미
-- %e%n% : e와 n을 포함하는 문자를 의미 
-- %e_n% : e와 n사이에 한글자 더있는 문자를 의미 

-- IS NULL / IS NOT NULL
-- NULL : 데이터가 없음을 나타내는 값
-- NULL은 연산하면 결과가 NULL이다

SELECT NULL + 10
FROM DUAL;

-- EMPLOYEES 테이블에서 COMMISSION_PCT를 조회하기

SELECT FIRST_NAME, LAST_NAME, COMMISSION_PCT
FROM EMPLOYEES
WHERE  COMMISSION_PCT IS NULL;

SELECT FIRST_NAME, LAST_NAME, COMMISSION_PCT
FROM EMPLOYEES
WHERE  COMMISSION_PCT IS NULL;


-- 직원의 이름, 봉급, 인상봉금, 감축봉급을 조회하기
-- 이름은 성과 함께 끠어쓰기로 연결되어있다
-- 인상봉급은 기존 봉급의 10퍼증가
-- 감축봉급은 10퍼 감소
-- 결과를 기존봉급 오름차순으로 정렬하여 조회한다

SELECT first_name ||' '|| last_name 이름, salary*1.1 인상봉급, SALARY*0.9 감축봉급
FROM EMPLOYEES 
ORDER BY SALARY;










SELECT *FROM EMPLOYEES;