#!/bin/bash
number=$(ps ax | grep -c -i "[Vv]Mware Fusion")

if [ $number -gt 0 ]
    then
        exit 1;
fi
