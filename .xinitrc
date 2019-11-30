#!/bin/bash
xrdb -merge ~/.Xresources
exec openbox-session
