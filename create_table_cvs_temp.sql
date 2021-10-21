USE xhunter;

CREATE TABLE IF NOT EXISTS cvs_temp(
source_id INT NOT NULL,
foreign_id varchar(255) NOT NULL,
recv_ts TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
modified_ts DATETIME(3),
subject varchar(255) CHARACTER SET utf8 NOT NULL,
experience int (11) UNSIGNED DEFAULT 0,
UNIQUE KEY uniq_rec ( source_id, foreign_id )
);
