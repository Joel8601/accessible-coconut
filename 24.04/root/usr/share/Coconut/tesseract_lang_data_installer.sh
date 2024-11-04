langs="";
while read -r line
do
    langs=$langs$(echo "$line" | cut -d " " -f1 | sed "s/tesseract-ocr-//g")" "
done <<< $(apt-cache search tesseract-ocr-)


ans=$(zenity  --list  --text "Select language to download" --column "Language" $langs)
if test -n "$ans"
then 
	if [ $(dpkg-query -W -f='${Status}' $ans 2>/dev/null | grep -c "ok installed") -eq 1 ];
	then
		zenity --title "Language data already installed" --info --text "Language data package $ans is already installed!"
	else
		sudo apt-get install tesseract-ocr-$ans
	fi
fi

