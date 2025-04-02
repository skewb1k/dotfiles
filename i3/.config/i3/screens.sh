#!/bin/sh

xrandr --output eDP-1 --off \
--output HDMI-1 --mode 1920x1080 --pos 2560x0 --rotate right \
--output DP-1 --off \
--output DP-2 --primary --mode 2560x1440 --rate 170 --pos 0x0 --rotate normal \
--output DP-3 --off \
--output DP-4 --off \
--output DP-5 --off \
--output DP-6 --off
