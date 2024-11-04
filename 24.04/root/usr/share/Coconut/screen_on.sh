for line in $(xrandr | grep " connected " | awk '{ print$1 }'); do xrandr --output $line --auto; done
espeak "Screen On" --stdout | paplay &
