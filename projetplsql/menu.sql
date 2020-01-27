CLEAR SCREEN
PROMPT *******   MENU PRINCIPAL   ***********
PROMPT *        1: create_tables.sql        *
PROMPT *        2: insert_clients.sql       *
PROMPT *        3: insert_produits.sql      *
PROMPT *        4: insert_venteclient.sql   *
PROMPT *        5: procedurerabais_appel.sql *
PROMPT *        6: procedurerabais.SQL       *
PROMPT *        7: facture.SQL              *
PROMPT *        8: update_client.sql         *
PROMPT *        9: suppression_produit.sql   *
PROMPT *        10: Quitter.sql             *
PROMPT **************************************
ACCEPT varselection PROMPT " Entrer une option entre 1 et 10: "
SET TERM OFF
COLUMN script NEW_VALUE v_script
SELECT CASE '&varselection'
WHEN '1' THEN 'create_table.sql'
WHEN '2' THEN 'insert_client.sql'
WHEN '3' THEN 'insert_produit.sql'
WHEN '4' THEN 'insert_venteclient.sql'
WHEN '5' THEN 'procedurerabais_appel.sql'
WHEN '6' THEN 'procedurerabais.sql'
WHEN '7' THEN 'facture.sql'
WHEN '8' THEN 'update_client.sql'
WHEN '9' THEN 'suppression_produit.sql'
WHEN '10' THEN 'quitter.sql'
ELSE 'menu.sql'
END AS script
FROM dual;
SET TERM ON

@C:\PLSQLA2019\projetplsql\&v_script
