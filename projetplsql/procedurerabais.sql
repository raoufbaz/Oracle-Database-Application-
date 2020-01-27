SET SERVEROUTPUT ON
SET FEEDBACK OFF
SET VERIFY OFF
create or replace PROCEDURE procedure_rabais (varlenumclient in rb_venteclients.numclient%TYPE, varladate in rb_venteclients.datevente%TYPE) is
    taux number:=1;
    varnumcli varchar2(12);
BEGIN
    select numclient into varnumcli from rb_venteclients where numclient=varlenumclient and datevente=varladate;
	for update_client in (select * from rb_venteclients where numclient=varlenumclient and datevente=varladate) loop
      if update_client.prixvente * update_client.quantitevendu <= 100 then
        taux:=0.95;
        elsif (update_client.prixvente * update_client.quantitevendu >100) and (update_client.prixvente * update_client.quantitevendu <= 500) then
          taux:=0.90;
      else
        taux:=0.85;
      end if;
      update rb_venteclients
         set prixvente=update_client.prixvente*taux
       where numclient = update_client.numclient;
    end loop;
     commit;

    /* taxe := soustotal*0.15;
    total := taxe + soustotal;
     
    select sum(quantitevendu * prixvente) into soustotal
    from rb_venteclients 
    where datevente = varladate 
    and numclient = varlenumclient
    group by numclient;
    
    DBMS_OUTPUT.PUT_LINE('Sous Total: '||soustotal||' '||'Taxe: '||taxe||' '||'Total: '||' '||total);
  */
 
	/* select count(codevente) into nbre from rb_venteclients where datevente=varladate and numclient = varlenumclient;
    DBMS_OUTPUT.PUT_LINE(nbre);

        taxe := soustotal*0.15;
        total := taxe + soustotal; 

        if soustotal <=100 then
            soustotal := soustotal*0.05;
        elsif soustotal>100 and soustotal <=500 then
            soustotal := soustotal * 0.1;
        else
            soustotal := soustotal * 0.15;
        end if; 
        
    
    exception
      when no_data_found then		          
        FOR mavar IN(
            select numclient, sum(quantitevendu * prixvente) as soustotal,
                sum(quantitevendu * prixvente *0.15) as taxe,
                (sum(quantitevendu * prixvente) + sum(quantitevendu * prixvente *0.15)) as total
            from rb_venteclients
            group by numclient) LOOP
         DBMS_OUTPUT.PUT_LINE(mavar.numclient||' '||mavar.soustotal||' '||mavar.taxe||' '||mavar.total);
		END LOOP; */
    exception
      when no_data_found then
        DBMS_OUTPUT.PUT_LINE('ce client existe pas ');
	  
END;
/
PAUSE Appuyer entrer pour continuer
@C:\PLSQLA2019\projetplsql\menu.sql