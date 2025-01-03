/* 1. JOBS 테이블에서 JOB_ID로 직원들의 JOB_TITLE, EMAIL, 성, 이름 조회 */
SELECT count(*) FROM jobs; -- 19행
SELECT count(*) FROM EMPLOYEES e; -- 107행

SELECT j.job_title, email, last_name, first_name 
FROM JOBS j JOIN EMPLOYEES e 
ON j.JOB_ID = e.JOB_ID;

/* 2. EMPLOYEES 테이블에서 HIREDATE가 2003~2004년까지인 사원의 정보와 부서명 검색 */
SELECT count(*) FROM EMPLOYEES e; -- 107행
SELECT count(*) FROM DEPARTMENTS d; -- 27행

SELECT e.FIRST_name || ' ' || e.last_name 이름, e.hire_date 입사일, d.department_name 부서명
FROM DEPARTMENTS d JOIN EMPLOYEES e
ON d.DEPARTMENT_ID = e.DEPARTMENT_ID AND e.HIRE_DATE BETWEEN '2000-01-01' AND '2001-12-31';


/* 3. EMP 테이블에서 ENAME에 L이 있는 사원들의 DNAME과 LOC 검색 */
SELECT e.ename, d.dname, d.loc
FROM dept d JOIN emp E
ON e.DEPTNO = d.DEPTNO AND e.ename LIKE '%L%';

/* 4. SCHEDULE 테이블에서 경기 일정이 20120501 ~ 20120502 사이에 있는 경기장 전체 정보 조회 */
SELECT S.SCHE_DATE, S.STADIUM_ID, ST.HOMETEAM_ID, ST.SEAT_COUNT, ST.ADDRESS, ST.DDD, ST.TEL
FROM STADIUM ST JOIN SCHEDULE S 
ON S.STADIUM_ID = ST.STADIUM_ID AND S.SCHE_DATE >= '20120501' AND S.SCHE_DATE <= '20120502';
--ON S.SALARY = (D.DEPARTMENT_ID > 10); ON절에서 테이블간 적절한 관계를 만들지 못하는 경우는 사용 불가능


/* 5. 축구 선수들 중에서 각 팀 별로 키가 가장 큰 선수들의 전체 정보 조회 */
/* 위 문제를 JOIN없이 풀기
 * (A,B) IN (C, D) : A = C AND B = D */
SELECT * FROM PLAYER p 
WHERE (TEAM_ID, HEIGHT) IN (SELECT TEAM_ID, MAX(HEIGHT) FROM PLAYER p2 GROUP BY TEAM_ID);

/* 6. EMP 테이블의 SAL을 이용, SALGRAED 테이블을 참고하여 모든 사원의 정보를 GRADE를 포함하여 조회 */
SELECT * FROM EMP;
SELECT * FROM SALGRADE;

-- JOIN 테이블 합치기
-- 등급별 최저 LOSAL, 최고 HISAL 사이에 있는 SAL을 조건으로 건다
-- SLA >= LOSAL AND SAL <= HISAL
SELECT * FROM EMP E JOIN SALGRADE s 
ON E.SAL >= S.LOSAL AND E.SAL <= S.HISAL;

SELECT * 
FROM EMP e 
JOIN SALGRADE s 
ON E.SAL BETWEEN S.LOSAL AND S.HISAL;



/* 7. EMP 테이블에서 각 사원의 매니저 이름 조회 */
-- EMP 테이블을 확인한다
-- MGR이 매니저 번호인 것을 알아낸다
-- 셀프조인 사용한다

SELECT * FROM EMP;
SELECT e1.empno 사원번호, e1.ename 사원이름, e2.ename 매니저이름, e1.mgr 매니저번호
FROM emp e1 JOIN emp e2 
ON e1.mgr = e2.EMPNO;


/* 8. 축구 선수들 중에서 각 팀 별로 키가 가장 큰 선수들의 전체 정보 조회 JOIN */
-- 팀별로 그룹화 후 팀의 가장 큰 키를 찾기
SELECT TEAM_ID, MAX(HEIGHT)
FROM PLAYER p
GROUP BY TEAM_ID;

-- HEIGHT, TEAM_ID가 일치하는 조건으로 PLAYER 테이블과  JOIN
SELECT  * 
FROM (SELECT TEAM_ID, MAX(HEIGHT) HEIGHT
FROM PLAYER
GROUP BY TEAM_ID) P1 JOIN PLAYER P2 
ON P1.TEAM_ID = P2.TEAM_ID AND 
P1.HEIGHT = P2.HEIGHT;
