USE xhunter;

LOAD DATA LOCAL INFILE
'x2.csv'
INTO TABLE cvs
CHARACTER SET UTF8
FIELDS TERMINATED BY ';'
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
( id, source_key, @epoch, experience, subject )
set modified_ts = FROM_UNIXTIME( @epoch / 1000 );
