USE xhunter;

SELECT
    chat_id
FROM
    search_queries
WHERE
    keyword = '%KEYWORD%';
