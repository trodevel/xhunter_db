USE xhunter;

SET autocommit = OFF;

START TRANSACTION;

SET @num_queries =
(
    SELECT DISTINCT
        COUNT( id )
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
);

SELECT @num_queries;

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

DELETE FROM
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

COMMIT;
