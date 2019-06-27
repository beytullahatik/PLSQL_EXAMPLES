CREATE DIRECTORY DIRECT AS 'C:\OracleDirect\';
/
DECLARE
  vs_name EMPLOYEES.FIRST_NAME%TYPE;
  vn_salary EMPLOYEES.SALARY%TYPE;
  vn_dollar number := 5.79;
  vRichestTxt utl_file.file_type;
BEGIN
    SELECT 
        FIRST_NAME, SALARY 
    INTO
        vs_name,vn_salary
    FROM 
        EMPLOYEES 
    WHERE 
        SALARY = (SELECT MAX(SALARY) FROM EMPLOYEES);
        
  vRichestTxt:= UTL_FILE.FOPEN('DIRECT', 'richest_employee_information.txt', 'W');
  UTL_FILE.PUTF(vRichestTxt, 'Name of the richest employee-> ' || vs_name || '\n');
  UTL_FILE.PUTF(vRichestTxt, 'Salary in TL-> ' || vn_salary || '\n');
  UTL_FILE.PUTF(vRichestTxt, 'Salary in dollars-> ' || vn_salary/vn_dollar || '\n');
  UTL_FILE.FCLOSE(vRichestTxt);
EXCEPTION
  WHEN OTHERS THEN
     dbms_output.put_line('Error:' || sqlerrm);
END;
/