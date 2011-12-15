#!/bin/bash

source ${HOME}/bin/nagios/etc/constant.conf

dir=${NAGIOS_SERVERS_DIR}


if [ -z $1 ]; then
cat <<EOM
usage: $0 SERVER
EOM
echo --
ls ${dir}
exit 1
fi

file=$dir/$1.cfg

echo $file
echo --
vi $file

