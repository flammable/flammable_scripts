#!/bin/bash

# Script to sort images into subfolders, based on resolution.
# This script wouldn't have been possible without the help of everyone in this Super User thread:
# http://superuser.com/questions/17562/how-to-sort-images-into-folders-based-on-resolution

mkdir="/bin/mkdir"
mv="/bin/mv"

shopt -s nullglob # The script spits errors if this is not set and there are, say, no *.png files.
for image in *.jpg *.JPG *.jpeg *.JPEG *.gif *.GIF *.bmp *.BMP *.png *.PNG;
    do res=$(identify -format %wx%h\\n "${image}");
    ${mkdir} -p ${res};
    ${mv} "${image}" ${res};
done
