USE xhunter;

SET @row_number = 0;

SET @keyword = (

SELECT keyword
FROM
    (
    SELECT
        (@row_number:=@row_number + 1) AS num,
        keyword
    FROM
        search_queries
    WHERE
        chat_id = '%CHAT_ID%'
    ) AS with_num
WHERE
        num = '%ROW_NUM%'
);

SELECT IF( @keyword IS NULL, 0, 1), '%ROW_NUM%', IF( @keyword IS NULL, '', @keyword );

DELETE
FROM
    search_queries
WHERE
    chat_id = '%CHAT_ID%'
    AND
    keyword = @keyword
    AND
    @keyword IS NOT NULL;
