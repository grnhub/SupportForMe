CREATE TABLESPACE project datafile 'C:\oraclexe\app\oracle\oradata\XE\PROJECT.DBF' size 50m autoextend ON NEXT 10m maxsize 5g;
CREATE TABLESPACE invest datafile 'C:\oraclexe\app\oracle\oradata\XE\INVEST.DBF' size 50m autoextend ON NEXT 10m maxsize 5g;
CREATE TABLESPACE etc datafile 'C:\oraclexe\app\oracle\oradata\XE\ETC.DBF' size 50m autoextend ON NEXT 10m maxsize 5g;

CREATE TABLE COMMON_CODE
  (
    CODE_GROUP VARCHAR2(50 BYTE),
    CODE       VARCHAR2(50 BYTE),
    CODE_NAME  VARCHAR2(1000 BYTE)
  )
  TABLESPACE ETC ;
CREATE TABLE MEMBER
  (
    USER_ID      VARCHAR2(50 BYTE) NOT NULL ENABLE,
    PASSWORD     VARCHAR2(50 BYTE),
    NAME         VARCHAR2(50 BYTE),
    ADDRESS      VARCHAR2(1000 BYTE),
    PHONE_NUM    VARCHAR2(100 BYTE),
    EMAIL        VARCHAR2(1000 BYTE),
    INTRODUCTION VARCHAR2(1000 BYTE),
    POSTCODE     VARCHAR2(50 BYTE),
    ADDR_DETAIL  VARCHAR2(1000 BYTE),
    JOIN_DATE    VARCHAR2(100) DEFAULT SYSDATE,
    CONSTRAINT PK_MEMBER PRIMARY KEY (USER_ID)
  )
  TABLESPACE USERS ;
CREATE TABLE PROJECT
  (
    PROJECT_NO         VARCHAR2(50 BYTE) NOT NULL ENABLE,
    PROJECT_NAME       VARCHAR2(1000 BYTE),
    IMAGE              VARCHAR2(1000 BYTE),
    TARGET_AMOUNT      VARCHAR2(4000 BYTE),
    PROJECT_DEADLINE   VARCHAR2(50 BYTE),
    INTRODUCTION_VIDEO VARCHAR2(4000 BYTE),
    STORY CLOB,
    DEPOSIT_ACCOUNT    VARCHAR2(50 BYTE),
    BANK_CODE          VARCHAR2(50 BYTE),
    PROGRESS           VARCHAR2(50 BYTE),
    USER_ID            VARCHAR2(50 BYTE),
    INTRODUCTION_IMAGE VARCHAR2(4000 BYTE),
    SUPPORT_PICK_YN    VARCHAR2(50 BYTE),
    DELIVERY_DATE      VARCHAR2(50 BYTE),
    CATEGORY_CODE      VARCHAR2(50 BYTE),
    CONSTRAINT PK_POJECT PRIMARY KEY (PROJECT_NO),
    CONSTRAINT FK_PROJECT FOREIGN KEY (USER_ID) REFERENCES MEMBER (USER_ID) ENABLE
  )
  TABLESPACE PROJECT;
CREATE TABLE INVEST
  (
    INVEST_NO         VARCHAR2(50 BYTE) NOT NULL ENABLE,
    INVESTMENT_AMOUNT VARCHAR2(4000 BYTE),
    PAY_TYPE          VARCHAR2(50 BYTE),
    PRESENT_NO        VARCHAR2(50 BYTE),
    USER_ID           VARCHAR2(50 BYTE),
    PROJECT_NO        VARCHAR2(50 BYTE) NOT NULL ENABLE,
    PAYMENT_STATE     VARCHAR2(50 BYTE),
    POSTCODE          VARCHAR2(50 BYTE),
    ADDRESS           VARCHAR2(1000 BYTE),
    ADDR_DETAIL       VARCHAR2(1000 BYTE),
    PHONE_NUM         VARCHAR2(100 BYTE),
    EMAIL             VARCHAR2(100 BYTE),
    NAME              VARCHAR2(100 BYTE),
    REQUEST           VARCHAR2(4000 BYTE),
    UUID              VARCHAR2(1000 BYTE),
    CONSTRAINT PK_INVEST PRIMARY KEY (INVEST_NO) ,
    CONSTRAINT FK_INVEST FOREIGN KEY (PROJECT_NO) REFERENCES PROJECT (PROJECT_NO) ENABLE,
    CONSTRAINT FK_INVEST2 FOREIGN KEY (USER_ID) REFERENCES MEMBER (USER_ID) ENABLE
  )
  TABLESPACE INVEST ;
