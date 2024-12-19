-- 2. DDL

CREATE TABLE TBL_USER(
USER_NAME VARCHAR2(100),
USER_AGE NUMBER
) ;

DROP TABLE TBL_USER;

SELECT * FROM TBL_USER;

-- 테이블 이름 변경
ALTER TABLE TBL_USER RENAME TO TBL_MY_USER;
-- ALTER TABLE 기존테이블명  RENAME TO 변경할 테이블명

SELECT * FROM TBL_MY_USER;
SELECT * FROM TBL_USER;

-- 컬럼명 수정
ALTER TABLE TBL_MY_USER  RENAME COLUMN USER_NAME TO USER_NICKNAME;

-- 컬럼 타입 수정
-- ALTER TABLE 테이블명 MODIFY(컬럼명 자료형(용량))
ALTER TABLE TBL_MY_USER MODIFY(USER_NICKNAME VARCHAR2(500));

SELECT * FROM TBL_MY_USER;

--컬ㄹ럼 추가
ALTER TABLE TBL_MY_USER ADD(USER_GENDER CHAR(1));
ALTER TABLE TBL_MY_USER ADD(USER_HOBBY VARCHAR2(100));

--컬럼 삭제
ALTER TABLE TBL_MY_USER  DROP COLUMN USER_GENDER;

SELECT * FROM TBL_MY_USER;

--데이터 삽입 ->DML
INSERT INTO TBL_MY_USER 
VALUES('짱구', 5, 'M', '액션가면보기');
INSERT INTO TBL_MY_USER 
VALUES('철수', 5, '공부하기');

SELECT * FROM TBL_MY_USER;

--TRANCATE ->DDL 롤백 불가능
TRUNCATE TABLE TBL_MY_USER ;

SELECT * FROM  TBL_MY_USER tmu ;

--DELETE -> DML 롤백가능
DELETE FROM TBL_MY_USER tmu ;

SELECT *FROM  TBL_MY_USER tmu ;

-- TABLE 삭제 
DROP TABLE TBL_MY_USER ;

-- [실습] 자동차 테이블 생성 TBL_CAR
-- 자동차 번호 NUMBER 숫자
-- 자동차 이름 NAME 문자 (1000)
-- 자동차 브랜드 BRAND 문자(1000)
-- 출시 날짜 RELEASEDATE 날짜
-- 색상 COLOR 문자(1000)
-- 가격 PRICE 숫자

CREATE TABLE TBL_CAR(
CAR_NUMBER NUMBER,
CAR_NAME VARCHAR2(1000),
CAR_BRAND VARCHAR2(1000),
CAR_RELEASEDATE DATE,
CAR_COLOR VARCHAR2(1000),
CAR_PRICE NUMBER
);

-- 제약조건 추가
-- ALTER TABLE 테이블명 ADD CONSTRAINT 제약조건의 이름(PK_테이블명) PRIMARY KEY(컬럼명);
ALTER TABLE TBL_CAR ADD CONSTRAINT PK_CAR PRIMARY KEY(CAR_NUMBER);
-- ALTER TABLE TBL_CAR  : 테이블을 수정하겠다
-- ADD CONSTRAINT : 제약조건을 추가하겠다
-- PK_CAR PRIMARY KEY(CAR_NUMBER) : PK_CAR 이름으로  PRIMARY KEY라는(PK) 제약조건을 CAR_NUMBER 컬럼에


-- 제약조건 삭제
ALTER TABLE TBL_CAR DROP CONSTRAINT PK_CAR;

--테이블 삭제
DROP TABLE TBL_CAR;

CREATE TABLE TBL_CAR(
CAR_NUMBER NUMBER CONSTRAINT PK_CAR PRIMARY KEY,
CAR_NAME VARCHAR2(1000),
CAR_BRAND VARCHAR2(1000),
CAR_RELEASEDATE DATE,
CAR_COLOR VARCHAR2(1000),
CAR_PRICE NUMBER
);

SELECT *FROM TBL_CAR;

-- 동물 테이블 TBL_ANIMAL
-- 고유번호 NUMBER
-- 종류 KIND
-- 나이 AGE
-- 먹이 FEED

CREATE TABLE TBL_ANIMAL(
ANIMAL_NUMBER NUMBER,
ANIMAL_KIND VARCHAR(1000),
ANIMAL_AGE NUMBER,
ANIMAL_FEED VARCHAR(1000)
);
-- 제약조건 추가 
ALTER TABLE TBL_ANIMAL ADD CONSTRAINT PK_ANIMAL PRIMARY KEY(ANIMAL_NUMBER);
-- 컬럼추가 성별
ALTER TABLE TBL_ANIMAL ADD(ANIMAL_GENDER CHAR(1));
-- 컬럼이름 수정 NUMBER TO ID
ALTER TABLE TBL_ANIMAL RENAME COLUMN ANIMAL_NUMBER TO ANIMAL_ID;
-- 컬럼삭제
ALTER TABLE TBL_ANIMAL DROP COLUMN ANIMAL_FEED;
-- 컬럼 자료형 바꾸기
ALTER TABLE TBL_ANIMAL MODIFY(ANIMAL_KIND NUMBER);

-- RENAME

