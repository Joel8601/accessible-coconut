#!/bin/bash

# Check if the user is already in the 'audio' group
if groups "$(whoami)" | grep -q "\baudio\b"; then
    echo "User $(whoami) is already in the 'audio' group."
else
    # Add the user to the 'audio' group
    sudo usermod -aG audio "$(whoami)"
    if [ $? -eq 0 ]; then
        echo "User $(whoami) has been added to the 'audio' group."
    else
        echo "Failed to add user $(whoami) to the 'audio' group."
        exit 1
    fi
fi

file=`zenity --file-selection --title='Select the epub file '`
ebook-speaker "$file" -t "espeak -f eBook-speaker.txt -w eBook-speaker.wav"
