#!/bin/bash

# this probably needs adjusting. It's going to be different at home vs at work.
# one thought I had was to make it look at what wifi network I'm connected to, in order to make the determination.
xrandr --output eDP-1 --primary --mode 1920x1080 --pos 0x1080 --rotate normal --output DP-1 --mode 3840x2160 --pos 5760x0 --rotate normal --output HDMI-1 --off --output DP-2 --off --output DP-2-1 --mode 3840x2160 --pos 1920x0 --rotate normal --output DP-2-2 --off --output DP-2-3 --off

killall -SIGUSR1 conky

nitrogen --head=0 --set-centered ~/Pictures/hexagram11080p.jpg 
nitrogen --head=1 --set-centered ~/Pictures/hexagram1uhd.jpg 
nitrogen --head=2 --set-centered ~/Pictures/hexagram1uhd.jpg 

exit 0
