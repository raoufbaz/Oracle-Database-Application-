-- create tablespace projet
-- datafile 'C:\oraclexe\app\oracle\oradata\XE\projet.dbf' 
-- size 128M autoextend on next 64M;

-- create user userprojet identified by 123
-- default tablespace projet
-- temporary tablespace temp;

-- grant connect, resource, dba, imp_full_database to userprojet;

-- connect userprojet/SYSTEM 


ALTER TABLE rb_clients ALTER  telephone varchar2(20) NOT NULL

ALTER TABLE maTable ALTER COLUMN maColonne INTEGER NOT NULL

CREATE SEQUENCE SEQNUMPROD_PRJ increment by 1 start with 100000000 minvalue 100000000 
maxvalue 9999999999 nocache cycle; 

CREATE SEQUENCE SEQCODEVENTE_PRJ increment by 1 start with 1 minvalue 1 
maxvalue 99999999999999999999 nocache cycle; 