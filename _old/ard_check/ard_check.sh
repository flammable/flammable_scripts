#!/bin/bash

if [ -z "$(/usr/sbin/netstat -n | grep '.5900')" ]
 then
     exit 0
 else
     exit 1
fi
