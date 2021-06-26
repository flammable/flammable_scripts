#!/bin/bash

shopt -s nullglob # The script spits errors if this is not set and there are, say, no *.png files.
for image in *.jpg *.JPG *.jpeg *.JPEG *.gif *.GIF *.bmp *.BMP *.png *.PNG;
    do res=$(identify -format %wx%h\\n "$image");
    mkdir -p $res;
    mv "$image" $res;
done
