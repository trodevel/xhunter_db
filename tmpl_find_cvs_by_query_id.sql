USE xhunter;

SET autocommit = OFF;

START TRANSACTION;

SET @keyword=(

SELECT
    keyword
FROM
    search_queries
WHERE
    id = '%QUERY_ID%'
);

SET @p2=(

SELECT
    experience_from * 12
FROM
    search_queries
WHERE
    id = '%QUERY_ID%'
);

SET @p3=(

SELECT
    experience_to * 12
FROM
    search_queries
WHERE
    id = '%QUERY_ID%'
);

SELECT DISTINCT ( c.id ), source_id, foreign_id, subject, experience, modified_ts, last_position, last_company, last_experience
FROM
    map_keyword_to_cv AS m
JOIN
    cvs AS c
ON
    m.id = c.id
WHERE
    m.keyword = @keyword AND @keyword IS NOT NULL
    AND
    c.experience >= @p2 AND @p2 IS NOT NULL
    AND
    c.experience <= @p3 AND @p3 IS NOT NULL
;

COMMIT;
