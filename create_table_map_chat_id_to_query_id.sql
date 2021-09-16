USE xhunter;

CREATE TABLE IF NOT EXISTS map_chat_id_to_query_id(
    chat_id int (12) UNSIGNED NOT NULL,
    query_id int UNSIGNED NOT NULL,
    PRIMARY KEY ( chat_id, query_id )
);
