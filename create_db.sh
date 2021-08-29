#!/bin/bash

echo "Creating new DB"

scripts="create_db.sql \
create_table_cvs.sql \
create_table_map_keyword_to_cv.sql \
create_table_search_keywords.sql \
"

for s in $scripts
do
    echo "processing $s"
    cat $s | ./exec_query.sh
done
