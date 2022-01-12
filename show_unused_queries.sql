USE xhunter;

SELECT
    *
FROM
    search_queries
WHERE
    id NOT IN
    (
    SELECT DISTINCT
        query_id
    FROM
        map_chat_id_to_query_id
    ORDER BY
        query_id
    )
ORDER BY
    id;
