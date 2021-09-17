#!/bin/bash

#<hb>#############################################################################
#
# find_chat_ids_by_query_id.sh QUERY_ID
#
# Example: ./find_chat_ids_by_query_id.sh 12345
#
#<he>#############################################################################

print_help()
{
sed -e '1,/^#<hb>/d' -e '/^#<he>/,$d' $0 | cut -b3-    #"
}

QUERY_ID=$1

[[ -z "$QUERY_ID" ]] && echo "ERROR: need QUERY_ID" && print_help && exit 1

query=$( cat tmpl_find_chat_ids_by_query_id.sql | sed "s/%QUERY_ID%/$QUERY_ID/g" )

echo "$query" | ./exec_query.sh
