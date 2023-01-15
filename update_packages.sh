#!/bin/bash

echo="/bin/echo"
find="/usr/bin/find"
pip3="/usr/local/bin/pip3"
port="/opt/local/bin/port"
precommit="/Library/Frameworks/Python.framework/Versions/Current/bin/pre-commit"
pwd="/bin/pwd"
sudo="/usr/bin/sudo"
uname="/usr/bin/uname"

# Homebrew installs the 'brew' and 'az' commands at different paths if you're running Apple Silicon vs. Intel:
processor_type=$(${uname} -m)

if [ "${processor_type}" == "arm64" ]; then
 brew="/opt/homebrew/bin/brew"
else
 brew="/usr/local/bin/brew"
fi

# update homebrew
if [ -e ${brew} ]; then
 ${brew} update
 ${brew} upgrade
 ${brew} cleanup
else
 ${echo} "Homebrew not found."
fi

if [ "${processor_type}" == "arm64" ]; then
 az="/opt/homebrew/bin/az"
else
 az="/usr/local/bin/az"
fi

# update az cli
if [ -e ${az} ]; then
 ${az} upgrade
else
 ${echo} "az command not found."
fi

# update pip
if [ -e ${pip3} ]; then
 ${pip3} install --upgrade pip
else
 ${echo} "Please install Python to use pip."
fi

# update pre-commit
if [ -e ${pip3} ]; then
 ${pip3} install pre-commit
 ${find} ~/Documents -type f -name ".pre-commit-config.yaml" -execdir ${pwd} \; -execdir ${precommit} autoupdate \;
else
  ${echo} "Please install Python to use pre-commit."
fi

# update macports
if [ -e ${port} ]; then
 ${sudo} ${port} selfupdate
 ${sudo} ${port} upgrade outdated
 ${sudo} ${port} uninstall inactive
 ${sudo} ${port} uninstall leaves
else
  ${echo} "MacPorts not found."
fi

exit
