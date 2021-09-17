USE xhunter;

SET autocommit = OFF;

START TRANSACTION;

SET @query_id =
(
    SELECT id
    FROM search_queries
    WHERE
        keyword = '%KEYWORD%'
    AND
        experience_from = '%EXPERIENCE_FROM%'
    AND
        experience_to = '%EXPERIENCE_TO%'
);

insert into search_queries ( keyword, experience_from, experience_to )
SELECT
     '%KEYWORD%', '%EXPERIENCE_FROM%', '%EXPERIENCE_TO%'
FROM
    DUAL
WHERE
    @query_id IS NULL;

SET @new_query_id =
(
    SELECT id
    FROM search_queries
    WHERE
        keyword = '%KEYWORD%'
    AND
        experience_from = '%EXPERIENCE_FROM%'
    AND
        experience_to = '%EXPERIENCE_TO%'
);

SET @num_mappings =
(
SELECT
    COUNT(*)
FROM
    map_chat_id_to_query_id
WHERE
    chat_id = '%CHAT_ID%'
    AND
    query_id = @new_query_id
);

insert into map_chat_id_to_query_id ( chat_id, query_id )
SELECT
    '%CHAT_ID%', @new_query_id
FROM
    DUAL
WHERE
    @num_mappings = 0;

SELECT '%CHAT_ID%', @new_query_id;

COMMIT;
