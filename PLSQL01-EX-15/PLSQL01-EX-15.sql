SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE print_day1(pid_date_day IN DATE, pos_day OUT VARCHAR2)
IS
BEGIN
    SELECT TO_CHAR(pid_date_day,'DAY') 
        INTO pos_day 
        FROM DUAL;
    DBMS_OUTPUT.PUT_line(pos_day);
END;
/
DECLARE
    vd_date_day DATE;
    vs_day VARCHAR2(20);

BEGIN
    print_day1(SYSDATE,vs_day);
END;