CREATE DIRECTORY DIRECTFILE AS 'c:\FILE\';
/
DECLARE
    vn_id            EMPLOYEES.EMPLOYEE_ID%TYPE;
    vs_name          EMPLOYEES.FIRST_NAME%TYPE;
    vs_surname       EMPLOYEES.LAST_NAME%TYPE;
    vs_dep_name      DEPARTMENTS.DEPARTMENT_NAME%TYPE;
    
   CURSOR c_employees IS 
   
   SELECT e.EMPLOYEE_ID, e.FIRST_NAME, e.LAST_NAME, d.DEPARTMENT_NAME 
        FROM EMPLOYEES e 
        INNER JOIN DEPARTMENTS d 
        ON (e.DEPARTMENT_ID= d.DEPARTMENT_ID); 
    FileTxt UTL_FILE.FILE_TYPE;
    
BEGIN

  FileTxt := UTL_FILE.FOPEN('DIRECTFILE', 'employees_information.txt', 'W');
  OPEN c_employees;
  LOOP
  
  FETCH c_employees INTO  vn_id, vs_name, vs_surname, vs_dep_name; 
  
  EXIT WHEN c_employees%notfound; 
  
  UTL_FILE.PUTF(FileTxt, 'ID-> ' || vn_id || '\n' || ' Name-> ' || vs_name || '\n' || ' Surname-> ' || vs_surname || '\n' || ' department-> ' || vs_dep_name || '\n\n\n');
  
  END LOOP;
  
  CLOSE c_employees;
  
  UTL_FILE.FCLOSE(FileTxt);
  
EXCEPTION

   WHEN OTHERS THEN
     dbms_output.put_line('Error:' || sqlerrm);
     
END;
/