CREATE or replace PROCEDURE test_ps(x in int , y  out int )
is 
begin 

    dbms_output.PUT_LINE('hello all ');
    dbms_output.PUT_LINE('procedure'|| ' '|| x);
    y := x*50;


end ;



CREATE or replace PROCEDURE test_ps(x in out int)
is 
begin 

    dbms_output.PUT_LINE('before' || ' ' || x);
         x := x * 50;
    dbms_output.PUT_LINE('after' || ' '|| x);


end;
/


---------------------- second tab ----------------------------------------------------------------------------------

declare 

v_in int := 100;
y_out int;
BEGIN 

    v_in := v_in +5;


    dbms_output.PUT_LINE('woking'|| ' ' || v_in);


    test_ps(v_in,y_out);
    dbms_output.PUT_LINE('value from procedure '|| '' || y_out);


end;



declare 
v_in int := 100;
-- y_out int;
BEGIN 

    v_in := v_in +5;


    dbms_output.PUT_LINE('before calling procedure : '|| ' ' || v_in);


    test_ps(v_in);
    dbms_output.PUT_LINE('after call : '|| '' || v_in);



end;

select employee_id,f_id(EMPLOYEE_ID) from emp2;




--------------------------------------------- 3d tab function -----------------------------------------------------------

CREATE or replace FUNCTION f_id(
    a in int 
)
return int 

is 

begin 

    return a+5;
end;








