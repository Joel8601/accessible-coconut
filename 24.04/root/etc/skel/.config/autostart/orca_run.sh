#!/bin/bash

# Enable screen reader
gsettings set org.gnome.desktop.a11y.applications screen-reader-enabled true

# Export QT_ACCESSIBILITY environment variable
export QT_ACCESSIBILITY=1

# Start Orca
orca --replace &
