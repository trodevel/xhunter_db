#!/bin/bash

#<hb>#############################################################################
#
# delete_search_query_by_chat_id_and_row_num.sh CHAT_ID ROW_NUM
#
# Example: ./delete_search_query_by_chat_id_and_row_num.sh 12345 3
#
#<he>#############################################################################

print_help()
{
sed -e '1,/^#<hb>/d' -e '/^#<he>/,$d' $0 | cut -b3-    #"
}

CHAT_ID=$1
ROW_NUM=$2

[[ -z "$CHAT_ID" ]] && echo "ERROR: need CHAT_ID" && print_help && exit 1
[[ -z "$ROW_NUM" ]] && echo "ERROR: need ROW_NUM" && print_help && exit 1

query=$( cat tmpl_delete_search_query_by_chat_id_and_row_num.sql | sed "s/%CHAT_ID%/$CHAT_ID/g" | sed "s/%ROW_NUM%/$ROW_NUM/g" )

echo "$query" | ./exec_query.sh
