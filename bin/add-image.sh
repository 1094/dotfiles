#!/bin/bash
set -e
image=$1
echo "song? "
read -r song
eyeD3 --add-image "$image":FRONT_COVER /home/sir/sounds/mp3/"$song"
