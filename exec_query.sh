#!/bin/bash

gl_res=""

CONFIG_FILE=$1

[[ -z $CONFIG_FILE ]] && CONFIG_FILE=db_config.ini

[[ ! -f $CONFIG_FILE ]] && echo "ERROR: file $CONFIG_FILE doesn't exist" && exit 1

mysql --defaults-extra-file=$CONFIG_FILE -N
