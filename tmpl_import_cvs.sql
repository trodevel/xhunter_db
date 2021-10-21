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
( id, source_key, @epoch, experience, subject )
set modified_ts = FROM_UNIXTIME( @epoch / 1000 );

INSERT INTO cvs SELECT * FROM cvs_temp t1
WHERE NOT EXISTS
(
      SELECT 1
      FROM cvs t2 WHERE
      t2.id = t1.id
);

INSERT INTO map_keyword_to_cv ( keyword, id ) SELECT '%KEYWORD%', id FROM cvs_temp;

COMMIT;
