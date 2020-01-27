CREATE or replace PACKAGE taxepackage AS
    FUNCTION Coutvente( lenumclient varchar, ladate DATE) RETURN NUMBER;
    FUNCTION Taxe( coutvente NUMBER) RETURN NUMBER;
END taxepackage;
/
