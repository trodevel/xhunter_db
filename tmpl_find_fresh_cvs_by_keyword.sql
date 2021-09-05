USE xhunter;

SELECT c.id, hash, subject, experience, modified_ts, age_mm
FROM map_keyword_to_cv AS m
JOIN
(
    SELECT id, hash, subject, experience, modified_ts, TIMESTAMPDIFF( MINUTE, modified_ts, NOW() ) AS age_mm
    FROM cvs
) AS c
ON m.id = c.id
WHERE m.keyword = '%KEYWORD%'
AND
    age_mm <= 30;