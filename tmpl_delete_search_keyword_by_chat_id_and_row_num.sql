USE xhunter;

SET @row_number = 0;

SELECT *
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
;