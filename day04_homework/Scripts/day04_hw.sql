SELECT * FROM PLAYER p ;
/* PLAYER 테이블에서 포지션 종류 검색 */
SELECT DISTINCT "POSITION" 
FROM PLAYER p ;
/* PLAYER 테이블에서 몸무게가 80이상인 선수들의 평균 키가 180초과인 포지션 검색 */
SELECT "POSITION" ,ROUND(AVG(HEIGHT),2)
FROM PLAYER p 
WHERE WEIGHT >= 80
GROUP BY "POSITION" 
HAVING AVG(HEIGHT) > 180;

/* EMPLOYEES 테이블에서 JOB_ID별 평균 SALARY가 10000미만인 JOB_ID 검색 JOB_ID는 알파벳 순으로 정렬(오름차순) */
SELECT  JOB_ID 
FROM EMPLOYEES e
GROUP BY JOB_ID 
WHERE AVG(SALARY)<10000; 

SELECT  JOB_ID, AVG(SALARY) 
FROM EMPLOYEES e
GROUP BY JOB_ID 
HAVING AVG(SALARY)<10000
ORDER BY JOB_ID ;

/* PLAYER_ID가 2007로 시작하는 선수들 중 POSITION별 평균 키를 조회 */
SELECT "POSITION" , ROUND(AVG(HEIGHT),2) 
FROM PLAYER p 
WHERE PLAYER_ID LIKE '2007%'
GROUP BY "POSITION" ;

/* 선수들 중 포지션이 DF 선수들의 평균 키를 TEAM_ID 별로 조회하고 평균 키 오름차순으로 정렬하기 */
SELECT TEAM_ID ,ROUND(AVG(HEIGHT),2) DF평균키
FROM PLAYER p 
WHERE "POSITION" ='DF'
GROUP BY TEAM_ID 
ORDER BY DF평균키;


/* 포지션이 MF인 선수들의 입단연도 별 평균 몸무게, 평균 키를 구한다.
 * 칼럼명은 입단연도, 평균 몸무게, 평균 키 로 표시한다.
 * 입단연도를 오름차순으로 정렬한다.
 * 단, 평균 몸무게는 70 이상 그리고 평균 키는 160 이상인 입단연도만 조회 */
SELECT JOIN_YYYY 입단년도 , AVG(WEIGHT) 평균몸무게, AVG(HEIGHT)평균키 
FROM PLAYER p 
WHERE "POSITION" = 'MF'
GROUP BY JOIN_YYYY 
HAVING AVG(WEIGHT)>=70 AND AVG(HEIGHT)>=160 
ORDER BY 입단년도;

/* PLAYER 테이블에서 TEAM_ID가 'K01'인 선수 중 POSITION이
 * 'GK'인 선수를 조회하기 SUB쿼리 사용하기 */
--SELECT PLAYER_NAME 
--FROM PLAYER p 
--WHERE p.TEAM_ID ='K01' AND (SELECT "POSITION" FROM PLAYER p2 WHERE "POSITION" = 'GK');

--SELECT PLAYER_NAME 
--FROM PLAYER p 
--WHERE POSITION = 'GK'
--  AND TEAM_ID = (SELECT TEAM_ID FROM PLAYER WHERE TEAM_ID = 'K01');
 
 SELECT *
 FROM PLAYER p 
 WHERE "POSITION" = 'GK'
 AND EXISTS (
 SELECT 1
 FROM PLAYER p2 
 WHERE P2.TEAM_ID ='K01'
 AND "POSITION" =P2.POSITION
 );
 

/* PLAYER 테이블에서 평균 몸무게보다 더 많이 나가는 선수들 검색 (조건에 서브쿼리 사용) */
--선수들이니깐 행이 여러개나옴 다중행 서브쿼리 써야함
-- 서브쿼리의 결과가 존재하는지 (평균몸무게보다 더 많이 나가는 선수들이 있는지)
SELECT AVG(WEIGHT) 
FROM PLAYER p ;

SELECT PLAYER_ID , PLAYER_NAME, P.WEIGHT
FROM PLAYER p 
WHERE EXISTS (
SELECT 1
FROM PLAYER p2 
WHERE P2.PLAYER_ID = P.PLAYER_ID
AND P.WEIGHT>(
SELECT AVG(WEIGHT) 
FROM PLAYER
WHERE P.PLAYER_ID = P2.PLAYER_ID
)
) ;


/* PLAYER 테이블에서 정남일 선수가 소속된 팀의 선수들 조회*/
--뭐가필요하냐
-- 정남일 선수의 팀아이디를 뽑는 쿼리가 필요함
SELECT *
FROM PLAYER p 
WHERE TEAM_ID =(
SELECT TEAM_ID 
FROM PLAYER p 
WHERE PLAYER_NAME = '정남일');

/* PLAYER 테이블에서 평균 키보다 작은 선수 조회*/
--필요한게 뭐냐 평균키를 구해
--그래서 그거보다 작은 키를 조회하면됨

SELECT PLAYER_ID , PLAYER_NAME , HEIGHT 
FROM PLAYER p 
WHERE HEIGHT <(
SELECT AVG(HEIGHT) 
FROM PLAYER p) ;


/*SCHEDULE 테이블에서 경기 일정이 
 * 20120501 ~ 20120502 사이에 있는 경기장 전체 정보 조회*/
SELECT *
FROM SCHEDULE s 
WHERE SCHE_DATE BETWEEN '20120501' AND '20120502';

SELECT *FROM SCHEDULE s ;

/*
 * EMPLOYEE 테이블
 * 핸드폰번호가 515로 시작하는 사원들의
 * JOB_ID별 SALARY 평균을 구한다.
 * 조회 컬럼은 부서, 평균 급여 로 표시한다.
 * 평균 급여가 높은 순으로 정렬한다.
 */
SELECT JOB_ID 부서, AVG(SALARY)"평균급여" 
FROM EMPLOYEES e 
WHERE PHONE_NUMBER LIKE '515%'
GROUP BY JOB_ID 
ORDER BY "평균급여" DESC;


/* COMMISSION_PCT 별 평균 급여를 조회한다.
 * COMMISSION_PCT 를 오름차순으로 정렬하며 
 * HAVING절을 사용하여 NULL은 제외한다.*/
SELECT DISTINCT COMMISSION_PCT , ROUND(AVG(SALARY),2) 
FROM EMPLOYEES e 
GROUP BY COMMISSION_PCT 
ORDER BY COMMISSION_PCT ;


