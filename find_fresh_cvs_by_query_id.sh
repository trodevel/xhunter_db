#!/bin/bash

#<hb>#############################################################################
#
# find_fresh_cvs_by_query_id.sh QUERY_ID AGE_MM
#
# Example: ./find_fresh_cvs_by_query_id.sh 1 30
#
#<he>#############################################################################

print_help()
{
sed -e '1,/^#<hb>/d' -e '/^#<he>/,$d' $0 | cut -b3-    #"
}

QUERY_ID=$1
AGE_MM=$2

[[ -z "$QUERY_ID" ]] && echo "ERROR: need QUERY_ID" && print_help && exit 1
[[ -z "$AGE_MM" ]]  && echo "ERROR: need AGE_MM" && print_help && exit 1

query=$( cat tmpl_find_fresh_cvs_by_query_id.sql | sed "s/%QUERY_ID%/$QUERY_ID/g" | sed "s/%AGE_MM%/$AGE_MM/g" )

echo "$query" | ./exec_query.sh
