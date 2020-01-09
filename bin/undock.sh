#!/bin/bash

primary=eDP-1

# generate xrandr command that disables everything except ${primary}
# outputs="$(xrandr -q | grep connect | awk '{ print $1 }' | grep -v ${primary} | tr \\n ' ')"
# need to loop through these and turn them all off, so I only have to write this once...

xrandr --output eDP-1 --mode 1920x1080 --pos 0x0 --rotate normal --primary --output DP-1 --off  --output HDMI-1 --off --output DP-2 --off --output DP-2-1 --off --output DP-2-2 --off --output DP-2-3 --off 

killall -SIGUSR1 conky

nitrogen --head=0 --set-centered ~/Pictures/hexagram11080p.jpg

exit 0
