#!/bin/bash

# This script is used for updating multiple Git repositories.
# Modified from:
# http://sixarm.com/about/git-pull-for-many-repository-directories.html

dirname="/usr/bin/dirname"
echo="/bin/echo"
find="/usr/bin/find"
git="/usr/bin/git"
sort="/usr/bin/sort"
xargs="/usr/bin/xargs"

git_repos=$HOME/"Documents/git_repos"

if [ $# == 0 ]; then
 ${echo} "Usage: $0 [options]

Options:
 --fetch       Perform 'git fetch' for all git repositories
 --pull        Perform 'git pull' for all git repositories"
 exit 1
fi

if [ "$1" = "--fetch" ]; then
 ${find} "${git_repos}" -type d -name .git \
| ${xargs} -n 1 ${dirname} \
| ${sort} \
| while read line; do ${echo} ${line} && cd ${line} && ${git} fetch; done
 exit
fi

if [ "$1" = "--pull" ]; then
 ${find} "${git_repos}" -type d -name .git \
| ${xargs} -n 1 ${dirname} \
| ${sort} \
| while read line; do ${echo} ${line} && cd ${line} && ${git} pull; done
 exit
fi
