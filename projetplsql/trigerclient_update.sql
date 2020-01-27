SET SERVEROUTPUT ON
CREATE OR REPLACE TRIGGER trigger_numclient
AFTER UPDATE OF numclient ON rb_clients
FOR EACH ROW
BEGIN
	DBMS_OUTPUT.PUT_LINE('Modification en cascade de : ' ||:NEW.numclient);
	update rb_venteclients set numclient=:NEW.numclient where numclient=:OLD.numclient;
END;
/
PAUSE Appuyer entrer pour continuer