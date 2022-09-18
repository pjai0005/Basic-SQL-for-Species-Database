--****PLEASE ENTER YOUR DETAILS BELOW****
--T1-cb-schm.sql

--Student ID: 32192673
--Student Name: Prachi Jaiswal
--Tutorial No: 23

/* Comments for your marker:


*/

/*
Using the model and details supplied, and the supplied T1-cb-schm.sql
file, create an SQL schema file which can be used to create this database in
Oracle.
*/
--PLEASE PLACE REQUIRED SQL STATEMENT(S) BELOW

/* Drop Tables*/
DROP TABLE species CASCADE CONSTRAINTS PURGE;

DROP TABLE centre CASCADE CONSTRAINTS PURGE;

DROP TABLE animal CASCADE CONSTRAINTS PURGE;

DROP TABLE breeding_event CASCADE CONSTRAINTS PURGE;

/* Species Table*/
CREATE TABLE species (
    spec_genus          VARCHAR2(20) NOT NULL,
    spec_name           VARCHAR2(20) NOT NULL,
    spec_popular_name   VARCHAR2(40) NOT NULL,
    spec_family         VARCHAR2(20) NOT NULL,
    spec_natural_range  VARCHAR2(100) NOT NULL,
    CONSTRAINT species_pk PRIMARY KEY ( spec_genus,spec_name ),
    CONSTRAINT species_uq UNIQUE ( spec_popular_name )
);

COMMENT ON COLUMN species.spec_genus IS
    'The species genus';

COMMENT ON COLUMN species.spec_name IS
    'The species name';

COMMENT ON COLUMN species.spec_popular_name IS
    'The species popular name';

COMMENT ON COLUMN species.spec_family IS
    'The species family name';

COMMENT ON COLUMN species.spec_natural_range IS
    'Description of the natural range of the species';

COMMIT; 

/* Centre Table*/
CREATE TABLE centre (
    centre_id        CHAR(6) NOT NULL,
    centre_name      VARCHAR2(40) NOT NULL,
    centre_address   VARCHAR2(100) NOT NULL,
    centre_director  VARCHAR2(30) NOT NULL,
    centre_phone_no  VARCHAR2(20) NOT NULL,
    CONSTRAINT centre_pk PRIMARY KEY ( centre_id ),
    CONSTRAINT centre_uq UNIQUE ( centre_name )
);

COMMENT ON COLUMN centre.centre_id IS
    'The identifier for the center';

COMMENT ON COLUMN centre.centre_name IS
    'The centre name';

COMMENT ON COLUMN centre.centre_address IS
    'The centre address';

COMMENT ON COLUMN centre.centre_director IS
    'The name of the centres director';

COMMENT ON COLUMN centre.centre_phone_no IS
    'The centres phone contact number';

COMMIT;

/* Animal Table*/
CREATE TABLE animal (
    animal_id   NUMBER(6) NOT NULL,
    animal_sex  CHAR(1) NOT NULL,
    brevent_id    NUMERIC(6),
    centre_id   CHAR(6) NOT NULL,
    spec_genus  VARCHAR2(20) NOT NULL,
    spec_name   VARCHAR2(20) NOT NULL,
    CONSTRAINT animal_pk PRIMARY KEY ( animal_id ),
    CONSTRAINT animal_sex CHECK ( animal_sex IN ( 'F', 'M' ) ),
    CONSTRAINT centre_animal_fk FOREIGN KEY ( centre_id )
        REFERENCES centre ( centre_id ),
    CONSTRAINT species_animal_fk FOREIGN KEY ( spec_genus, spec_name )
        REFERENCES species ( spec_genus , spec_name)
);


COMMENT ON COLUMN animal.animal_id IS
    'The identifier for the animal';

COMMENT ON COLUMN animal.animal_sex IS
    'The animal sex (M or F)';

COMMENT ON COLUMN animal.brevent_id IS
    'If bred in captivity (i.e. at a centre), the id of the breeding event
which produced the animal. Animals which have been captured
from the wild will have no brevent_id assigned';

COMMENT ON COLUMN animal.centre_id IS
    'The "home" center where the animal is normally located.
Animals are sometimes located at other centres for a breeding
event';

COMMENT ON COLUMN animal.spec_genus IS
    'The species genus for the animal';

COMMENT ON COLUMN animal.spec_name IS
    'The species name for the animal';

/* Breeding_Event Table*/
CREATE TABLE breeding_event (
    brevent_id    NUMERIC(6) NOT NULL,
    brevent_date  DATE NOT NULL,
    mother_id     NUMERIC(6) NOT NULL,
    father_id     NUMERIC(6) NOT NULL,
    CONSTRAINT breeding_event_pk PRIMARY KEY ( brevent_id )
);

COMMENT ON COLUMN breeding_event.brevent_id IS
    'The identifier for the breeding event';

COMMENT ON COLUMN breeding_event.brevent_date IS
    'The date on which the breeding event took place';

COMMENT ON COLUMN breeding_event.mother_id IS
    'The identifier for the animal mother';

COMMENT ON COLUMN breeding_event.father_id IS
    'The identifier for the animal father';

/* Adding FKs to Animal and Breeding Event Tables*/

ALTER TABLE breeding_event ADD (
    CONSTRAINT mother_animal_breeding_event FOREIGN KEY ( mother_id )
        REFERENCES animal ( animal_id ),
    CONSTRAINT father_animal_breeding_event FOREIGN KEY ( father_id )
        REFERENCES animal ( animal_id )
);

ALTER TABLE animal
    ADD CONSTRAINT breeding_event_animal FOREIGN KEY ( brevent_id )
        REFERENCES breeding_event ( brevent_id );


COMMIT;


/*
DESC species;

DESC centre;

DESC animal;

DESC breeding_event;
*/