CREATE TABLE ACCOUNT_PAY
  (
    ACCOUNT_NO           VARCHAR2(50 BYTE) NOT NULL ENABLE,
    BANK_CODE            VARCHAR2(50 BYTE),
    ACCOUNT_HOLDER       VARCHAR2(50 BYTE),
    ACCOUNT_TYPE         VARCHAR2(50 BYTE),
    ACCOUNT_HOLDER_BIRTH VARCHAR2(50 BYTE),
    ACCOUNT              VARCHAR2(50 BYTE),
    INVEST_NO            VARCHAR2(50 BYTE) NOT NULL ENABLE,
    CONSTRAINT PK_ACCOUNT_PAY PRIMARY KEY (ACCOUNT_NO, INVEST_NO),
    CONSTRAINT FK_ACCOUNT_PAY FOREIGN KEY (INVEST_NO) REFERENCES INVEST (INVEST_NO) ENABLE
  )
  TABLESPACE INVEST ;
CREATE TABLE COMMENTS
  (
    COMMENT_NO      VARCHAR2(50 BYTE) NOT NULL ENABLE,
    TOP_COMMENT_NO  VARCHAR2(50 BYTE),
    COMMENT_CONTENT VARCHAR2(1000 BYTE),
    COMMENT_DATE    VARCHAR2(50 BYTE),
    PROJECT_NO      VARCHAR2(50 BYTE),
    USER_ID         VARCHAR2(50 BYTE),
    CONSTRAINT PK_COMMENT PRIMARY KEY (COMMENT_NO),
    CONSTRAINT FK_COMMENT FOREIGN KEY (USER_ID) REFERENCES MEMBER (USER_ID) ENABLE,
    CONSTRAINT FK_COMMENT_2 FOREIGN KEY (PROJECT_NO) REFERENCES PROJECT (PROJECT_NO) ENABLE,
    CONSTRAINT FK_COMMENT_3 FOREIGN KEY (TOP_COMMENT_NO) REFERENCES COMMENTS (COMMENT_NO) ENABLE
  )
  TABLESPACE ETC ;
CREATE TABLE CREDIT_INFO
  (
    PAY_NO          VARCHAR2(50 BYTE) NOT NULL ENABLE,
    USER_ID         VARCHAR2(50 BYTE) NOT NULL ENABLE,
    CARD_NUM        VARCHAR2(100 BYTE),
    EXPIRATION_DATE VARCHAR2(50 BYTE),
    CARDPASSWORD    VARCHAR2(50 BYTE),
    PAY_PASSWORD    VARCHAR2(50 BYTE),
    CONSTRAINT PK_CREDIT_INFO PRIMARY KEY (PAY_NO, USER_ID),
    CONSTRAINT FK_CREDIT_INFO FOREIGN KEY (USER_ID) REFERENCES MEMBER (USER_ID) ENABLE
  )
  TABLESPACE USERS;
CREATE TABLE CARD_PAY
  (
    CARD_NO   VARCHAR2(50 BYTE) NOT NULL ENABLE,
    INVEST_NO VARCHAR2(50 BYTE) NOT NULL ENABLE,
    PAY_NO    VARCHAR2(50 BYTE),
    USER_ID   VARCHAR2(50 BYTE),
    CONSTRAINT PK_CARD_PAY PRIMARY KEY (CARD_NO, INVEST_NO),
    CONSTRAINT FK_CARD_PAY FOREIGN KEY (PAY_NO, USER_ID) REFERENCES CREDIT_INFO (PAY_NO, USER_ID) ENABLE,
    CONSTRAINT FK_CARD_PAY_2 FOREIGN KEY (INVEST_NO) REFERENCES INVEST (INVEST_NO) ENABLE
  )
  TABLESPACE INVEST ;
CREATE TABLE DELETE_MEMBER
  (
    USER_ID        VARCHAR2(50 BYTE),
    PASSWORD       VARCHAR2(50 BYTE),
    NAME           VARCHAR2(50 BYTE),
    ADDRESS        VARCHAR2(1000 BYTE),
    PHONE_NUM      VARCHAR2(100 BYTE),
    EMAIL          VARCHAR2(1000 BYTE),
    INTRODUCTION   VARCHAR2(1000 BYTE),
    POSTCODE       VARCHAR2(50 BYTE),
    ADDR_DETAIL    VARCHAR2(1000 BYTE),
    WITHDRAWA_DATE VARCHAR2(50 BYTE) DEFAULT sysdate,
    IP_ADDRESS     VARCHAR2(100 BYTE)
  )
  TABLESPACE SYSTEM ;
