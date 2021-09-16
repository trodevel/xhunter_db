USE xhunter;

CREATE TABLE search_keywords(
chat_id int (12) UNSIGNED NOT NULL,
keyword varchar(255) CHARACTER SET utf8 NOT NULL,
experience_from int (3) UNSIGNED NOT NULL,
experience_to int (3) UNSIGNED NOT NULL,
PRIMARY KEY ( chat_id, keyword, experience_from, experience_to )
);
