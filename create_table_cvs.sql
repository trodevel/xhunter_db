USE xhunter;

CREATE TABLE cvs(
id int (11) UNSIGNED NOT NULL UNIQUE,
hash varchar(255) NOT NULL,
recv_ts TIMESTAMP NULL DEFAULT NULL,
modified_ts TIMESTAMP NULL DEFAULT NULL,
subject varchar(255) NOT NULL,
experience int (11) UNSIGNED DEFAULT 0,
PRIMARY KEY (id)
);