CREATE TABLE HASHTAG
  (
    HASHTAG_NO   VARCHAR2(50 BYTE) NOT NULL ENABLE,
    HASHTAG_NAME VARCHAR2(1000 BYTE),
    PROJECT_NO   VARCHAR2(50 BYTE),
    CONSTRAINT PK_HASHTAG PRIMARY KEY (HASHTAG_NO),
    CONSTRAINT FK_HASHTAG FOREIGN KEY (PROJECT_NO) REFERENCES PROJECT (PROJECT_NO) ENABLE
  )
  TABLESPACE ETC ;
CREATE TABLE PRESENT
  (
    PRESENT_NO    VARCHAR2(50 BYTE) NOT NULL ENABLE,
    PRESENT_PRICE VARCHAR2(4000 BYTE),
    PRESENT_NAME  VARCHAR2(1000 BYTE),
    PROJECT_NO    VARCHAR2(50 BYTE),
    PRESENT_DELIVERY_DATE VARCHAR2(50),
    CONSTRAINT PK_PRESENT PRIMARY KEY (PRESENT_NO),
    CONSTRAINT FK_PRESENT FOREIGN KEY (PROJECT_NO) REFERENCES PROJECT (PROJECT_NO) ENABLE
  )
  TABLESPACE PROJECT ;
CREATE SEQUENCE ACCOUNT_PAY_SEQ START WITH 1 INCREMENT BY 1 NOMAXVALUE;
CREATE SEQUENCE INVEST_SEQ START WITH 1 INCREMENT BY 1 NOMAXVALUE;
CREATE SEQUENCE COMMENTS_SEQ START WITH 1 INCREMENT BY 1 NOMAXVALUE;
CREATE SEQUENCE CARD_PAY_SEQ START WITH 1 INCREMENT BY 1 NOMAXVALUE;
CREATE SEQUENCE CREDIT_INFO_SEQ START WITH 1 INCREMENT BY 1 NOMAXVALUE;
CREATE SEQUENCE HASHTAG_SEQ START WITH 1 INCREMENT BY 1 NOMAXVALUE;
CREATE SEQUENCE PRESENT_SEQ START WITH 1 INCREMENT BY 1 NOMAXVALUE;
CREATE SEQUENCE PROJECT_SEQ START WITH 1 INCREMENT BY 1 NOMAXVALUE; 

CREATE OR REPLACE TRIGGER delete_member_trigger before
  UPDATE ON member FOR EACH row BEGIN IF updating AND :NEW.password IS NULL THEN
  INSERT
  INTO delete_member
    (
      user_id,
      password,
      name,
      address,
      phone_num,
      email,
      introduction,
      postcode,
      addr_detail,
      ip_address
    )
    VALUES
    (
      :old.user_id,
      :old.password,
      :old.name,
      :old.address,
      :old.phone_num,
      :old.email,
      :old.introduction,
      :old.postcode,
      :old.addr_detail,
      SYS_CONTEXT('userenv', 'ip_address')
    );
END IF;
END;

CREATE OR REPLACE FUNCTION func_total_invest_amount(
    p_projectNo VARCHAR2)
  RETURN NUMBER
IS
  v_total_invest_amount NUMBER(18) := 0;
BEGIN
  SELECT NVL(SUM(to_number(investment_amount)),0)
  INTO v_total_invest_amount
  FROM invest
  WHERE project_no = p_projectNo;
  RETURN v_total_invest_amount;
END;

CREATE OR REPLACE FUNCTION PROJECT_PROGRESS_RATE(
    P_PROJECT_NO IN VARCHAR2 )
  RETURN NUMBER
IS
  V_SUM_PROJECT   NUMBER(18);
  V_TARGET_AMOUNT VARCHAR(4000) ;
BEGIN
  SELECT SUM(INVESTMENT_AMOUNT)
  INTO V_SUM_PROJECT
  FROM INVEST
  WHERE PROJECT_NO = P_PROJECT_NO;
  SELECT TARGET_AMOUNT
  INTO V_TARGET_AMOUNT
  FROM PROJECT
  WHERE PROJECT_NO = P_PROJECT_NO;
  RETURN(NVL(ROUND(((V_SUM_PROJECT/V_TARGET_AMOUNT)*100)),0));
END;

CREATE OR REPLACE PROCEDURE project_rank5(
    p_cur_project_rank5 OUT SYS_REFCURSOR)
