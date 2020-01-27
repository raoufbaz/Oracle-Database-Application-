SET SERVEROUTPUT ON
CREATE OR REPLACE TRIGGER triggerproduit_delete
before delete ON rb_produits
FOR EACH ROW
BEGIN
    DBMS_OUTPUT.PUT_LINE('suppression en cascade de: ' ||:OLD.numprod);
    insert into rb_produitsupprimes select * from rb_venteclients where numprod = :OLD.numprod;
    delete from  rb_venteclients where numprod=:OLD.numprod;
    

END;
/

