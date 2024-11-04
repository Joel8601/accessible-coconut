#!/bin/sh
items=`ls /dev/sd* | grep -e "sd[a-z]$"`
ans=$(zenity  --list  --text "Select Device, type 'w' and enter to write out" --column "device" $items)
echo "Type 'w' and enter to write out"
sudo fixparts $ans
echo "Press enter to exit"
read xyz
