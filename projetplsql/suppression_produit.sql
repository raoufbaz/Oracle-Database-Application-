SET VERIFY OFF
SET SERVEROUTPUT ON

accept lenumprod prompt "entrez le numero du produit a supprimer: "
declare
    varlenumprod varchar(12) := '&lenumprod';
    varprod varchar(12) := '&lenumprod';
BEGIN
    select numprod into varprod from rb_produits where numprod=varlenumprod;
    delete from rb_produits where numprod = varlenumprod;
    commit;

    exception
      when no_data_found then
         dbms_output.put_line('Ce produit n existe pas');
END;
/
PAUSE appuyer sur une touche pour continuer...
@C:\PLSQLA2019\projetplsql\menu.sql
