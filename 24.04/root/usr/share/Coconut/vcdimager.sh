eject
espeak "Please insert the VCD or DVD."
address=$(zenity --file-selection --directory --title="Select the folder");
eject -t
cd $address
vcdxrip --cdrom-device --nofiles
eject 
espeak "Compleate"

