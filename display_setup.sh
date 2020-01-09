#!/bin/bash

# this should be put in /etc/lightdm/display_setup.sh

# this probably needs adjusting. It's going to be different at home vs at work.
# one thought I had was to make it look at what wifi network I'm connected to, in order to make the determination.

# this may not be the best way to make the determination, but I know that I can get unique values for each edid like this:

# /sys/class/drm/card0-DP-2/edid | md5sum

# so, if I collect those values at home, and then at work, I should know where I'm docked.

HOME_IDS="a2727e78d7d4852906365f43860bc9ac 8d08f336fa443732b9381d216bc05345"
WORK_IDS=""

# let's figure out which monitors are attached and what port they are attached to
DEVICES=$(find /sys/class/drm/*/status)

while read dev ; do 
    if [ $(cat ${dev}) == "connected" ]; then
        #dirname ${dev}
        mon_id="$(cat $(dirname ${dev})/edid | md5sum | awk '{ print $1 }')"
        echo "${HOME_IDS}" | grep -q ${mon_id}
        if [ $? -eq 0 ]; then
            location=HOME
        fi

        echo "${WORK_IDS}" | grep -q ${mon_id}
        if [ $? -eq 0 ]; then
            location=WORK
        fi
    fi 
done <<< "${DEVICES}"

if [ "${location}" == "HOME" ]; then
    xrandr --output eDP-1 --mode 1920x1080 --pos 0x1080 --rotate normal --output DP-1 --off --output HDMI-1 --off --output DP-2 --mode 3840x2160 --pos 5760x0 --rotate normal --output DP-1-1 --primary --mode 3840x2160 --pos 1920x0 --rotate normal --output DP-1-2 --off --output DP-1-3 --off
fi

if [ "${location}" == "WORK" ]; then
    xrandr --output eDP-1 --mode 1920x1080 --pos 0x1080 --rotate normal --output DP-1 --mode 3840x2160 --pos 5760x0 --rotate normal --output HDMI-1 --off --output DP-2 --off --output DP-2-1 --mode 3840x2160 --pos 1920x0 --rotate normal --primary --output DP-2-2 --off --output DP-2-3 --off
fi

exit 0
