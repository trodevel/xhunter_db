USE xhunter;

SET autocommit = OFF;

START TRANSACTION;

TRUNCATE cvs_temp;

SET @KEYWORD = '%KEYWORD%';

LOAD DATA LOCAL INFILE
'%FILENAME%'
INTO TABLE cvs_temp
CHARACTER SET UTF8
FIELDS TERMINATED BY ';'
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
( @dummy, foreign_id, @epoch, experience, subject )
set modified_ts = FROM_UNIXTIME( @epoch / 1000 ), source_id = 1;

SELECT 'DEBUG:', id, source_id, foreign_id, recv_ts, modified_ts, subject, experience FROM cvs_temp;

SELECT COUNT(*) FROM cvs_temp t1
WHERE NOT EXISTS
(
      SELECT 1
      FROM cvs t2 WHERE
      t2.foreign_id = t1.foreign_id
      AND
      t2.source_id = t1.source_id
);

SELECT 'DEBUG: current size of tmp table:', COUNT(*) FROM cvs_temp t1;

SELECT 'DEBUG: existing records:', COUNT(*)
FROM cvs_temp t2
JOIN cvs t1
ON
    t2.foreign_id = t1.foreign_id
    AND
    t2.source_id = t1.source_id;

        SELECT 'DEBUG: id', t2.id
        FROM cvs_temp t2
        JOIN cvs t1
        ON
            t2.foreign_id = t1.foreign_id
            AND
            t2.source_id = t1.source_id;

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
SELECT 'DEBUG: new size of tmp table', COUNT(*) FROM cvs_temp t1;

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

COMMIT;
