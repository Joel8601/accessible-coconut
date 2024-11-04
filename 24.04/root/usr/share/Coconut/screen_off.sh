for line in $(xrandr | grep " connected " | awk '{ print$1 }'); do xrandr --output $line --off; done
espeak "Screen off" --stdout | paplay &
