USE xhunter;

SELECT
    chat_id
FROM
    map_chat_id_to_query_id
WHERE
    query_id = '%QUERY_ID%';
