USE xhunter;

LOAD DATA LOCAL INFILE
'cvs_java.csv'
INTO TABLE cvs
CHARACTER SET UTF8
FIELDS TERMINATED BY ';'
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
( id, hash, modified_ts, experience, subject );
