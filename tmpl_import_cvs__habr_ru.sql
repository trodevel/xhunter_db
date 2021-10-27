USE xhunter;

SET autocommit = OFF;

START TRANSACTION;

TRUNCATE cvs_temp;

SET @KEYWORD = '%KEYWORD%';

SET time_zone = '+00:00';

LOAD DATA LOCAL INFILE
'%FILENAME%'
INTO TABLE cvs_temp
CHARACTER SET UTF8
FIELDS TERMINATED BY ';'
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
( foreign_id, @dummy, @epoch, subject, @dummy2, @dummy3, @dummy4, @dummy5, experience )
set modified_ts = FROM_UNIXTIME( @epoch ), source_id = 2;

SOURCE incl_import_from_temp.sql

COMMIT;
