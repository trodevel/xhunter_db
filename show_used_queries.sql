USE xhunter;

SELECT DISTINCT
    m.query_id, q.keyword, q.experience_from, q.experience_to
FROM
    map_chat_id_to_query_id m
JOIN
    search_queries q
ON
    m.query_id = q.id
ORDER BY
    m.query_id;
