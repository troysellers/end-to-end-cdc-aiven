
BEGIN;

CREATE EXTENSION aiven_extras CASCADE;

SELECT * FROM aiven_extras.pg_create_publication_for_all_tables('debezium_publication', 'INSERT,UPDATE,DELETE');


COMMIT;
