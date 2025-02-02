CREATE OR REPLACE PROCEDURE PRC_CHECKLIST_INSERT
( V_CHECK_NO    IN CHECKLIST.CHECK_NO%TYPE  ------------
, V_AC_NO       IN CHECKLIST.AC_NO%TYPE
, V_RES_NO      IN CHECKLIST.RES_NO%TYPE
, V_CHECKDATE   IN CHECKLIST.CHECKDATE%TYPE
, V_TITLE       IN CHECKLIST.TITLE%TYPE
, V_ROADADDR    IN CHECKLIST.ROADADDR%TYPE
, V_DONG_NO     IN CHECKLIST.DONG_NO%TYPE
, V_WIDO        IN CHECKLIST.WIDO%TYPE          ----------
, V_GYEONGDO    IN CHECKLIST.GYEONGDO%TYPE      ----------
, V_GOOD        IN CONTENT.GOOD%TYPE                := NULL
, V_BAD         IN CONTENT.BAD%TYPE                 := NULL
, V_ETC         IN CONTENT.ETC%TYPE                 := NULL
, V_S_COMMENTS  IN SECRET_CONTENT.COMMENTS%TYPE     := NULL
, V_MART        IN CONVENIENCE.MART%TYPE            := NULL
, V_LAUNDRY     IN CONVENIENCE.LAUNDRY%TYPE         := NULL
, V_HOSPITAL    IN CONVENIENCE.HOSPITAL%TYPE        := NULL
, V_FOOD        IN CONVENIENCE.FOOD%TYPE            := NULL
, V_CULTURE     IN CONVENIENCE.CULTURE%TYPE         := NULL
, V_PARK        IN CONVENIENCE.PARK%TYPE            := NULL
, V_C_COMMENTS  IN CONVENIENCE.COMMENTS%TYPE        := NULL
, V_MWOLSE      IN WOLSE.MWOLSE%TYPE                := NULL
, V_DEPOSIT     IN WOLSE.DEPOSIT%TYPE               := NULL
, V_MJEONSE     IN JEONSE.MJEONSE%TYPE              := NULL
, V_MMAEMAE     IN MAEMAE.MMAEMAE%TYPE              := NULL
, V_PLACE       IN GOING.PLACE%TYPE                 := NULL     ----------
, V_TIME        IN GOING.TIME%TYPE                  := NULL     ----------
, V_P_COMMENTS  IN PET.COMMENTS%TYPE                := NULL
, V_P_SCORENO	IN PET.SCORENO%TYPE                 := NULL
, V_SE_COMMENTS IN SECURITY.COMMENTS%TYPE           := NULL
, V_SE_SCORENO  IN SECURITY.SCORENO%TYPE            := NULL
, V_T_COMMENTS  IN TRANSPORT.COMMENTS%TYPE          := NULL
, V_T_SCORENO   IN TRANSPORT.SCORENO%TYPE           := NULL
, V_H_COMMENTS  IN HONJAP.COMMENTS%TYPE             := NULL
, V_H_SCORENO   IN HONJAP.SCORENO%TYPE              := NULL
)

IS
    -- 예외 선언
    CON_ALL_OR_NOT_ERROR         EXCEPTION; 
    WOLSE_ALL_OR_NOT_ERROR       EXCEPTION;
    GOING_ALL_OR_NOT_ERROR       EXCEPTION;

