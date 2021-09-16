USE xhunter;

CREATE TABLE IF NOT EXISTS search_keywords(
id INT AUTO_INCREMENT PRIMARY KEY,
keyword varchar(255) CHARACTER SET utf8 NOT NULL,
experience_from int (3) UNSIGNED NOT NULL DEFAULT 0,
experience_to int (3) UNSIGNED NOT NULL DEFAULT 99,
UNIQUE KEY uniq_rec ( keyword, experience_from, experience_to )
);
