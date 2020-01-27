set serveroutput on
set verify off
DECLARE
	table_existe EXCEPTION;
	PRAGMA EXCEPTION_INIT(table_existe,-955);
BEGIN	
		BEGIN
	
			EXECUTE IMMEDIATE'create table rb_clients(
					numclient varchar2(10) primary key,
					nomclient varchar2(50),
					prenomclient varchar2(50),
					telephone varchar2(20),
					norue varchar2(10),
					nomrue varchar2(50),
					ville varchar2(50),
					province varchar2(50),
					codepostal varchar2(10),
					pays varchar2(50))';
			DBMS_OUTPUT.PUT_LINE('La table  rb_clients est creee!');
		EXCEPTION
			WHEN table_existe THEN
				DBMS_OUTPUT.PUT_LINE('La table  rb_clients existe!');
		END;
		DECLARE
			table_existe2 EXCEPTION;
			PRAGMA EXCEPTION_INIT(table_existe2,-955);
		BEGIN
			EXECUTE IMMEDIATE'create table rb_produits(
					numprod varchar2(12) primary key,
					nom varchar2(50),
					quantitestock number(5),
					prix number(10,2))';
			DBMS_OUTPUT.PUT_LINE('La table rb_produits est creee!');
		EXCEPTION
			WHEN table_existe2 THEN
				DBMS_OUTPUT.PUT_LINE('La table  rb_produits existe!');
		END;
		DECLARE
			table_existe2 EXCEPTION;
			PRAGMA EXCEPTION_INIT(table_existe2,-955);
		BEGIN
		EXECUTE IMMEDIATE'create table rb_venteclients(
				codevente number(21) primary key,
				numclient varchar2(10), 
				numprod varchar2(10), 
				datevente date,
				quantitevendu number(4),				
				prixvente number(10,2),
				constraint fk_clien_venteclient foreign key(numprod) references rb_produits(numprod),
				constraint fk_produit_venteclient foreign key(numclient) references rb_clients(numclient))';
				DBMS_OUTPUT.PUT_LINE('La table rb_venteclients est creee!');
		EXCEPTION 
			when table_existe2 then
				DBMS_OUTPUT.PUT_LINE('La table rb_venteclient existe deja!');
	END;		
END;
/
PAUSE Appuyer entrer pour continuer
@C:\PLSQLA2019\projetplsql\menu.sql