BEGIN
    --○ INSERT
    -- 체크리스트(필수)
    -- 체크리스트 필수항목은 NOT NULL 제약조건이 이미 걸려있음
    -- → 따라서, 입력하지 않을 시 예외가 발생하므로 따로 유효성 검사를 포함하지 않음
    INSERT INTO CHECKLIST(CHECK_NO, AC_NO, RES_NO, CHECKDATE, TITLE, ROADADDR, DONG_NO, WIDO, GYEONGDO)
    VALUES(V_CHECK_NO, V_AC_NO, V_RES_NO, V_CHECKDATE, V_TITLE, V_ROADADDR, V_DONG_NO, V_WIDO, V_GYEONGDO);

    -- 코멘트
    IF( (V_GOOD IS NOT NULL) OR ( V_BAD IS NOT NULL ) OR ( V_ETC IS NOT NULL) )
        THEN INSERT INTO CONTENT(CHECK_NO, GOOD, BAD, ETC)
             VALUES(V_CHECK_NO, V_GOOD, V_BAD, V_ETC);
    END IF;

    -- 비밀코멘트
    IF(V_S_COMMENTS IS NOT NULL)
        THEN INSERT INTO SECRET_CONTENT(CHECK_NO, COMMENTS)
             VALUES(V_CHECK_NO, V_S_COMMENTS);
    END IF;

    -- 생활편의시설
    -- 6개의 항목이 ①모두 입력되었으면 → INSERT 
    --              ②(모두 입력된 게 아닌데) 하나라도 입력되어 있으면 → 예외 발생
    IF( (V_MART IS NOT NULL) AND (V_LAUNDRY IS NOT NULL) AND (V_HOSPITAL IS NOT NULL)
            AND (V_FOOD IS NOT NULL) AND (V_CULTURE IS NOT NULL) AND (V_PARK IS NOT NULL) )
        THEN INSERT INTO CONVENIENCE(CHECK_NO, MART, LAUNDRY, HOSPITAL, FOOD, CULTURE, PARK, COMMENTS)
             VALUES(V_CHECK_NO,  V_MART, V_LAUNDRY, V_HOSPITAL, V_FOOD, V_CULTURE , V_PARK, V_C_COMMENTS);
    ELSIF ( (V_MART IS NOT NULL) OR (V_LAUNDRY IS NOT NULL) OR (V_HOSPITAL IS NOT NULL)
            OR (V_FOOD IS NOT NULL) OR (V_CULTURE IS NOT NULL) OR (V_PARK IS NOT NULL) )
        THEN RAISE CON_ALL_OR_NOT_ERROR;
    END IF;

    -- 월세
    -- 2개의 항목이 ①모두 입력되었으면 → INSERT 
    --              ②(모두 입력된 게 아닌데) 하나라도 입력되어 있으면 → 예외 발생
    IF( (V_MWOLSE IS NOT NULL) AND (V_DEPOSIT IS NOT NULL) )
        THEN INSERT INTO WOLSE(CHECK_NO, MWOLSE, DEPOSIT)
             VALUES(V_CHECK_NO, V_MWOLSE, V_DEPOSIT); 
    ELSIF ( (V_MWOLSE IS NOT NULL) OR (V_DEPOSIT IS NOT NULL) )
        THEN RAISE WOLSE_ALL_OR_NOT_ERROR;
    END IF;

    -- 전세
    IF(V_MJEONSE IS NOT NULL)
        THEN INSERT INTO JEONSE(CHECK_NO, MJEONSE)
             VALUES(V_CHECK_NO, V_MJEONSE);
    END IF;

    -- 매매
    IF(V_MMAEMAE IS NOT NULL)
        THEN INSERT INTO MAEMAE(CHECK_NO, MMAEMAE)
             VALUES(V_CHECK_NO, V_MMAEMAE);
    END IF;    

    -- 나의 출근시간
    -- 2개의 항목이 ①모두 입력되었으면 → INSERT 
    --              ②(모두 입력된 게 아닌데) 하나라도 입력되어 있으면 → 예외 발생
    IF( (V_PLACE IS NOT NULL) AND (V_TIME IS NOT NULL) )
        THEN INSERT INTO GOING(CHECK_NO, PLACE, TIME)
             VALUES(V_CHECK_NO, V_PLACE, V_TIME);
    ELSIF( (V_PLACE IS NOT NULL) OR (V_TIME IS NOT NULL) )
        THEN RAISE GOING_ALL_OR_NOT_ERROR;
    END IF;

    -- 반려동물
    IF(V_P_SCORENO IS NOT NULL)
        THEN INSERT INTO PET(CHECK_NO, COMMENTS, SCORENO)
             VALUES(V_CHECK_NO, V_P_COMMENTS, V_P_SCORENO);
    END IF;    

    -- 치안
    IF(V_SE_SCORENO IS NOT NULL)
        THEN INSERT INTO SECURITY(CHECK_NO, COMMENTS, SCORENO)
             VALUES(V_CHECK_NO, V_SE_COMMENTS, V_SE_SCORENO);
    END IF;    

    -- 대중교통
    IF(V_T_SCORENO IS NOT NULL)
        THEN INSERT INTO TRANSPORT(CHECK_NO, COMMENTS, SCORENO)
             VALUES(V_CHECK_NO, V_T_COMMENTS, V_T_SCORENO);
    END IF; 

    -- 교통혼잡도
    IF(V_H_SCORENO IS NOT NULL)
        THEN INSERT INTO HONJAP(CHECK_NO, COMMENTS, SCORENO)
             VALUES(V_CHECK_NO, V_H_COMMENTS, V_H_SCORENO);
    END IF;


    --○ 커밋
    COMMIT;
    

    --○ 예외처리
    EXCEPTION
        WHEN CON_ALL_OR_NOT_ERROR
             THEN RAISE_APPLICATION_ERROR(-20004, '생활편의시설에 대한 정보는 모두 입력하거나 입력하지 않아야 합니다.');
                  ROLLBACK;
        WHEN WOLSE_ALL_OR_NOT_ERROR
             THEN RAISE_APPLICATION_ERROR(-20005, '월세에 대한 정보는 모두 입력하거나 입력하지 않아야 합니다.');
                  ROLLBACK;
        WHEN GOING_ALL_OR_NOT_ERROR
             THEN RAISE_APPLICATION_ERROR(-20006, '나의 출근시간에 대한 정보는 모두 입력하거나 입력하지 않아야 합니다.');
                  ROLLBACK;

        WHEN OTHERS THEN ROLLBACK;

END;