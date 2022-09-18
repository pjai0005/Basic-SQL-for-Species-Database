--****PLEASE ENTER YOUR DETAILS BELOW****
--T2-cb-dm.sql

--Student ID: 32192673
--Student Name: Prachi Jaiswal
--Tutorial No: 23

/* Comments for your marker:



*/

/*
Task 2 (c):

Complete the listed DML actions
*/
--PLEASE PLACE REQUIRED SQL STATEMENT(S) BELOW

-- (i) 

DROP SEQUENCE animal_seq;

DROP SEQUENCE breeding_event_seq;

CREATE SEQUENCE animal_seq START WITH 500 INCREMENT BY 1;

CREATE SEQUENCE breeding_event_seq START WITH 500 INCREMENT BY 1;

COMMIT;

-- (ii)

UPDATE animal
SET
    centre_id = (
        SELECT
            centre_id
        FROM
            centre
        WHERE
            centre_name = 'Kruger National Park'
    )
WHERE
    centre_id = (
        SELECT
            centre_id
        FROM
            centre
        WHERE
            centre_name = 'SanWild Wildlife Sanctuary'
    );

DELETE FROM centre
WHERE
    centre_name = 'SanWild Wildlife Sanctuary';

COMMIT;

-- select * from animal;


-- (iii) 

INSERT INTO animal VALUES (
    animal_seq.NEXTVAL,
    'F',
    (
        SELECT
            brevent_id
        FROM
        breeding_event
        WHERE
            to_char ( brevent_date, 'dd-Mon-yyyy') = '10-Feb-2021'
    ),
    (
        SELECT
            centre_id
        FROM
            centre
        WHERE
            centre_name = 'Australia Zoo'
    ),
    (
        SELECT
            spec_genus
        FROM
            species
        WHERE
            spec_popular_name = 'Tasmanian Devil'
    ),
    (
        SELECT
            spec_name
        FROM
            species
        WHERE
            spec_popular_name = 'Tasmanian Devil'
    )
);

INSERT INTO animal VALUES (
    animal_seq.NEXTVAL,
    'M',
    (
        SELECT
            brevent_id
        FROM
        breeding_event
        WHERE
            to_char ( brevent_date, 'dd-Mon-yyyy') = '10-Feb-2021'
    ),
    (
        SELECT
            centre_id
        FROM
            centre
        WHERE
            centre_name = 'Werribee Open Range Zoo'
    ),
    (
        SELECT
            spec_genus
        FROM
            species
        WHERE
            spec_popular_name = 'Tasmanian Devil'
    ),
    (
        SELECT
            spec_name
        FROM
            species
        WHERE
            spec_popular_name = 'Tasmanian Devil'
    )
);

COMMIT;

--select * from animal;


-- (iv)

INSERT INTO breeding_event VALUES (
    breeding_event_seq.NEXTVAL,
    to_date('10-Feb-2021','dd-Mon-yyyy'),
    (
        SELECT
            animal_id
        FROM
            animal
        WHERE
                animal_sex = 'F'
            AND brevent_id IS NULL
            AND spec_genus = (
                SELECT
                    spec_genus
                FROM
                    species
                WHERE
                    spec_popular_name = 'Tasmanian Devil'
            )
    ),
    (
        SELECT
            animal_id
        FROM
            animal
        WHERE
                animal_sex = 'M'
            AND brevent_id IS NULL
            AND spec_genus = (
                SELECT
                    spec_genus
                FROM
                    species
                WHERE
                    spec_popular_name = 'Tasmanian Devil'
            )
    )
);

INSERT INTO animal VALUES (
    animal_seq.NEXTVAL,
    'F',
    (
        SELECT
            brevent_id
        FROM
            breeding_event
        WHERE
                to_char( brevent_date, 'dd-Mon-yyyy') = '10-Feb-2021'
            AND mother_id = (
                SELECT
                    animal_id
                FROM
                    animal
                WHERE
                        animal_sex = 'F'
                    AND spec_genus = (
                        SELECT
                            spec_genus
                        FROM
                            species
                        WHERE
                                spec_popular_name = 'Tasmanian Devil'
                            AND brevent_id IS NULL
                    )
            )
            AND father_id = (
                SELECT
                    animal_id
                FROM
                    animal
                WHERE
                        animal_sex = 'M'
                    AND spec_genus = (
                        SELECT
                            spec_genus
                        FROM
                            species
                        WHERE
                                spec_popular_name = 'Tasmanian Devil'
                            AND brevent_id IS NULL
                    )
            )
    ),
    (
        SELECT
            centre_id
        FROM
            centre
        WHERE
            centre_name = 'Australia Zoo'
    ),
    (
        SELECT
            spec_genus
        FROM
            species
        WHERE
            spec_popular_name = 'Tasmanian Devil'
    ),
    (
        SELECT
            spec_name
        FROM
            species
        WHERE
            spec_popular_name = 'Tasmanian Devil'
    )
);

INSERT INTO animal VALUES (
    animal_seq.NEXTVAL,
    'M',
    (
        SELECT
            brevent_id
        FROM
            breeding_event
        WHERE
               to_char( brevent_date, 'dd-Mon-yyyy') = '10-Feb-2021'
            AND mother_id = (
                SELECT
                    animal_id
                FROM
                    animal
                WHERE
                        animal_sex = 'F'
                    AND spec_genus = (
                        SELECT
                            spec_genus
                        FROM
                            species
                        WHERE
                                spec_popular_name = 'Tasmanian Devil'
                            AND brevent_id IS NULL
                    )
            )
            AND father_id = (
                SELECT
                    animal_id
                FROM
                    animal
                WHERE
                        animal_sex = 'M'
                    AND spec_genus = (
                        SELECT
                            spec_genus
                        FROM
                            species
                        WHERE
                                spec_popular_name = 'Tasmanian Devil'
                            AND brevent_id IS NULL
                    )
            )
    ),
    (
        SELECT
            centre_id
        FROM
            centre
        WHERE
            centre_name = 'Australia Zoo'
    ),
    (
        SELECT
            spec_genus
        FROM
            species
        WHERE
            spec_popular_name = 'Tasmanian Devil'
    ),
    (
        SELECT
            spec_name
        FROM
            species
        WHERE
            spec_popular_name = 'Tasmanian Devil'
    )
);

COMMIT;

--select * from breeding_event;
--select * from animal;