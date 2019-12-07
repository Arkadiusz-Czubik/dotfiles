#!/bin/bash

echo ".TH man 8"
echo ".SH NAME"
echo "Arch setup key bindings"
echo ".SH DESCRIPTION"
echo "terefere, some description"
echo ""
echo ".SH SHORTCUTS"

readarray -t a < ~/.config/i3/config

for i in "${!a[@]}"
do
   key=$i
   value=${a[$i]}
   if [[ $value =~ ^bindsym.*$ ]]
   then
	binding=$(echo $value | awk '{print $2}')
	let "previous = $i - 1"
	description=${a[$previous]}
	echo ".TP 15"
	echo ".B $binding"
	echo "${a[$previous]}"
   fi
done

echo ".SH AUTHOR"
echo "Arkadiusz Czubik"


