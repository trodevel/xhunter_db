USE xhunter;

SET autocommit = OFF;

START TRANSACTION;

TRUNCATE cvs;
TRUNCATE cvs_temp;
TRUNCATE map_keyword_to_cv;
TRUNCATE search_queries;
TRUNCATE map_chat_id_to_query_id;

COMMIT;
