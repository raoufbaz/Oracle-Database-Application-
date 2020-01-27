SET VERIFY OFF
SET SERVEROUTPUT ON

ACCEPT numclient PROMPT "Entrez le numero du client: "
ACCEPT dat PROMPT "Entrez la date du client: "

DECLARE

    varnumclient rb_venteclients.Numclient%TYPE:='&numclient';

    Dat rb_venteclients.Datevente%TYPE:='&dat';
    nber NUMBER;
    taxe NUMBER ;
    total NUMBER;
    info_client rb_clients.Nomclient%TYPE;
    info_client_p rb_clients.Prenomclient%TYPE;
    compte NUMBER;

BEGIN

    select count(Numclient) into compte FROM rb_venteclients where upper(Numclient)=upper(varnumclient);

    IF(compte>0) THEN

        nber:=taxepackage.Coutvente(varnumclient,Dat);
        taxe:=taxepackage.Taxe(nber);

        SELECT Nomclient INTO info_client FROM rb_clients where upper(Numclient)=upper(varnumclient);
        SELECT Prenomclient INTO info_client_p FROM rb_clients where upper(Numclient)=upper(varnumclient);


        DBMS_OUTPUT.PUT_LINE(info_client||' '||info_client_p);
        DBMS_OUTPUT.PUT_LINE(' SOUS TOTAL: '||nber);
        DBMS_OUTPUT.PUT_LINE('TAXE: '||taxe);
        total:=taxe+nber;
        DBMS_OUTPUT.PUT_LINE('TOTAL: '||total);

        DBMS_OUTPUT.PUT_LINE('*****************************');

    ELSE
        DBMS_OUTPUT.PUT_LINE('ce client n a pas de commande');
    END IF;
   
END;
/
PAUSE appuyer sur une touche pour continuer...
@C:\PLSQLA2019\projetplsql\menu.sql
