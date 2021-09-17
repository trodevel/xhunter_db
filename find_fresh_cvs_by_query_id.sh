#!/bin/bash

#<hb>#############################################################################
#
# find_fresh_cvs_by_keyword.sh KEYWORD AGE_MM
#
# Example: ./find_fresh_cvs_by_keyword.sh react 30
#
#<he>#############################################################################

print_help()
{
sed -e '1,/^#<hb>/d' -e '/^#<he>/,$d' $0 | cut -b3-    #"
}

KEYWORD=$1
AGE_MM=$2

[[ -z "$KEYWORD" ]] && echo "ERROR: need KEYWORD" && print_help && exit 1
[[ -z "$AGE_MM" ]]  && echo "ERROR: need AGE_MM" && print_help && exit 1

query=$( cat tmpl_find_fresh_cvs_by_keyword.sql | sed "s/%KEYWORD%/$KEYWORD/g" | sed "s/%AGE_MM%/$AGE_MM/g" )

echo "$query" | ./exec_query.sh
