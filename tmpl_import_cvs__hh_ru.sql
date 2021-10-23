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

SOURCE incl_import_from_temp.sql

COMMIT;
