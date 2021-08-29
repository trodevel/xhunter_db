USE xhunter;

CREATE TABLE search_keywords(
chat_id int (11) UNSIGNED NOT NULL,
keyword varchar(255) NOT NULL UNIQUE
);
