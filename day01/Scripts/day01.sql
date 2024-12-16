--sql 주석
--주석처리된 sql문은 실행되지 않는다
-- 한줄 주석 -- : 해당 라인줄을 주석처리
/* 범위주석 컨드롤 쉬프트 슬래시
 * 범위 안에 있는 라인을 주석처리
 */ ㄴ
--select를 사용하여 empolyees 테이블의 모든 컬럼 조회하기
SELECT * FROM employees;
-- select를 사용하여 empolyees 테이블의 first_name 컬럼만 선택하여 조회하기
SELECT first_name FROM hr.EMPLOYEES;

-- ; 세미콜론 :  세미콜론은 하나의 명렁이 끝나면 작성한다(마침표라고 생각하면된다)
-- 세미콜론을 적어야 한 줄의 끝이라고 생각하기 때문에 세미콜론 이전의 줄바꿈해도 상관없다
-- SQL문은 대소문자를 구분하지 않는다
SELECT FIRST_NAME
FROM HR.EMPLOYEES;
--HR계정으로 로그인 했기때문에 HR 생략 가능