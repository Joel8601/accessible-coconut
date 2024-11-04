id=$(xinput list | grep -i "Touchpad" | cut -f 2 | cut -d '=' -f 2); xinput set-prop $id "Device Enabled" 1
espeak "Touchpad-Enabled!" --stdout | paplay &

