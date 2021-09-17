USE xhunter;

SET @row_number = 0;

SET @query_id = (

SELECT query_id
FROM
    (
    SELECT
    (@row_number:=@row_number + 1) AS num,
        m.query_id
    FROM
        search_queries q
    JOIN
        map_chat_id_to_query_id m
    ON
        m.query_id = q.id
    WHERE
        chat_id = '%CHAT_ID%'
    ) AS with_num
WHERE
        num = '%ROW_NUM%'
);

SET @keyword = (
SELECT
    keyword
FROM
    search_queries
WHERE
    id = @query_id
    AND
    @query_id IS NOT NULL
);

SELECT IF( @query_id IS NULL, 0, 1), '%ROW_NUM%', IF( @keyword IS NULL, '', @keyword );

DELETE
FROM
    search_queries
WHERE
    query_id = @query_id
    AND
    @query_id IS NOT NULL;
