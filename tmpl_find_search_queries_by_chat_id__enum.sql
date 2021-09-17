USE xhunter;

SET @row_number = 0;

SELECT
    (@row_number:=@row_number + 1) AS num,
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
