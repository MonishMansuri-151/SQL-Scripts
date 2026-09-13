

------------------------------------------- beckup table store -------------------------------------------------------------------------
CREATE TABLE salary_audit (
    emp_id       NUMBER,
    old_salary   NUMBER,
    new_salary   NUMBER,
    change_date  DATE
);

--------------------------------------------------------------- tigger work -------------------------------------------------------

CREATE OR REPLACE TRIGGER salary_audit_trigger
AFTER UPDATE OF salary
ON employees
FOR EACH ROW
BEGIN

    INSERT INTO salary_audit
    (
        emp_id,
        old_salary,
        new_salary,
        change_date
    )
    VALUES
    (
        :OLD.employee_id,
        :OLD.salary,
        :NEW.salary,
        SYSDATE
    );

END;
/
