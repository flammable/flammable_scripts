#!/bin/bash

cp="/bin/cp"

certdir=/usr/syno/etc/certificate/system/default
squirrel_cert_dir="/volume1/docker/Squirrel/certs"

# copy certs
${cp} ${certdir}/* ${squirrel_cert_dir}

exit
