# Setting system sound level
amixer -D pulse sset Master 65%

# Setting system capture level
amixer -D pulse sset Capture Front Left 13852 Front Right 13852

# Enable QT_ACCESSIBILITY
export QT_ACCESSIBILITY=1

# Making launchers trusted 
for i in ~/Desktop/User-Guide/*.desktop; do gio set "$i" "metadata::caja-trusted-launcher" true ;done

rm ~/.config/autostart/firstrun.desktop
rm ~/firstrun.sh

