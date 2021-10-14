#!/bin/bash

#<hb>***************************************************************************
#
# backup db into archive
#
# USAGE: create_backup.sh <db_config> [<archive_name.tar.gz>]
#
# Example: create_backup.sh db_config.ini backup.tar.gz
#
#          create_backup.sh db_config.ini
#
#<he>***************************************************************************

show_help()
{
    sed -e '1,/^#<hb>/d' -e '/^#<he>/,$d' $0 | cut -c 3-
}

CONFIG=$1
FL=$2

DATUM=$(date -u +%Y%m%d_%H%M)

[[ -z $FL ]]     && FL="xhunter.$DATUM.tar.gz"
[[ -z $CONFIG ]] && CONFIG=db_config.ini

[[ ! -f $CONFIG ]] && echo "ERROR: cannot find config file $CONFIG" && show_help && exit

TEMP_FL=xhunter.sql

mysqldump --defaults-extra-file=$CONFIG --databases xhunter > $TEMP_FL

tar czf $FL $TEMP_FL

err=$?

[[ $err -ne 0 ]] && echo "ERROR: cannot create archive $FL" && exit $err

echo "INFO: backup database to $FL - done"
