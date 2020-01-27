SET SERVEROUTPUT ON
SET FEEDBACK OFF
SET VERIFY OFF
accept lenumclientnouveau prompt "entrez le nouvvea numero du client: "
accept lenumclientancien prompt "entrez l ancien numero: "
declare
    varlenumclientnouveau varchar(50) := '&lenumclient';
    varlenumclientancien varchar(50) := '&lenumclientancien';
    varnumclient varchar(50);
BEGIN
    select numclient into varnumclient from rb_clients where numclient=varlenumclientancien;
    update rb_clients set numclient = varlenumclientnouveau where numclient = varlenumclientancien;
    commit;
    dbms_output.put_line('Ce client a ete mis a jour');

    exception
      when no_data_found then
         dbms_output.put_line('Ce client n existe pas');
END;
/
PAUSE Appuyer entrer pour continuer
@C:\PLSQLA2019\projetplsql\menu.sql