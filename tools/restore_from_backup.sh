#!/bin/bash

#<hb>***************************************************************************
#
# backup db into archive
#
# USAGE: restore_from_backup.sh <db_config> <archive_name.tar.gz>
#
# Example: restore_from_backup.sh db_config.ini backup.tar.gz
#
#<he>***************************************************************************

show_help()
{
    sed -e '1,/^#<hb>/d' -e '/^#<he>/,$d' $0 | cut -c 3-
}

CONFIG=$1
FL=$2

[[ -z $CONFIG ]] && echo "ERROR: CONFIG is not given" && show_help && exit 1
[[ -z $FL ]]     && echo "ERROR: ARCHIVE is not given" && show_help && exit 1

[[ ! -f $CONFIG ]] && echo "ERROR: cannot find config file $CONFIG" && show_help && exit 1
[[ ! -f $FL ]]     && echo "ERROR: cannot find backup file $FL" && show_help && exit 1

TEMP_FL=xhunter.sql

tar xfO $FL $TEMP_FL | mysql --defaults-extra-file=$CONFIG

err=$?

[[ $err -ne 0 ]] && echo "ERROR: cannot restore data base from $FL" && exit $err

echo "INFO: restored database from $FL"
