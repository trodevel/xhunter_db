#!/bin/bash

gl_res=""

function get_var
{
    local name="$1"
    local config="$2"

    local res=$( grep -w $name $config | awk '{ print $2; }' )

    gl_res=$res
}

CONFIG_FILE=$1

[[ -z $CONFIG_FILE ]] && CONFIG_FILE=db_config.txt

[[ ! -f $CONFIG_FILE ]] && echo "ERROR: file $CONFIG_FILE doesn't exist" && exit 1

get_var DB_USER $CONFIG_FILE
DB_USER=$gl_res

get_var DB_PASSWD $CONFIG_FILE
DB_PASSWD=$gl_res

get_var DB_HOST $CONFIG_FILE
DB_HOST=$gl_res

get_var DB_NAME $CONFIG_FILE
DB_NAME=$gl_res

#echo "DEBUG: DB_USER   = $DB_USER"
#echo "DEBUG: DB_PASSWD = $DB_PASSWD"
#echo "DEBUG: DB_HOST   = $DB_HOST"
#echo "DEBUG: DB_NAME   = $DB_NAME"

if [[ -n $DB_NAME ]]
then
    mysql -N -u $DB_USER --password=$DB_PASSWD -h $DB_HOST $DB_NAME
else
    mysql -N -u $DB_USER --password=$DB_PASSWD -h $DB_HOST
fi
