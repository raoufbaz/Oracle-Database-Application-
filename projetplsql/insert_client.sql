SET SERVEROUTPUT ON
SET FEEDBACK OFF
SET VERIFY OFF

accept lenom prompt "entrez le nom du client: ";
accept leprenom prompt "entrez le prenom: ";
accept letelephone prompt "entrez le telephone au format 000-0000 : ";
accept lenorue prompt "entrez le norue : ";
accept lenomrue prompt "entrez le nomrue : ";
accept laville prompt "entrez la ville : ";
accept laprovince prompt "entrez la province : ";
accept lecodepostal prompt "entrez lecodepostal : ";
accept lepays prompt "entrez lepays : ";

declare

	varlenom rb_clients.nomclient%type := '&lenom';
	varleprenom rb_clients.prenomclient%type := '&leprenom';
	varletelepho rb_clients.telephone%type := '&letelephone';
	varletelephone rb_clients.telephone%type := '&letelephone';
	varletel rb_clients.telephone%type := '';
	varlenorue rb_clients.norue%type := '&lenorue';	
	varlenomrue rb_clients.nomrue%type := '&lenomrue';	
	varlaville rb_clients.ville%type := '&laville';	
	varlaprovince rb_clients.province%type := '&laprovince';	
	varlecodepostal rb_clients.codepostal%type := '&lecodepostal';	
	varlepays rb_clients.pays%type := '&lepays';	
begin
    if varlaville = 'Montreal' then
        varletel := '(514)';
    elsif varlaville = 'Longueuil' or varlaville ='Laval' then
        varletel := '(450)';
    elsif varlaville = 'Quebec' then
        varletel := '(418)';
    else
        varletel := '(000)';
    end if;

    varletelephone := varletel||varletelepho;
    dbms_output.put_line('Le tephone est'|| varletelephone);

	IF REGEXP_LIKE(varletelephone,'^\(\d{3}\)\d{3}-\d{4}$') = false THEN
        dbms_output.put_line('Le format du telephone est non valide');
    ELSE
        IF REGEXP_LIKE(varlecodepostal,'[A-Za-z]\d[A-Za-z] ?\d[A-Za-z]\d') = false THEN
            dbms_output.put_line('Le format du code postal est non valide');
            dbms_output.put_line(varlecodepostal);
        ELSE
            insert into rb_clients  values(substr(varlenom,0,3)||substr(varleprenom,0,1)||substr(varletelephone,-4), varlenom, varleprenom, varletelephone, varlenorue, varlenomrue, varlaville, varlaprovince, varlecodepostal, varlepays);
            commit;	
            for listerb_clients in (select * from rb_clients) loop
                dbms_output.put_line(listerb_clients.numclient||' '||listerb_clients.nomclient||' '||listerb_clients.prenomclient||' '||listerb_clients.telephone||' '||listerb_clients.codepostal);
            end loop;    
        end if;
    END IF;

exception
	when dup_val_on_index then
  		dbms_output.put_line('Ereure de doublon');
	when others then
        dbms_output.put_line('une erreur s est produite');	
end;
/
PAUSE Appuyer entrer pour continuer
@C:\PLSQLA2019\projetplsql\menu.sql