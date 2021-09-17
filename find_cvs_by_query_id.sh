#!/bin/bash

#<hb>#############################################################################
#
# find_cvs_by_keyword.sh KEYWORD
#
# Example: ./find_cvs_by_keyword.sh react
#
#<he>#############################################################################

print_help()
{
sed -e '1,/^#<hb>/d' -e '/^#<he>/,$d' $0 | cut -b3-    #"
}

KEYWORD=$1

[[ -z "$KEYWORD" ]] && echo "ERROR: need KEYWORD" && print_help && exit 1

query=$( cat tmpl_find_cvs_by_keyword.sql | sed "s/%KEYWORD%/$KEYWORD/g" )

echo "$query" | ./exec_query.sh
