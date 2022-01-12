USE xhunter;

SELECT chat_id, COUNT( query_id ) AS NUM
FROM map_chat_id_to_query_id
GROUP BY chat_id
ORDER BY NUM DESC, chat_id ASC;
