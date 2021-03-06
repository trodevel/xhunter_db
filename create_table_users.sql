USE xhunter;

CREATE TABLE IF NOT EXISTS users(
id int (12) UNSIGNED NOT NULL UNIQUE,
username varchar(255) NOT NULL,
firstname varchar(255) CHARACTER SET utf8,
lastname varchar(255) CHARACTER SET utf8,
is_bot TINYINT NOT NULL,
language_code varchar(255),
creation_ts TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
PRIMARY KEY (id)
);
