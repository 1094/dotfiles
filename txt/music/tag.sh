#!/bin/bash
set -e
## https://unix.stackexchange.com/questions/32290/
## uses eyeD3, id3
song=$1
echo
eyeD3 "$song"
echo

while true; do
    read -rp "Anything need fix'n? [y/n] " yn
    case $yn in
        [n]* ) echo "Alright then."; echo; exit;;
        [y]* ) read -rp "Fix? " var
            if [[ $var == "artist" ]];
            then
                echo "Artist: "
                read -a aarr
                artist=${aarr[@]:0}
                id3 -a ""$artist"" "$song"
                eyeD3 "$song"
                echo
            
            elif [[ $var == "title" ]];
            then
                echo "Title: "
                read -a tarr
                title=${tarr[@]:0}
                id3 -t "$title" "$song"
                eyeD3 "$song"
                echo

            elif [[ $var == "album" ]];
            then
                echo "Album: "
                read -a alrr
                album=${alrr[@]:0}
                id3 -l ""$album"" "$song"
                eyeD3 "$song"
                echo
            
            elif [[ $var == "year" ]]; 
            then
                echo "Year: "
                read -r year
                id3 -g ""$year"" "$song"
                eyeD3 "$song"
                echo

            elif [[ $var == "art" ]];
            then
                echo "Image location: "
                read -r art
                eyeD3 --add-image "$art":FRONT_COVER
                eyeD3 "$song"
                echo

            else
                echo "Um, okay."
                echo
            fi
    esac
done
