--****PLEASE ENTER YOUR DETAILS BELOW****
--T2-cb-insert.sql

--Student ID: 32192673
--Student Name: Prachi Jaiswal
--Tutorial No: 23

/* Comments for your marker:



*/

/*
Task 2 (b):

Load the ANIMAL and BREEDING_EVENT tables with your own test data using the 
supplied T2-cb-insert.sql file script file, and SQL commands which will  
insert as a minimum, the following sample data -
 - 12 animals, some of which must have been captured from the wild, i.e. 
      are not the offspring from a breeding event, and
- 4 breeding events
Your inserted rows must meet the assignment specification requirements
*/
--PLEASE PLACE REQUIRED SQL STATEMENT(S) BELOW

-- Inserting values into ANIMALS (Wild caught)
INSERT INTO animal VALUES (
    7,
    'F',
    NULL,
    'SAF30',
    'Hippopotamus',
    'amphibius'
);

INSERT INTO animal VALUES (
    2,
    'M',
    NULL,
    'SAF30',
    'Hippopotamus',
    'amphibius'
);

INSERT INTO animal VALUES (
    6,
    'F',
    NULL,
    'AUS40',
    'Myrmecobius',
    'fasciatus'
);

INSERT INTO animal VALUES (
    1,
    'M',
    NULL,
    'AUS10',
    'Myrmecobius',
    'fasciatus'
);

INSERT INTO animal VALUES (
    5,
    'M',
    NULL,
    'AUS30',
    'Equus',
    'zebra'
);

INSERT INTO animal VALUES (
    8,
    'F',
    NULL,
    'AUS30',
    'Equus',
    'zebra'
);

INSERT INTO animal VALUES (
    4,
    'F',
    NULL,
    'SAF20',
    'Panthera',
    'leo'
);

INSERT INTO animal VALUES (
    3,
    'M',
    NULL,
    'SAF20',
    'Panthera',
    'leo'
);

COMMIT;

-- Inserting values into Breeding Event
INSERT INTO breeding_event VALUES (
    01,
    to_date('16-Jan-2020', 'dd-Mon-yyyy'),
    8,
    5
);

INSERT INTO breeding_event VALUES (
    02,
    to_date('22-Jul-2020', 'dd-Mon-yyyy'),
    7,
    2
);

INSERT INTO breeding_event VALUES (
    03,
    to_date('22-Aug-2020', 'dd-Mon-yyyy'),
    8,
    5
);

INSERT INTO breeding_event VALUES (
    04,
    to_date('27-Jan-2021', 'dd-Mon-yyyy'),
    4,
    3
);

COMMIT;

-- Inserting values into ANIMALS (Offsprings)
INSERT INTO animal VALUES (
    9,
    'F',
    1,
    'AUS30',
    'Equus',
    'zebra'
);

INSERT INTO animal VALUES (
    11,
    'M',
    1,
    'AUS30',
    'Equus',
    'zebra'
);

INSERT INTO animal VALUES (
    12,
    'F',
    2,
    'SAF30',
    'Hippopotamus',
    'amphibius'
);

INSERT INTO animal VALUES (
    10,
    'F',
    4,
    'SAF20',
    'Panthera',
    'leo'
);

COMMIT;


--select * from animal ;
--select * from breeding_event;