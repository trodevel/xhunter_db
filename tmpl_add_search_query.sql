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
    @query_id IS NOT NULL;

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

insert IGNORE into map_chat_id_to_query_id ( chat_id, query_id )
values ( '%CHAT_ID%', @query_id );

SELECT '%CHAT_ID%', @query_id;

COMMIT;
