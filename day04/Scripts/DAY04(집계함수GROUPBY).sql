SELECT * FROM EMPLOYEES e ;
--집계함수 :  NULL값은 포함하지 않는다
--1, COUNT()
-- 전체직원 수 확인
SELECT COUNT(*)
FROM EMPLOYEES e ;

-- 특정부서 101번의 직원수 확인
SELECT DISTINCT DEPARTMENT_ID 
FROM EMPLOYEES e ;

SELECT COUNT(*) AS "110번의 직원수"
FROM EMPLOYEES e 
WHERE DEPARTMENT_ID =110;

--2. SUM()
--모든직원의 급여 총합 계산
SELECT SUM(SALARY) 급여의합 
FROM EMPLOYEES e ;

-- 부서별 급여 총합 계산
SELECT DEPARTMENT_ID ,SALARY 
FROM EMPLOYEES e ;

SELECT DEPARTMENT_ID , SUM(SALARY) 
FROM EMPLOYEES e 
GROUP BY DEPARTMENT_ID ;

--3. AVG()
--모든직원의 평균 급여
SELECT AVG(SALARY) 
FROM EMPLOYEES e ;

--부서별 평균 급여
SELECT DEPARTMENT_ID, AVG(SALARY) 
FROM EMPLOYEES e 
GROUP BY DEPARTMENT_ID ;

--4. MAX MIN
SELECT MAX(SALARY), MIN(SALARY) 
FROM EMPLOYEES e ;

--부서별 최고급여 최저급여, 평균급여, 종합 조회하기
SELECT DEPARTMENT_ID, MAX(SALARY), MIN(SALARY), AVG(SALARY), SUM(SALARY)
FROM EMPLOYEES e 
GROUP BY DEPARTMENT_ID ;

SELECT *
FROM EMPLOYEES e ;

SELECT COUNT(NVL(COMMISSION_PCT), 0)) 
FROM EMPLOYEES e ;

-- GROUP BY, HAVING
-- 평균 급여가 5000이상인 부서 조회
SELECT DEPARTMENT_ID ,AVG(SALARY)
FROM EMPLOYEES e 
WHERE SALARY >=5000
GROUP BY DEPARTMENT_ID 
ORDER BY DEPARTMENT_ID ;

SELECT DEPARTMENT_ID , AVG(SALARY) 
FROM EMPLOYEES e 
GROUP BY DEPARTMENT_ID 
HAVING AVG(SALARY)>=5000; 


-- 부서별 급여 총합이 50000보다 작은 부서들만 내림차순으로 정령
SELECT DEPARTMENT_ID 부서번호 ,SUM(SALARY) 급여총합
FROM EMPLOYEES e 
GROUP BY DEPARTMENT_ID 
HAVING SUM(SALARY)<50000
ORDER BY 급여총합 DESC; 

--GROUP BY : ~별
--GROUP BY : 컬럼명 HAVING 조건식
--WHERE절은 집계함수 불가, HAVING 집계함수 가능




CREATE TABLE tbl_stu( 
   stu_id NUMBER PRIMARY KEY,
   stu_name varchar2(100) NOT NULL,
   stu_phone varchar2(100),
   stu_age NUMBER,
   stu_dept varchar2(100) 
);

SELECT * FROM tbl_stu;

INSERT INTO tbl_stu
--VALUES (1, '조승우', '010-8901-8888', 30, '교육학과');
--VALUES (2, '이동욱', '010-9012-9999', 30, '컴퓨터 공학과');
--VALUES (3, '김소현', '010-9876-1234', 20, '방송연예과');
--VALUES (4, '김남길', '010-5050-1222', 26, '컴퓨터 공학과');
--VALUES (5, '강하늘', '010-5111-5151', 22, '방송연예과');
--VALUES (6, '공유', '010-5050-5151', 30, '컴퓨터 공학과');
--VALUES (7, '이종혁', '010-1213-2222', 34, '방송연예과');
--VALUES (8, '박은빈', '010-1213-2222', 20, '방송연예과');

SELECT * FROM tbl_stu;

--1) 학과 종류 검색
SELECT STU_DEPT 
FROM TBL_STU ts 


--2) 각 학과별 학생수 조회
SELECT STU_DEPT,COUNT(*) 
FROM TBL_STU ts
GROUP BY STU_DEPT ;

--3) 각 학과별 평균나이 조회
SELECT STU_DEPT ,ROUND(AVG(STU_AGE),2) 
FROM TBL_STU ts 
GROUP BY STU_DEPT;

--4) 학과별로 30세 이상인 학생 조회
SELECT *
FROM TBL_STU ts
WHERE STU_AGE >= 30

--윈도우 함수 OVER
SELECT  STU_DEPT ,STU_NAME , STU_AGE , STU_PHONE, COUNT(*) OVER(PARTITION BY STU_DEPT)
FROM TBL_STU ts 
WHERE STU_AGE >=30;

--서브쿼리 :  학과별 학생정보를 출력하면서 그룹화된 정보 유지
-- 서브쿼리 : 학과별 학생 정보를 출력하면서 그룹화된 정보 유지
SELECT T.STU_DEPT 학과, T.STU_NAME 이름, T.STU_AGE 나이, T.STU_PHONE 연락처, S.학생수
FROM TBL_STU T
JOIN(
   SELECT STU_DEPT, COUNT(*) 학생수
   FROM TBL_STU
   WHERE STU_AGE >= 30
   GROUP BY STU_DEPT
) S ON T.STU_DEPT = S.STU_DEPT
WHERE T.STU_AGE >= 30
ORDER BY T.STU_DEPT;

--5) 학생이름이 김으로 시작하거나 이로 시작하는 학생들의 학과별 수 조회
SELECT STU_DEPT, COUNT(*) 
FROM TBL_STU ts 
WHERE STU_NAME LIKE '이%' OR STU_NAME LIKE '김%'
GROUP BY STU_DEPT;


--6) 컴퓨터 공학과의 학생 주 25살 이상인 학생 수 조회
SELECT STU_DEPT ,COUNT(*) 
FROM TBL_STU ts 
WHERE STU_DEPT = '컴퓨터 공학과' AND STU_AGE >=25
GROUP BY STU_DEPT ;










