#!/bin/bash
xrdb -merge ~/.Xresources
eval $(ssh-agent)
exec openbox-session
