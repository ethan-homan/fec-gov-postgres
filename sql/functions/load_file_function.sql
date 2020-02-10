
CREATE OR REPLACE FUNCTION load_file(file_prefix TEXT, file_year TEXT, file_name TEXT, table_name TEXT)
  RETURNS void AS
    $func$
     DECLARE
        file TEXT = file_prefix || file_year || '/' || file_name;
        temp_table_name TEXT = table_name || '_temp';
     BEGIN
        EXECUTE $$ CREATE TABLE $$ || temp_table_name || $$ AS SELECT * FROM $$ || table_name || $$ WITH NO DATA $$;
        EXECUTE $$ ALTER TABLE $$ || temp_table_name || $$ DROP COLUMN file_year $$;
        EXECUTE $$ COPY $$ || temp_table_name || $$ FROM $$ || quote_literal(file) || $$ (FORMAT CSV, DELIMITER('|'), HEADER FALSE, QUOTE E'\b')$$;
        EXECUTE $$
            INSERT INTO $$ || table_name || $$ (
                SELECT DISTINCT ON ($$ || temp_table_name ||$$.*) *, $$
                || quote_literal(file_year) || $$ AS file_year FROM $$ || temp_table_name || $$ )
                ON CONFLICT DO NOTHING $$;
        EXECUTE $$ DROP TABLE $$ || temp_table_name;
     END
    $func$ LANGUAGE plpgsql;
