#!/bin/bash
[ -f ~/.Xresources ] && xrdb -merge ~/.Xresources
eval $(ssh-agent)
exec openbox-session
