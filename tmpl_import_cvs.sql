USE xhunter;

SET autocommit = OFF;

START TRANSACTION;

TRUNCATE cvs_temp;

LOAD DATA LOCAL INFILE
'%FILENAME%'
INTO TABLE cvs_temp
CHARACTER SET UTF8
FIELDS TERMINATED BY ';'
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
( foreign_id, @epoch, experience, subject )
set modified_ts = FROM_UNIXTIME( @epoch / 1000 ), source_id = 1;

SELECT COUNT(*) FROM cvs_temp t1
WHERE NOT EXISTS
(
      SELECT 1
      FROM cvs t2 WHERE
      t2.foreign_id = t1.foreign_id
      AND
      t2.source_id = t1.source_id
);

INSERT INTO cvs SELECT NULL, source_id, foreign_id, recv_ts, modified_ts, subject, experience FROM cvs_temp t1
WHERE NOT EXISTS
(
      SELECT 1
      FROM cvs t2 WHERE
      t2.foreign_id = t1.foreign_id
      AND
      t2.source_id = t1.source_id
);

#INSERT INTO map_keyword_to_cv ( keyword, id ) SELECT '%KEYWORD%', id FROM cvs_temp;

COMMIT;
