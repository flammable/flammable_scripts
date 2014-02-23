#!/bin/bash

for i in $( lpstat -a | cut -d " " -f1 ); do
/usr/sbin/lpadmin -x $i
done