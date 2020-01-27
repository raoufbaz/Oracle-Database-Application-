SET SERVEROUTPUT ON
SET FEEDBACK OFF
SET VERIFY OFF

accept lenumclient prompt "entrez le numclient : ";
accept lenumprod prompt "entrez le numprod : ";
accept ladatevente prompt "entrez la datevente : ";
accept laquantite prompt "entrez la quantitevendue : ";
accept leprix prompt "entrez le prix vente : ";

declare
    err_integrite_ref EXCEPTION;
	PRAGMA EXCEPTION_INIT(err_integrite_ref,-2291);

	varlenumclient rb_venteclients.numclient%type := '&lenumclient';
	varlenumprod rb_venteclients.numprod%type := '&lenumprod';
	varladatevente rb_venteclients.datevente%type := '&ladatevente';
	varlaquantite rb_venteclients.quantitevendu%type := '&laquantite';	
	varleprix  rb_venteclients.prixvente%type := '&leprix';
	varleprixtrouver  rb_venteclients.prixvente%type := 0;
    varlaquantitetrouver rb_venteclients.quantitevendu%type := 0;
    nbr number:=-1;
begin	
    select prix into varleprixtrouver from rb_produits where numprod =varlenumprod;
    select quantitestock into varlaquantitetrouver from rb_produits where numprod =varlenumprod;
    --dbms_output.put_line(varleprixtrouver);
    --dbms_output.put_line(varlaquantitetrouver);
    

    if ((varleprix >= varleprixtrouver) and (varlaquantite <= varlaquantitetrouver))  then  
        insert into rb_venteclients  values(SEQCODEVENTE_PRJ.NEXTVAL, varlenumclient, varlenumprod, varladatevente, varlaquantite, varleprix);      
        update rb_produits set quantitestock=quantitestock - varlaquantite where numprod = varlenumprod;
        commit;
        dbms_output.put_line('Insertion reussie');
           
    elsif ((varleprix is null) and (varlaquantite <= varlaquantitetrouver)) then
        varleprix := varleprixtrouver;
        insert into rb_venteclients  values(SEQCODEVENTE_PRJ.NEXTVAL, varlenumclient, varlenumprod, varladatevente, varlaquantite, varleprix);       
        update rb_produits set quantitestock=quantitestock - varlaquantite where numprod = varlenumprod;
        commit;
        dbms_output.put_line('Insertion reussie');
    elsif varlaquantitetrouver = 0 then
        dbms_output.put_line('Le stock de ce produit est epuise');
    else  
      dbms_output.put_line('Echec d''insertion');
    end if;
    for listeventes in (select * from rb_venteclients) loop
        dbms_output.put_line(listeventes.codevente||' '||listeventes.numclient||' '||listeventes.numprod||' '||listeventes.datevente||' '||listeventes.quantitevendu ||''||listeventes.prixvente);
    end loop; 
 
exception
    when err_integrite_ref then
        dbms_output.put_line('Ereure d''integrite referentielle');
	when others then
        dbms_output.put_line('une erreur s''produite');	
end;
/
PAUSE Appuyer entrer pour continuer
@C:\PLSQLA2019\projetplsql\menu.sql