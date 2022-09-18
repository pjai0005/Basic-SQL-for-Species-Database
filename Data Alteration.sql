--****PLEASE ENTER YOUR DETAILS BELOW****
--T3-cb-alter.sql

--Student ID: 32192673
--Student Name: Prachi Jaiswal
--Tutorial No: 23

/* Comments for your marker:



*/

/*
Task 3:

Make the listed changes to the "live" database
*/
--PLEASE PLACE REQUIRED SQL STATEMENT(S) BELOW

-- (a)
ALTER TABLE centre ADD offspring_count NUMERIC(6) DEFAULT 0 NOT NULL;

COMMIT;


-- (b)
ALTER TABLE animal ADD deceased_date DATE;

COMMENT ON COLUMN animal.deceased_date IS
    'The date when the animal died';

ALTER TABLE animal ADD deceased_cause CHAR(1);

COMMENT ON COLUMN animal.deceased_cause IS
    'The cause of animal decease. N: Natural, D: Disease, O: Other Causes, U: Under Investigation';

ALTER TABLE animal ADD constraints decease_check CHECK ( ( deceased_cause IN ( 'N', 'D', 'O', 'U' )
                                                           AND deceased_cause IS NOT NULL
                                                           AND deceased_date IS NOT NULL )
                                                         OR ( deceased_cause IS NULL
                                                              AND deceased_date IS NULL ) );
                                                              
UPDATE animal
SET
    deceased_date = sysdate,
    deceased_cause = 'U'
WHERE
    animal_id = 7;
    
COMMIT;

--select * from animal;
--select * from centre;
 
/*
******* Explain here your selected approach and its advantage/s *********

Two columns are added for preserving the data of animals. Eventually, animals will die for some 
reasons or other, therefore a column is created to have a log of the animal's deceased date. 
In this way, the animals which die will have their data preserved for purposes like:

- A child's parent data will be secured.
- If some deaths are caused by an infectious disease then we can have a track of that too.

With this approach, organisations will know if a disease is hereditary and can cause any harm to 
their offsprings, or if the disease is contagious and can spread to other animals as well.

A better approach would have been an extension of this approach where we could have created a lookup table
for diseases. This would have given us more information about which animal is highly prone to which diseases.

The above constraints would help the organisations to have a robust database structure where the 
organisations can't insert the death cause unless they have a death date or vice versa.

UPDATE animal
SET
    deceased_cause = 'N'
WHERE
    animal_id = 7;    
    
UPDATE animal
SET
    deceased_date = sysdate
WHERE
    animal_id = 7; 
    
For some cases where the cause can't be determined instantly, we can add 
'U' which means the cause is under investigation.
*/


-- (c)

DROP TABLE centre_type CASCADE CONSTRAINTS PURGE;

CREATE TABLE centre_type (
    centre_type_name VARCHAR2(30) NOT NULL,
    CONSTRAINT centre_type_name_pk PRIMARY KEY ( centre_type_name )
);

INSERT INTO centre_type VALUES ( 'Other' );

INSERT INTO centre_type VALUES ( 'Zoo' );

INSERT INTO centre_type VALUES ( 'Wildlife Park' );

INSERT INTO centre_type VALUES ( 'Sanctuary' );

INSERT INTO centre_type VALUES ( 'Nature Reserve' );

ALTER TABLE centre ADD centre_type_name VARCHAR2(30) DEFAULT 'Other' NOT NULL;

ALTER TABLE centre
    ADD CONSTRAINT centre_type_centre FOREIGN KEY ( centre_type_name )
        REFERENCES centre_type ( centre_type_name );

UPDATE centre
SET
    centre_type_name = (
        CASE
            WHEN ( centre_name LIKE '%Zoo%' ) THEN
                'Zoo'
            WHEN ( centre_name LIKE '%Park%' ) THEN
                'Wildlife Park'
            WHEN ( centre_name LIKE '%Sanctuary%' ) THEN
                'Sanctuary'
            WHEN ( centre_name LIKE '%Reserve%' ) THEN
                'Nature Reserve'
            ELSE
                'Other'
        END
    );
    
COMMIT;

--select * from centre;
--select * from centre_type;