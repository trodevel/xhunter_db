USE xhunter;

ALTER TABLE search_keywords
DROP PRIMARY KEY;

ALTER TABLE search_keywords
ADD COLUMN id INT AUTO_INCREMENT PRIMARY KEY FIRST;

ALTER TABLE search_keywords
ADD COLUMN experience_from int (3) UNSIGNED NOT NULL DEFAULT 0;

ALTER TABLE search_keywords
ADD COLUMN experience_to int (3) UNSIGNED NOT NULL DEFAULT 999;

ALTER TABLE search_keywords
ADD UNIQUE KEY uniq_rec( chat_id, keyword, experience_from, experience_to );
