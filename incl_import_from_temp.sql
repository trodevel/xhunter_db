# should be included from tmpl_import_cvs_....sql

# DEBUG
#SELECT 'DEBUG:', id, source_id, foreign_id, recv_ts, modified_ts, subject, experience FROM cvs_temp;

SET @num_cvs =
(
    SELECT COUNT(*)
    FROM cvs_temp
);

SET @new_cvs =
(
    SELECT COUNT(*) FROM cvs_temp t1
    WHERE NOT EXISTS
    (
        SELECT 1
        FROM cvs t2 WHERE
        t2.foreign_id = t1.foreign_id
        AND
        t2.source_id = t1.source_id
    )
);

# DEBUG
#SELECT 'DEBUG: current size of tmp table:', COUNT(*) FROM cvs_temp t1;

# DEBUG
#SELECT 'DEBUG: existing records:', COUNT(*)
#FROM cvs_temp t2
#JOIN cvs t1
#ON
#    t2.foreign_id = t1.foreign_id
#    AND
#    t2.source_id = t1.source_id;

# DEBUG
#SELECT 'DEBUG: id', t2.id
#FROM cvs_temp t2
#JOIN cvs t1
#ON
#    t2.foreign_id = t1.foreign_id
#    AND
#    t2.source_id = t1.source_id;

SET @existing_cvs =
(
    SELECT COUNT(*)
    FROM
    (
        SELECT t2.id
        FROM cvs_temp t2
        JOIN cvs t1
        ON
            t2.foreign_id = t1.foreign_id
            AND
            t2.source_id = t1.source_id
    ) AS p
);

SET @existing_mappings =
(
    SELECT COUNT(*)
    FROM
    (
        SELECT t1.id
        FROM cvs_temp t2
        JOIN cvs t1
        ON
            t2.foreign_id = t1.foreign_id
            AND
            t2.source_id = t1.source_id
    ) AS p
    JOIN map_keyword_to_cv m
    ON
        p.id = m.id
        AND
        @KEYWORD = m.keyword
);

SET @new_mappings =
(
#   SELECT keyword, id
    SELECT COUNT(*)
    FROM
    (
        SELECT @KEYWORD keyword, p.id
        FROM
        (
            SELECT t1.id
            FROM cvs_temp t2
            JOIN cvs t1
            ON
                t2.foreign_id = t1.foreign_id
                AND
                t2.source_id = t1.source_id
        ) AS p
    ) AS em
    WHERE ( keyword, id )
        NOT IN
        (
        SELECT keyword, id
        FROM map_keyword_to_cv
        WHERE
            keyword = @KEYWORD
        )
);

SELECT @num_cvs, @existing_cvs, @new_cvs, @existing_mappings, @new_mappings;

# update keyword-to-cv mapping for existing CVs
INSERT INTO map_keyword_to_cv ( keyword, id )
SELECT keyword, id
FROM
(
    SELECT keyword, id
    FROM
    (
        SELECT @KEYWORD keyword, p.id
        FROM
        (
            SELECT t1.id
            FROM cvs_temp t2
            JOIN cvs t1
            ON
                t2.foreign_id = t1.foreign_id
                AND
                t2.source_id = t1.source_id
        ) AS p
    ) AS em
    WHERE ( keyword, id )
        NOT IN
        (
        SELECT keyword, id
        FROM map_keyword_to_cv
        WHERE
            keyword = @KEYWORD
        )
) AS nm;

# delete records from the temp table which already present in the main table
DELETE FROM cvs_temp
WHERE id
IN
(
    SELECT *
    FROM
    (
        SELECT t2.id
        FROM cvs_temp t2
        JOIN cvs t1
        ON
            t2.foreign_id = t1.foreign_id
            AND
            t2.source_id = t1.source_id
    ) AS p
);

# DEBUG
#SELECT 'DEBUG: new size of tmp table', COUNT(*) FROM cvs_temp t1;

INSERT INTO cvs SELECT NULL, source_id, foreign_id, recv_ts, modified_ts, subject, experience FROM cvs_temp t1;

INSERT INTO map_keyword_to_cv ( keyword, id )
SELECT @KEYWORD, id
FROM
(
    SELECT t1.id
    FROM cvs_temp t2
    JOIN cvs t1
    ON
        t2.foreign_id = t1.foreign_id
        AND
        t2.source_id = t1.source_id
) AS p;
