#!/bin/bash

#<hb>#############################################################################
#
# import_cvs.sh FILENAME KEYWORD
#
# Example: ./import_cvs.sh new_cv.csv java
#
#<he>#############################################################################

print_help()
{
sed -e '1,/^#<hb>/d' -e '/^#<he>/,$d' $0 | cut -b3-    #"
}


FILENAME=$1
KEYWORD=$2

[[ -z "$FILENAME" ]] && echo "ERROR: need FILENAME" && print_help && exit 1
[[ -z "$KEYWORD" ]] && echo "ERROR: need KEYWORD" && print_help && exit 1

query=$( cat tmpl_import_cvs.sql | sed "s/%FILENAME%/$FILENAME/g" | sed "s/%KEYWORD%/$KEYWORD/g" )

echo $query | ./exec_query.sh
