#!/bin/bash

#./shrink.sh [Source Folder] [Destination Folder]

ls "$1" > tmp.txt && \

file="./tmp.txt"
printf "" > list.txt
while IFS= read line
do
        # display $line or do somthing with $line
	echo "\"$line\"" >> list.txt
done < "$file" && \

rm tmp.txt

file="./list.txt"
printf "" > "$1/final.sh"
chmod 777 "$1/final.sh"
while IFS= read line
do
        # display $line or do somthing with $line
	echo ffmpeg -i "$1/$line" -acodec libmp3lame -ac 2 -ab 64k -ar 44100 "$2/$line" \&\& \\ >> "$1/final.sh"
	echo rm "$1/$line" >> "$1/final.sh"
done < "$file"

rm list.txt

./"$1"/final.sh && \

rm "$1/final.sh"