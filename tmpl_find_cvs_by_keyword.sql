USE xhunter;

SELECT c.id, hash, subject, experience, modified_ts FROM map_keyword_to_cv AS m
JOIN cvs AS c
ON m.id = c.id
WHERE m.keyword = '%KEYWORD%';
