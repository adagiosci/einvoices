#!/bin/bash

find  ./ -iname "*~" > backup.txt
while read line
do
	echo -e "$line\n"
	rm "$line"
done < backup.txt
rm backup.txt


find  ./ -iname "*pyc" > backup.txt
while read line
do
	echo -e "$line\n"
        rm "$line"
done < backup.txt
rm backup.txt

#git push
#example

