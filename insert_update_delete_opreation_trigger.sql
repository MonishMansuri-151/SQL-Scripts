CREATE TABLE user_info (
    user_id NUMBER PRIMARY KEY,
    username VARCHAR2(100),
    email VARCHAR2(100)
);

SELECT sequence_name
FROM user_sequences
WHERE sequence_name = 'USER_AUDIT_SEQ';

CREATE SEQUENCE user_audit_seq
START WITH 1
INCREMENT BY 1;


INSERT INTO user_info
(user_id, username, email)
VALUES
(1, 'Rahul', 'rahul@gmail.com');

COMMIT;



select * from USER_INFO;

----------------------------  creatre table user_info and insert the data in to table ---------------------------------


CREATE TABLE user_audit (
    audit_id NUMBER PRIMARY KEY,
    username VARCHAR2(100),
    operation VARCHAR2(10),
    old_value VARCHAR2(4000),
    new_value VARCHAR2(4000),
    operation_time TIMESTAMP
);

select * from USER_AUDIT;
---------------------------------------- audit table can store the data any insert,update, delelte opreation -----------------------------

----------------- creare trigger and user_info table and new adn old value and add timestamp ------------------------------------------
CREATE OR REPLACE TRIGGER trg_user_audit
AFTER INSERT OR UPDATE OR DELETE
ON user_info
FOR EACH ROW
BEGIN

    IF INSERTING THEN

        INSERT INTO user_audit
        (
            audit_id,
            username,
            operation,
            old_value,
            new_value,
            operation_time
        )
        VALUES
        (
            user_audit_seq.NEXTVAL,
            :NEW.username,
            'INSERT',
            NULL,
            :NEW.username,
            SYSTIMESTAMP
        );

    ELSIF UPDATING THEN

        INSERT INTO user_audit
        (
            audit_id,
            username,
            operation,
            old_value,
            new_value,
            operation_time
        )
        VALUES
        (
            user_audit_seq.NEXTVAL,
            :NEW.username,
            'UPDATE',
            :OLD.username,
            :NEW.username,
            SYSTIMESTAMP
        );

    ELSIF DELETING THEN

        INSERT INTO user_audit
        (
            audit_id,
            username,
            operation,
            old_value,
            new_value,
            operation_time
        )
        VALUES
        (
            user_audit_seq.NEXTVAL,
            :OLD.username,
            'DELETE',
            :OLD.username,
            NULL,
            SYSTIMESTAMP
        );

    END IF;

END;
/



















