1. Implicit Cursor

An implicit cursor is automatically created by Oracle when you use INSERT, UPDATE, DELETE, or SELECT INTO.

DECLARE
    v_name employees.name%TYPE;
BEGIN
    SELECT name
    INTO v_name
    FROM employees
    WHERE employee_id = 101;

    DBMS_OUTPUT.PUT_LINE('Employee Name: ' || v_name);
END;
/

-----------------------------------------------------Explicit cursor -------------------------------------------------------------------------------------

2. Explicit Cursor

An explicit cursor is created and controlled by the programmer. It is useful when a query returns multiple rows.

DECLARE
    CURSOR emp_cursor IS
        SELECT employee_id, name
        FROM employees;

    v_id   employees.employee_id%TYPE;
    v_name employees.name%TYPE;
BEGIN
    OPEN emp_cursor;

    LOOP
        FETCH emp_cursor INTO v_id, v_name;

        EXIT WHEN emp_cursor%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE(v_id || ' - ' || v_name);
    END LOOP;

    CLOSE emp_cursor;
END;
/




