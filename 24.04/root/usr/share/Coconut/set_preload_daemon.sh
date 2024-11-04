string=`systemctl is-enabled preload`
enabled=true;
if [[ $string == *"disabled"* ]]; then
  enabled=false;
fi

string=`systemctl is-active preload`
active=true;
if [[ $string == *"inactive"* ]]; then
  active=false;
fi

answer=$(zenity --title="Preload - Adaptive readahead daemon" --text="Preload daemon current status\nEnabled : $enabled, \nActive : $active, \nEnabling this will start daemon at boot time." --list --column "Action" "Start" "Stop" "Enable" "Disable")


if [[ $answer = "Enable" ]];
then
	sudo systemctl enable preload
	sudo systemctl start preload
elif [[ $answer = "Start" ]];
then
    sudo systemctl start preload
elif [[ $answer = "Disable" ]];
then
    sudo systemctl disable preload
    sudo systemctl stop preload
elif [[ $answer = "Stop" ]];
then
    sudo systemctl stop preload
fi
