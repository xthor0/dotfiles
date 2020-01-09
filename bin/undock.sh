#!/bin/bash

# best way to find this is run xrandr without any monitors attached
primary=eDP-1

xrandr_cmd=""
while read output; do
    echo ${output}
    xrandr_cmd="${xrandr_cmd} --output ${output} --off"
done <<< $(xrandr -q | grep connect | awk '{ print $1 }' | grep -v ${primary})

xrandr --output eDP-1 --mode 1920x1080 --pos 0x0 --rotate normal --primary ${xrandr_cmd}

killall -SIGUSR1 conky

nitrogen --head=0 --set-centered ~/Pictures/hexagram11080p.jpg

exit 0
