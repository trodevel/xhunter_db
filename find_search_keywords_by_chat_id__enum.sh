#!/bin/bash

#<hb>#############################################################################
#
# find_search_keywords_by_chat_id.sh CHAT_ID
#
# Example: ./find_search_keywords_by_chat_id.sh 12345
#
#<he>#############################################################################

print_help()
{
sed -e '1,/^#<hb>/d' -e '/^#<he>/,$d' $0 | cut -b3-    #"
}

CHAT_ID=$1

[[ -z "$CHAT_ID" ]] && echo "ERROR: need CHAT_ID" && print_help && exit 1

query=$( cat tmpl_find_search_keywords_by_chat_id__enum.sql | sed "s/%CHAT_ID%/$CHAT_ID/g" )

echo "$query" | ./exec_query.sh
