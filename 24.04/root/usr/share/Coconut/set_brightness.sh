#!/bin/sh

# getting current brightness value
current_brightness=$(printf "%.0f" $(gsettings get org.mate.power-manager brightness-ac))

if [ $current_brightness -gt 90 ]; then
	new_brightness=10;
else
	new_brightness=$(expr $current_brightness + 10)
fi

# Setting new brightness value
gsettings set org.mate.power-manager brightness-ac $new_brightness
notify-send "Brightness = $new_brightness"
