USE xhunter;

SET autocommit = OFF;

START TRANSACTION;

CREATE TABLE cvs_temp(
id int (11) UNSIGNED NOT NULL UNIQUE,
hash varchar(255) NOT NULL,
recv_ts TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
modified_ts DATETIME(3),
subject varchar(255) CHARACTER SET utf8 NOT NULL,
experience int (11) UNSIGNED DEFAULT 0,
PRIMARY KEY (id)
);

LOAD DATA LOCAL INFILE
'%FILENAME%'
INTO TABLE cvs_temp
CHARACTER SET UTF8
FIELDS TERMINATED BY ';'
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
( id, hash, @epoch, experience, subject )
set modified_ts = FROM_UNIXTIME( @epoch / 1000 );

INSERT INTO cvs SELECT * FROM cvs_temp;

DROP TABLE cvs_temp;

COMMIT;
