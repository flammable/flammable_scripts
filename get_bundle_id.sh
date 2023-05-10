#!/bin/bash

# borrowed from:
# https://superuser.com/questions/346369/getting-the-bundle-identifier-of-an-os-x-application-in-a-shell-script

mdls="/usr/bin/mdls"

${mdls} -name kMDItemCFBundleIdentifier -r "$1"

exit 0
