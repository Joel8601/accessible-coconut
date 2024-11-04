#!/bin/sh
items=`ls /dev/sd* | grep -e "sd[a-z][0-9]"`
ans=$(zenity  --list  --text "Select Device" --column "device" $items)
sudo ntfsfix $ans
echo "Press enter to exit"
read xyz
