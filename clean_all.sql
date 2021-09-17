USE xhunter;

SET autocommit = OFF;

START TRANSACTION;

TRUNCATE cvs;
TRUNCATE cvs_temp;
TRUNCATE map_keyword_to_cv;
TRUNCATE search_queries;

COMMIT;
