USE xhunter;

CREATE TABLE cvs_temp(
id int (11) UNSIGNED NOT NULL UNIQUE,
hash varchar(255) NOT NULL,
recv_ts TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
modified_ts DATETIME(3),
subject varchar(255) CHARACTER SET utf8 NOT NULL,
experience int (11) UNSIGNED DEFAULT 0,
PRIMARY KEY (id)
);
