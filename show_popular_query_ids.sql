USE xhunter;

SELECT query_id, COUNT( chat_id ) AS NUM
FROM map_chat_id_to_query_id
GROUP BY query_id
ORDER BY NUM DESC, query_id ASC;
