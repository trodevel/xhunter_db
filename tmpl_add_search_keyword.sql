USE xhunter;
insert IGNORE into search_keywords ( chat_id, keyword, experience_from, experience_to )
values ( '%CHAT_ID%', '%KEYWORD%', '%EXPERIENCE_FROM%', '%EXPERIENCE_TO%' );
