USE xhunter;

SELECT
    m.query_id,
    keyword,
    experience_from,
    experience_to
FROM
    search_queries q
JOIN
    map_chat_id_to_query_id m
ON
    m.query_id = q.id
WHERE
    chat_id = '%CHAT_ID%';
