#!/bin/bash
## the help
# https://stackoverflow.com/questions/701505/
# https://stackoverflow.com/questions/7427262/
# https://askubuntu.com/questions/226773/
# https://stackoverflow.com/questions/4651437/
# https://stackoverflow.com/questions/226703/
# https://stackoverflow.com/questions/3231804/
# www.thegeekstuff.com/2010/06/bash-if-statement-examples
# https://stackoverflow.com/questions/2359270/
# https://stackoverflow.com/questions/965053/

set -e
echo

files=(~/sounds/yt/*)
song=${files[RANDOM % ${#files[@]}]}

title=$(ffprobe -loglevel error -show_entries format_tags=title -of default=noprint_wrappers=1:nokey=1 "$song")
artist=$(ffprobe -loglevel error -show_entries format_tags=artist -of default=noprint_wrappers=1:nokey=1 "$song")

echo "$title" by "$artist"

read -p "Listen? [y/n] " listen
if [[ $listen == "y" ]]
then
    basename "$song" .mp3
    mpv --really-quiet --audio-display no "$song"
        read -p "Keep? [y/n] " keep1
        if [[ $keep1 == "y" ]]
            then
                mv "$song" ~/sounds/mp3/
                echo "Kept."
                echo
        elif [[ $keep1 == "n" ]]
            then
                mv "$song" ~/sounds/graveyard/
                echo "Buried."
                echo
        else
                echo "Invaild."
                echo 
                exit 0
        fi

elif [[ $listen == "n" ]]
    then  
        read -p "Keep? [y/n] " keep2
        if [[ $keep2 == "y" ]]
            then
                mv "$song" ~/sounds/mp3/
                echo "Kept."
                echo
        elif [[ $keep2 == "n" ]]
            then
                mv "$song" ~/sounds/graveyard/
                echo "Buried."
                echo
        else
            echo "Invaild."
            echo
            exit 0
        fi
else
    echo "Invaild."
    echo
    exit 0
fi
