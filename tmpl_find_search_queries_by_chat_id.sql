USE xhunter;

SELECT
    keyword,
    experience_from,
    experience_to
FROM
    search_queries
WHERE
    chat_id = '%CHAT_ID%';
