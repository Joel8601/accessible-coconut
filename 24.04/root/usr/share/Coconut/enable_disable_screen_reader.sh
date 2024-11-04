result=$(gsettings get org.gnome.desktop.a11y.applications screen-reader-enabled)
if [[ $result = "false" ]];
then
	gsettings set org.gnome.desktop.a11y.applications screen-reader-enabled true
else
	answer=$(zenity --title="Quit screen reader ?" --list --column "Pick" "No" "Yes")
	if [[ $answer = "Yes" ]];
	then
		gsettings set org.gnome.desktop.a11y.applications screen-reader-enabled false
	fi
fi
