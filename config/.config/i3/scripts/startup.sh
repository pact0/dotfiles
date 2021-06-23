#!/bin/sh
xrandr --output DVI-D-1 --primary --auto --pos 1080x474 --rate 144 --output HDMI-1 --auto --rotate right --pos 0x0
setxkbmap -layout pl
#MOUSE=$(xinput list | grep "Glorious Model O" | head -n 1 | awk '{print substr($6, 4)}')
#xinput --set-prop $MOUSE 'libinput Accel Speed' 0
sleep 10s
nitrogen --restore
