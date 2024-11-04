string=`systemctl is-enabled fenrir`
enabled=true;
if [[ $string == *"disabled"* ]]; then
  enabled=false;
fi

string=`systemctl is-active fenrir`
active=true;
if [[ $string == *"inactive"* ]]; then
  active=false;
fi

answer=$(zenity --title="Fenrir - Userland console (TTY) screen reader" --text="Fenrir daemon current status\nEnabled : $enabled, \nActive : $active, \nEnabling this will start daemon at boot time." --list --column "Action" "Start" "Stop" "Enable" "Disable")

case $answer in
        "Enable" | "Start" )
                if [[ $answer = "Enable" ]]
                then
	                sudo systemctl enable fenrir
	                /usr/share/fenrirscreenreader/tools/configure_pulse.sh
	                sudo /usr/share/fenrirscreenreader/tools/configure_pulse.sh
                fi;
            	sudo systemctl start fenrir
            	sleep 1
            	pulseaudio -k
            	sleep 1
            	spd-say "If orca screen reader is missing, press Alt+Super+O to start"
                sleep 4
                ;;
        "Disable" | "Stop")
                if [[ $answer = "Disable" ]]
                then
                    sudo systemctl disable fenrir
                fi;
                sudo systemctl stop fenrir
                ;;
esac
