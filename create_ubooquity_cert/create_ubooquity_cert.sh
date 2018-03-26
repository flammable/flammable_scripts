#!/bin/bash

# modified from:
# https://ubooquity.userecho.com/communities/1/topics/101-tutorialenabling-https-with-letsencrypt

keytool="/var/packages/Java8/target/j2sdk-image/jre/bin/keytool"
openssl="/bin/openssl"
rm="/bin/rm"

certdir=/usr/syno/etc/certificate/system/default
keystorepass="yourpasswordhere"
ubooquity_dir="/volume1/docker/Ubooquity"

# change to the script's directory, to avoid "unable to write 'random state'" errors
cd /volume1/homes/admin/scripts/

# delete existing keystore, since keytool won't overwrite it
${rm} ${ubooquity_dir}/ubooquity_key.jks

# take synology's let's encrypt certificate, and convert it to a java keystore for ubooquity
${openssl} pkcs12 -export -in ${certdir}/fullchain.pem -inkey ${certdir}/privkey.pem -out ${ubooquity_dir}/cert_and_key.p12 -name ubooquity_key -CAfile ${certdir}/chain.pem -caname root -password pass:aaa
${keytool} -importkeystore -srcstorepass aaa -deststorepass ${keystorepass} -destkeypass ${keystorepass} -srckeystore ${ubooquity_dir}/cert_and_key.p12 -srcstoretype PKCS12 -alias ubooquity_key -keystore ${ubooquity_dir}/ubooquity_key.jks
${keytool} -import -trustcacerts -alias root -deststorepass ${keystorepass} -file ${certdir}/chain.pem -noprompt -keystore ${ubooquity_dir}/ubooquity_key.jks

# clean up temporary file
${rm} ${ubooquity_dir}/cert_and_key.p12

exit
