USE xhunter;

SELECT
    id
FROM
    users
WHERE
    id NOT IN
    (
    SELECT DISTINCT
        chat_id
    FROM
        map_chat_id_to_query_id
    )
ORDER BY
    id;
