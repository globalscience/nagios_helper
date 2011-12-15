#!/bin/bash

source ${HOME}/bin/nagios/etc/constant.conf

dir=${NAGIOS_SERVERS_DIR}
ext=${NAGIOS_CONF_EXT}

bk_ext=bk


if [ -z ${1} ]; then
cat <<EOM
usage: ${0} SERVER
--
`ls ${dir}`
EOM
exit 1
fi

server=${1}
path=${dir}/${server}.${ext}
bk_path=${path}.${bk_ext}

if [ ! -f ${bk_path} ]; then
cat <<EOM
${bk_path} not exist.
EOM
exit 1
fi

echo "activating ${server} ..."
mv ${bk_path} ${path}
service nagios restart
echo "done."

