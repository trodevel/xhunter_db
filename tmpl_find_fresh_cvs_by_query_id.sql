USE xhunter;

SET autocommit = OFF;

START TRANSACTION;

SELECT DISTINCT( c.id ), hash, subject, experience, modified_ts, age_mm
FROM map_keyword_to_cv AS m
JOIN
(
    SELECT id, hash, subject, experience, modified_ts, TIMESTAMPDIFF( MINUTE, modified_ts, NOW() ) AS age_mm
    FROM cvs
) AS c
ON m.id = c.id
WHERE m.keyword = '%KEYWORD%'
AND
    age_mm <= '%AGE_MM%';

COMMIT;
