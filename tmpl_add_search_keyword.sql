USE xhunter;
<<<<<<< HEAD

SET autocommit = OFF;

START TRANSACTION;

insert IGNORE into search_keywords ( keyword, experience_from, experience_to )
values ( '%KEYWORD%', '%EXPERIENCE_FROM%', '%EXPERIENCE_TO%' );

SET @query_id =
(
    SELECT id
    FROM search_keywords
    WHERE
        keyword = '%KEYWORD%'
    AND
        experience_from = '%EXPERIENCE_FROM%'
    AND
        experience_to = '%EXPERIENCE_TO%'
);

insert IGNORE into map_chat_id_to_query_id ( chat_id, query_id )
values ( '%CHAT_ID%', @query_id );

SELECT '%CHAT_ID%', @query_id;

COMMIT;
=======
insert IGNORE into search_keywords ( chat_id, keyword, experience_from, experience_to )
values ( '%CHAT_ID%', '%KEYWORD%', '%EXPERIENCE_FROM%', '%EXPERIENCE_TO%' );
>>>>>>> 1ced42035a554f580df281f37ee86aba0ce62ece
