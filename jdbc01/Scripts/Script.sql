CREATE SEQUENCE seq_user;

-- 사용자 정보 저장하는 유저 테이블 tbl_user
-- 사용자 번호
-- 아이디
-- 패스워드
-- 이름
-- 나이
-- 성별
-- 생일
CREATE TABLE tbl_user(
   user_number NUMBER,
   user_id varchar2(100),
   user_pw varchar2(100),
   user_name varchar2(10),
   user_age NUMBER,
   user_gender char(1) DEFAULT 'M',
   user_birth DATE,
   CONSTRAINT pk_user PRIMARY key(user_number)
);

SELECT * FROM tbl_user;

INSERT INTO TBL_USER
--VALUES(SEQ_USER.NEXTVAL, 'AAA', '1234', '홍길동', 22, 'M', '20001010');
VALUES(SEQ_USER.NEXTVAL, 'AAA', '1234', '김영선', 20, 'W', '20000101');
