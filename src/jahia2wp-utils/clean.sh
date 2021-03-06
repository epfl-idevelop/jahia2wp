#!/bin/bash

# Import configuration
CONFIG_FILE="/srv/${WP_ENV}/jahia2wp/src/jahia2wp-utils/config.sh"

if [ ! -e ${CONFIG_FILE} ]
then
    echo "Config file (${CONFIG_FILE}) not found!"
    exit 1
fi
source ${CONFIG_FILE}

# Check parameters


if [ "$1" == "" ]
then
    echo "Site name missing"
    exit 1
fi



python ${SRC_DIR}jahia2wp.py clean ${WP_ENV} ${SITE_ROOT}$1

echo -n "Removing extracted files... "
rm -rf "${EXPORT_DIR}/$1"
echo "done"

