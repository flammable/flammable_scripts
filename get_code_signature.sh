#!/bin/bash

codesign="/usr/bin/codesign"

${codesign} --display -r - "$1"

exit 0
