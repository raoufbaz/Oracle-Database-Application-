SET SERVEROUTPUT ON
SET FEEDBACK OFF
SET VERIFY OFF
CREATE or replace PACKAGE taxepackage AS
    FUNCTION Coutvente( lenumclient varchar, ladate DATE) RETURN NUMBER;
    FUNCTION Taxe( coutvente NUMBER) RETURN NUMBER;
END taxepackage;
/

CREATE OR REPLACE PACKAGE BODY taxepackage AS
    FUNCTION Coutvente( lenumclient varchar, ladate DATE) RETURN NUMBER IS lecoutvente NUMBER;
        nber NUMBER:=0;
        CURSOR cur_vente IS select prixvente, QUANTITEVENDU FROM rb_venteclients WHERE UPPER(numclient)=UPPER(lenumclient) AND datevente=ladate;
        le_curseur_temp cur_vente%ROWTYPE;
        
    BEGIN
        OPEN cur_vente;
            FETCH cur_vente INTO le_curseur_temp;
                WHILE cur_vente%FOUND LOOP
                    lecoutvente := nber + (le_curseur_temp.prixvente * le_curseur_temp.QUANTITEVENDU);
                    FETCH cur_vente INTO le_curseur_temp;
                END LOOP;
        CLOSE cur_vente;
        RETURN lecoutvente;
    END Coutvente;

    FUNCTION Taxe( coutvente NUMBER) RETURN NUMBER IS taxe NUMBER;
    BEGIN
        taxe:= (coutvente*15)/100;
        RETURN taxe;
    END Taxe;
END taxepackage;
/