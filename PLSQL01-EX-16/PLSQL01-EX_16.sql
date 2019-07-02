CREATE OR REPLACE PACKAGE staj_utility AS 

    PROCEDURE print_day_with_function(pid_date_day DATE);
    FUNCTION GET_DAY(pid_date_day DATE) RETURN VARCHAR2;
END staj_utility;

CREATE OR REPLACE PACKAGE BODY staj_utility 
IS
    FUNCTION GET_DAY(pid_date_day DATE)
    RETURN VARCHAR2 
    AS 
    pos_day VARCHAR2(20);
BEGIN
    SELECT CASE 
            WHEN TO_CHAR(pid_date_day,'D')=1 THEN 'PAZARTESI'
            WHEN TO_CHAR(pid_date_day,'D')=2 THEN 'SALI'
            WHEN TO_CHAR(pid_date_day,'D')=3 THEN 'CARSAMBA'
            WHEN TO_CHAR(pid_date_day,'D')=4 THEN 'PERSEMBE'
            WHEN TO_CHAR(pid_date_day,'D')=5 THEN 'CUMA'
            WHEN TO_CHAR(pid_date_day,'D')=6 THEN 'CUMARTESI'
            ELSE 'PAZAR'
            END
        INTO pos_day 
        FROM DUAL;
    RETURN pos_day;
END GET_DAY;

PROCEDURE print_day_with_function(pid_date_day DATE)
    IS
    pos_day VARCHAR2(20);
BEGIN
    pos_day := GET_DAY(pid_date_day);
    DBMS_OUTPUT.PUT_line(pos_day);
END;

END staj_utility;



BEGIN
   
   print_day_with_function(SYSDATE); 

END;



    






