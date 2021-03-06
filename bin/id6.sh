#!/bin/bash -e
# uses `eyeD3`, `id3v2`, and `mp3gain`
song=$1

eyeD3 "$song"

while true; do
    read -rp "[a/t/A/l/y/c/n/?]: " var
    if [[ $var == "?" ]]
    then
        echo
        echo "a: Artist / t: Title / A: Album Artist"
        echo "l: Album / y: Year / c: Album Cover"
        echo "?: help / n: Nothing"
        echo
        echo "Pick one."
        echo

elif [[ $var == "n" ]]
    then
        echo
        echo "Goodbye."
        echo
        exit 0

elif [[ $var == "a" ]]
    then
        echo
        read -a ar1 -rp "Artist: "
        ar2=${ar1[@]}
        id3v2 -a "$ar2" "$song"
        eyeD3 "$song"
        echo

elif [[ $var == "t" ]]
    then
        echo
        read -a ti1 -rp "Title: "
        ti2=${ti1[@]}
        id3v2 -t "$ti2" "$song"
        eyeD3 "$song"
        echo

elif [[ $var == "A" ]]
    then
        echo
        read -a la1 -rp "Ablum Artist: "
        la2=${la1[@]}
        eyeD3 -b "$la2" "$song"
        echo

elif [[ $var == "l" ]]
    then
        echo
        read -a lb1 -rp "Album: "
        lb2=${lb1[@]}
        id3v2 -l "$lb2" "$song"
        eyeD3 "$song"
        echo

elif [[ $var == "y" ]]
    then
        echo
        read -rp "Year: " ye1
        id3v2 -g ""$ye1"" "$song"
        eyeD3 "$song"
        echo

elif [[ $var == "c" ]]
    then
        echo
        ls ~/shat
        echo
        read -rp "Path: " co
        pd=/home/sir/shat/
        if [[ -f $pd$co ]];
        then
            eyeD3 --add-image "$pd$co":FRONT_COVER "$song"
            echo
        else
            echo "Try again."
            echo
            continue
        fi

    else
        echo "..."
        echo "Try again."
        echo

    fi

done
