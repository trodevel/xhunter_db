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
        search_keywords
    WHERE
        chat_id = '%CHAT_ID%'
    ) AS with_num
WHERE
        num = '%ROW_NUM%'
);

SELECT @keyword;

SELECT IF( @keyword IS NULL, "it is null", "OK");

#DELETE
#FROM
#    search_keyword
