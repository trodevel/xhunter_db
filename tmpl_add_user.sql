USE xhunter;
insert IGNORE into users
    ( id, username, firstname, lastname, is_bot, language_code )
values
    ( '%ID%', '%USERNAME%', '%FIRSTNAME%', '%LASTNAME%', '%IS_BOT%', '%LANGUAGE_CODE%' );
