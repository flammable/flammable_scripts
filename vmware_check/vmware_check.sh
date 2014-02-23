#!/bin/bash

if [ -z "$(/usr/bin/pgrep -i vmware)" ]
 then
     exit 0
 else
     exit 1
fi
