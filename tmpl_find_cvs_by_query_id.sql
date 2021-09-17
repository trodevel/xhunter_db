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
    experience_from
FROM
    search_queries
WHERE
    id = '%QUERY_ID%'
);

SET @p3=(

SELECT
    experience_from
FROM
    search_queries
WHERE
    id = '%QUERY_ID%'
);

SELECT DISTINCT ( c.id ), hash, subject, experience, modified_ts
FROM
    map_keyword_to_cv AS m
JOIN
    cvs AS c
ON
    m.id = c.id
WHERE
    m.keyword = @keyword
    AND
    @keyword IS NOT NULL;

COMMIT;
