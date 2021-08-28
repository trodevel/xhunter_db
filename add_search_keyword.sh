#!/bin/bash

#<hb>#############################################################################
#
# add_search_keyword.sh KEYWORD
#
# Example: ./add_search_keyword.sh react
#
#<he>#############################################################################

print_help()
{
sed -e '1,/^#<hb>/d' -e '/^#<he>/,$d' $0 | cut -b3-    #"
}


KEYWORD=$1
PASSW=$2
SALUT=$3
NAME=$4
RIGHTS=$5

[[ -z "$KEYWORD" ]] && echo "ERROR: need KEYWORD" && print_help && exit 1

query=$( cat tmpl_add_search_keyword.sql | sed "s/%KEYWORD%/$KEYWORD/g" )

echo $query | ./exec_query.sh
