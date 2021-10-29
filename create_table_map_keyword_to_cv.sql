USE xhunter;

CREATE TABLE IF NOT EXISTS map_keyword_to_cv(
keyword varchar(255) CHARACTER SET utf8 NOT NULL,
id int (11) UNSIGNED NOT NULL,
UNIQUE KEY uniq_rec ( keyword, id )
);
