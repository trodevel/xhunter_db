USE xhunter;

SET @row_number = 0;

SELECT
    (@row_number:=@row_number + 1) AS num,
    keyword,
    experience_from,
    experience_to
FROM
    search_queries
WHERE
    chat_id = '%CHAT_ID%';
