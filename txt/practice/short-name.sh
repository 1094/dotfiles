set -e
echo

files=(~/sounds/yt/*)
file=${files[RANDOM % ${#files[@]}]}
basename "$file" .mp3

echo
