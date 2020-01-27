SET SERVEROUTPUT ON
SET FEEDBACK OFF
SET VERIFY OFF


accept lenom prompt "entrez le nom du produit: ";
accept laquantitestock prompt "entrez la quantite stock: ";
accept leprix prompt "entrez le prix produit: ";

declare
	
	varlenom rb_produits.nom%type := '&lenom';
	varlaquantitestock rb_produits.quantitestock%type := '&laquantitestock';
	varleprix rb_produits.prix%type := '&leprix';	
begin	
	
		insert into rb_produits  values('P'||SEQNUMPROD_PRJ.nextval,varlenom, varlaquantitestock, varleprix);
		commit;	
		for listerb_produits in (select * from rb_produits) loop
			dbms_output.put_line(listerb_produits.numprod||' '||listerb_produits.nom||' '||listerb_produits.prix);
		end loop;
exception
	when dup_val_on_index then
  		dbms_output.put_line('Ereure de doublon');
	when others then
        dbms_output.put_line('une erreur s''rb_produitse');	
end;
/
PAUSE Appuyer entrer pour continuer
@C:\PLSQLA2019\projetplsql\menu.sql