#!/bin/bash

if [ -z "$(pgrep -i vmware)" ]
 then
     exit 0
 else
     exit 1
fi