SELECT * FROM TBL_ANIMAL;

-- ANIMAL 테이블에 데이터 추가 -> DML INSERT

INSERT INTO TBL_ANIMAL
VALUES(1, 1, 5, 'F');

INSERT INTO TBL_ANIMAL
VALUES(NULL, 1, 5, 'F'); --ANIMAL_ID가 PK라서 NULL값을 허용하지 않음


INSERT INTO TBL_ANIMAL
VALUES(1, 2, 3, 'M'); -- ANIMAL_ID가 PK라서 중복을 허용하지 않음

DROP TABLE TBL_ANIMAL;
DROP TABLE TBL_CAR;

-- FK 설정
-- 학교 테이블 
CREATE TABLE TBL_SCHOOL(
   SCHOOL_NUMBER NUMBER CONSTRAINT PK_SCHOOL PRIMARY KEY,
   SCHOOL_NAME VARCHAR2(1000)
);

SELECT * FROM TBL_SCHOOL;

-- 학생 테이블
CREATE TABLE TBL_STUDENT(
   STUDENT_NUMBER NUMBER,
   STUDENT_NAME VARCHAR2(1000),
   STUDENT_AGE NUMBER,
   SCHOOL_NUMBER NUMBER,
   CONSTRAINT PK_STUDENT PRIMARY KEY(STUDENT_NUMBER),
   CONSTRAINT FK_STUDENT FOREIGN KEY(SCHOOL_NUMBER) REFERENCES TBL_SCHOOL(SCHOOL_NUMBER)
);

DROP TABLE TBL_STUDENT;
SELECT * FROM TBL_STUDENT;
SELECT * FROM TBL_SCHOOL;

-- 상위 테이블의 값부터 채워준다
INSERT INTO TBL_SCHOOL
--VALUES(1, 'DBMS 고등학교');
--VALUES(2, 'JAVA 고등학교');
VALUES(3, 'PYTHON 고등학교');

-- 하위 테이블의 값을 채워준다
INSERT INTO TBL_STUDENT
--VALUES(1,'김철수',17,5); -- 오류발생 : FK 작성할때 상위테이블에 없는값 입력불가
--VALUES(1,'김철수',17,1); 
--VALUES(2,'신유리',17,1);
--VALUES(3,'신짱구',18,2);
VALUES(4,'최영',19,3);

SELECT * FROM TBL_STUDENT ts ;

-- 제약조건 UK(UNIQUE) : 고유한 값이지만 NULL값 허용
-- 학생테이블 STU
CREATE TABLE TBL_STU(
STU_NUMBER NUMBER,
STU_NAME VARCHAR2(1000),
STU_MAJOR VARCHAR2(100),
STU_ID NUMBER,
STU_GENDER CHAR(1) DEFAULT 'M' NOT NULL CONSTRAINT CHECK_GEN CHECK(STU_GENDER = 'M' OR STU_GENDER='W'),
CONSTRAINT PK_STU PRIMARY KEY(STU_NUMBER),
CONSTRAINT UK_STU UNIQUE(STU_ID)
);

--STU_GENDER CHAR(1), DEFAULT 'M' NOT NULL CHEAK(STU_GENDER = 'M' OR STU_GENDER = 'W')
--DEFAULT 'M' : 데이터가 들어오지 않으면 무조건 'M' 사용(기본값 사용)
--NOT NULL :  디폴트값으로 W로 설정했으니 NULL값을 강제로 넣는것을 막기위해
--CHECK : SHEBKS (STU_GENDER = 'M' OR STU_GENDER = 'W') 이컬럼의 값은 M또는 W만 가능

DROP TABLE TBL_STU ;

SELECT *FROM TBL_STU ts ;

INSERT INTO TBL_STU ts (STU_NUMBER, STU_NAME, STU_MAJOR, STU_ID)
--VALUES(1, '짱구', NULL, '111');

INSERT INTO TBL_STU ts 
--VALUES(2, '철수', '컴공', 222, 'M');
VALUES(3, '유리', '컴공', 333, 'W');

CREATE TABLE FLOWER(
FLOWER_NAME VARCHAR2(1000),
FLOWER_COLOR VARCHAR2(1000),
FLOWER_PRICE NUMBER,
CONSTRAINT PK_FLOWER PRIMARY KEY(FLOWER_NAME, FLOWER_COLOR) --PK 두개컬럼 묶어서
);

INSERT INTO FLOWER f
VALUES('튤립', '노랑', 9000);

INSERT INTO FLOWER f
VALUES('튤립', '빨강', 9000);

INSERT INTO FLOWER f
VALUES('튤립', '파랑', 9000); --PK는 NULL값 불가능

INSERT INTO FLOWER f
VALUES('해바라기', '노랑', 9000);

INSERT INTO FLOWER f
VALUES('해바라기', '빨강', 9000);

INSERT INTO FLOWER f
VALUES('해바라기', '파랑', 9000);


SELECT * FROM FLOWER f;

DROP TABLE TBL_USER;

--CREATE TABLE TBL_USER(
--USER_NUMBER NUMBER,
--USER_NAME VARCHAR2(1000),
--USER_AGE NUMBER,
--CONSTRAINT PK_USER PRIMARY KEY(USER_NUMBER)
--);






