#!/bin/bash

set -e
echo

files=(~/sounds/mp2/*)
song=${files[RANDOM % ${#files[@]}]}

echo "Check a song? [y/n]"
read -r yn1

while [ $yn1 == "y" ] 
do
    case $yn1 in
        [n]* ) echo "Alright then."; echo; break;;
        [y]* ) echo "Random song coming up."; 
            echo; eyeD3 "$song"; echo; 
            echo "Anything need fixing? [y/n]"
            read -r yn2

        while [[ $yn2 == "y" ]]; do
        read -rp "Anything need fix'n? [y/n] " yn2
        case $yn2 in
            [n]* ) echo "Alright then."; 
               mv "$song" ~/sounds/mp3;
               echo "Song moved";
               echo;;

            [y]* ) read -rp "Fix? [a/t/A/l/y/c] " var
            if [[ $var == "a" ]];
            then
                echo "Artist: "
                read -ar aa
                artist=${aa[*]:0}
                id3 -a ""$artist"" "$song"
                eyeD3 "$song"
                echo
            
            elif [[ $var == "A" ]];
            then
                echo "Album Artist: "
                read -ar AA
                lba=${AA[*]:0}
                eyeD3 -b ""$lba"" "$song"
                echo

            elif [[ $var == "t" ]];
            then
                echo "Title: "
                read -ar tt
                title=${tt[*]:0}
                id3 -t "$title" "$song"
                eyeD3 "$song"
                echo

            elif [[ $var == "l" ]];
            then
                echo "Album: "
                read -ar ll
                album=${ll[*]:0}
                id3 -l ""$album"" "$song"
                eyeD3 "$song"
                echo
            
            elif [[ $var == "y" ]]; 
            then
                echo "Year: "
                read -r yy
                id3 -g ""$yy"" "$song"
                eyeD3 "$song"
                echo

            elif [[ $var == "c" ]];
            then
                echo "Image location: "
                read -r cc
                eyeD3 --add-image ~/shat/"$cc":FRONT_COVER "$song"
                echo

            else
                echo "Um, okay."
                echo
            fi
    esac

echo "[m/g]"
read -r mg

    if [[ $mg == "m" ]];
    then
        mv "$song" ~/sounds/mp3/
        echo "Kept."
        echo
    elif [[ $mg == "g" ]];
    then
        mv "$song" ~/sounds/graveyard/
        echo "Buried."
        echo
    else
        echo "Um, wrong one."
        echo
    fi

done


    esac
done
