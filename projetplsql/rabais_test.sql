SET VERIFY OFF
set serverout on

ACCEPT lenumclient PROMPT "Entrer le code du client : "
ACCEPT ladate PROMPT "Entrer la date de vente: "
DECLARE
	rabais number(4,2):=0;
	varlenumclient rb_venteclients.numclient%TYPE:='&lenumclient';
	varladate rb_venteclients.datevente%TYPE:='&ladate';
	nbre NUMBER;
    soustotal number(10,2):=0;
    taxe number(10,2):=0;
    total number(10,2):=0;

BEGIN
	select count(codevente) into nbre from rb_venteclients where datevente=varladate and numclient = varlenumclient;
    DBMS_OUTPUT.PUT_LINE(nbre);
        select sum(quantitevendu * prixvente) into soustotal
        from rb_venteclients 
        where datevente = varladate 
		and numclient = varlenumclient
		group by numclient;

        taxe := soustotal*0.15;
        total := taxe + soustotal; 

    
        if soustotal <=100 then
            soustotal := soustotal*0.05;
        elsif soustotal>100 and soustotal <=500 then
            soustotal := soustotal * 0.1;
        else
            soustotal := soustotal * 0.15;
        end if; 
        
        DBMS_OUTPUT.PUT_LINE('Sous Total: '||soustotal||' '||'Taxe: '||taxe||' '||'Total: '||' '||total);
    
    exception
      when no_data_found then		          
        FOR mavar IN(
            select numclient, sum(quantitevendu * prixvente) as soustotal,
                sum(quantitevendu * prixvente *0.15) as taxe,
                (sum(quantitevendu * prixvente) + sum(quantitevendu * prixvente *0.15)) as total
            from rb_venteclients
            group by numclient) LOOP
         DBMS_OUTPUT.PUT_LINE(mavar.numclient||' '||mavar.soustotal||' '||mavar.taxe||' '||mavar.total);
		END LOOP;
	  
END;
/
SET VERIFY ON
PAUSE Appuyer sur une touche pour retourner au menu...
@C:\PLSQLA2019\projetplsql\menu.sql