set serveroutput on
accept lenumclient prompt "entrez le numero du client: "
accept ladate prompt "entrez la date achat au format yy-mm-dd: "
declare
    varlenumclient varchar(50) := '&lenumclient';
    varladate date := '&ladate';
BEGIN
    procedure_rabais(varlenumclient, varladate);
END;
/