IS
  CURSOR v_invest_rank5
  IS
    SELECT project_no
    FROM
      (SELECT project_no,
        COUNT(*) AS COUNT
      FROM invest
      GROUP BY project_no
      ORDER BY COUNT DESC
      )
  WHERE rownum <=5 ;
BEGIN
  FOR rank5 IN v_invest_rank5
  LOOP
    OPEN p_cur_project_rank5 FOR SELECT project_no,
    project_name,
    image FROM project WHERE project_no = rank5.project_no;
  END LOOP;
END project_rank5;

CREATE OR REPLACE PROCEDURE delete_comments(
    p_comment_no VARCHAR2)
IS
  v_comment_no comments.comment_no%type := p_comment_no;
  v_cnt NUMBER;
BEGIN
  SELECT COUNT(*) INTO v_cnt FROM comments WHERE top_comment_no = v_comment_no;
  -- 댓글에 답변이 달린 상태이면 댓글을 삭제하지 않음
  IF v_cnt <> 0 THEN
    UPDATE comments
    SET comment_content='삭제된 댓글입니다.',
      comment_date     =NULL,
      user_id          = NULL
    WHERE comment_no   = v_comment_no;
  ELSE
    DELETE FROM comments WHERE comment_no = v_comment_no;
  END IF;
END;

CREATE OR REPLACE PROCEDURE insertProject(
    p_userId VARCHAR2,
    p_projectNo OUT VARCHAR2)
IS
  v_projectNo project.project_no%type;
BEGIN
  SELECT (TO_CHAR(SYSDATE, 'rrrrMMdd')
    || LPAD((PROJECT_SEQ.NEXTVAL),4,0))
  INTO v_projectNo
  FROM DUAL;
  INSERT
  INTO PROJECT
    (
      PROJECT_NO,
      USER_ID,
      PROGRESS
    )
    VALUES
    (
      v_projectNo,
      p_userId,
      '004'
    );
  p_projectNo := v_projectNo;
END;

create or replace procedure project_manage_procedure is
    -- 현재날짜 > 마감날짜인 모든 프로젝트
    cursor c_project_cursor is
    select *
    from project
    where sysdate > to_date(project_deadline, 'yyyy-mm-dd');
  
    --Cursor : 마감일이 오늘인 프로젝트의 프로젝트코드와, 목표금액을 구함.
    cursor dead_project IS
    select project_no, target_amount
    from project
    where project_deadline = TO_CHAR(sysdate, ('yyyymmdd'));
  
  v_project_record c_project_cursor%rowtype;
  v_total_invest_amount number;
  
  v_sum varchar2(50);
  v_pno varchar2(50);
  v_total varchar2(10);
   
begin
  for v_project_record in c_project_cursor
    loop
      -- 한 프로젝트에 대한 투자자들의 모금액의 총합
      -- 무산: 현재날짜 > 마감날짜 and 총모금액 < 목표금액
      if  func_total_invest_amount(v_project_record.project_no) < to_number(v_project_record.target_amount)
      then 
        update project set progress = '003' where project_no = v_project_record.project_no;
      -- 마감: 현재날짜 > 마감날짜 and  총모금액 >= 목표금액 and 현재날짜 <= 결제예정일
      else 
        if sysdate <= to_date(v_project_record.project_deadline, 'yyyy-mm-dd')
        then
          update project set progress = '002' where project_no = v_project_record.project_no;
        -- 완료: 현재날짜 > 예상배송일 and 총 모금액 >= 목표금액  
        elsif sysdate > to_date(v_project_record.delivery_date, 'yyyy-mm-dd')
          then
            update project set progress = '006' where project_no = v_project_record.project_no;
        end if;
      end if;
    end loop;
    
    FOR dead_project_rec IN dead_project LOOP
    v_pno  := dead_project_rec.project_no ; 
    v_total := dead_project_rec.target_amount;
 
    --프로젝트코드별로 투자금액합계를 알아낸다.
    select sum(investment_amount)
    into v_sum
    from invest
    where project_no = v_pno;
  
    IF (v_total > v_sum) THEN
    update invest
    set payment_state = '003'
    where project_no = v_pno;
    commit;
   --dbms_output.put_line('자동결제취소.');
   --p_out := '결제취소';
    ELSIF (v_total <= v_sum) THEN 
    update invest
    set payment_state = '001'
    where project_no = v_pno;
    commit;
   --dbms_output.put_line('자동결제승인');
   --p_out := '결제승인';
    END IF; 
  END LOOP;
end project_manage_procedure;






