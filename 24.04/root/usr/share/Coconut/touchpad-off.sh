id=$(xinput list | grep -i "Touchpad" | cut -f 2 | cut -d '=' -f 2); xinput set-prop $id "Device Enabled" 0
espeak "Touchpad-Disabled!" --stdout | paplay &

