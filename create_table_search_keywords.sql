USE xhunter;

CREATE TABLE search_keywords(
id INT AUTO_INCREMENT PRIMARY KEY,
chat_id int (12) UNSIGNED NOT NULL,
keyword varchar(255) CHARACTER SET utf8 NOT NULL,
experience_from int (3) UNSIGNED NOT NULL DEFAULT 0,
experience_to int (3) UNSIGNED NOT NULL DEFAULT 99,
UNIQUE KEY uniq_rec ( chat_id, keyword, experience_from, experience_to )
);
