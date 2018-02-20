#!/bin/bash
set -e
while true
do
    echo
    read -rp "Check a random song? [y/n]: " yn1
    if [[ $yn1 == "n" ]]
    then
        echo "Alright then. Lata."
        echo
        exit

elif [[ $yn1 == "y" ]]
    then
        files=(~/sounds/yt/*)
        song=${files[RANDOM % ${#files[@]}]}
        echo
        eyeD3 "$song"
        while true
        do
            read -rp "[a/t/A/l/y/c/f/n/?]: " var
            if [[ $var == "?" ]]
            then
                echo
                echo "a: Artist / t: Title / A: Album Artist"
                echo "l: Album / y: Year / c: Album Cover"
                echo "f: filename / ?: help / n: Nothing"
                echo
                echo "Pick one."
                echo

        elif [[ $var == "n" ]]
            then
            echo
            read -rp "Completed? " yn2
                    if [[ $yn2 == "n" ]]
                    then
                        echo "Um, okay."
                        echo
                        break
                    elif [[ $yn2 == "y" ]]
                    then
                        mv "$song" ~/sounds/mp3/
                        echo "Alright, song moved."
                        echo
                        break
                    else
                        echo "Um ..."
                        continue
                    fi

        elif [[ $var == "a" ]]
            then
                echo
                read -a ar1 -rp "Artist: "
                ar2=${ar1[@]}
                id3 -a "$ar2" "$song"
                eyeD3 "$song"
                echo

        elif [[ $var == "t" ]]
            then
                echo
                read -a ti1 -rp "Title: "
                ti2=${ti1[@]}
                id3 -t "$ti2" "$song"
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
                id3 -l "$lb2" "$song"
                eyeD3 "$song"
                echo

        elif [[ $var == "y" ]]
            then
                echo
                read -rp "Year: " ye1
                id3 -g ""$ye1"" "$song"
                eyeD3 "$song"
                echo

        elif [[ $var == "c" ]]
            then
                echo
                ls ~/shat
                echo
                read -rp "Filename: " co
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
        
        elif [[ $var == "f" ]]
            then
                echo
                echo "$song"
            while true
            do
                read -rp "Filename: " fn
                echo "$fn"
                read -rp "Correct? " yn3
                if [[ $yn3 == "y" ]]
                then
                    echo
                    mv "$song" ./${fn}.mp3
                    echo "Song renamed."
                    echo
                else
                    echo
                    echo "Oops."
                    echo
                    continue
                fi
            done

        else
                echo "..."
                echo "Try again."
                echo

            fi

        done
    fi
done
