#!/bin/bash

#<hb>#############################################################################
#
# add_search_keyword.sh CHAT_ID KEYWORD
#
# Example: ./add_search_keyword.sh 12345 react
#
#<he>#############################################################################

print_help()
{
sed -e '1,/^#<hb>/d' -e '/^#<he>/,$d' $0 | cut -b3-    #"
}


CHAT_ID=$1
KEYWORD=$2

[[ -z "$CHAT_ID" ]] && echo "ERROR: need CHAT_ID" && print_help && exit 1
[[ -z "$KEYWORD" ]] && echo "ERROR: need KEYWORD" && print_help && exit 1

query=$( cat tmpl_add_search_keyword.sql | sed "s/%CHAT_ID%/$CHAT_ID/g" | sed "s/%KEYWORD%/$KEYWORD/g" )

echo $query | ./exec_query.sh
