#!/bin/bash

source ${HOME}/bin/nagios/etc/constant.conf

if [ -z ${1} ]; then
cat<<EOM
usage: ${0} OBJECT
--
`ls ${NAGIOS_OBJECTS_DIR}`
EOM
exit 1
fi

dir=${NAGIOS_OBJECTS_DIR}
object=${1}
path=${dir}/${object}.${NAGIOS_CONF_EXT}

if [ ! -f ${path} ]; then
cat <<EOM
${path} not existing.
EOM
exit 1
fi

echo ${path}
echo --
vi ${path}

