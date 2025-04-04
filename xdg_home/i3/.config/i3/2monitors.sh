#!/bin/sh

xrandr \
--output eDP --off \
--output HDMI-A-0 --mode 1920x1080 --pos 2560x0 --rotate right --set TearFree on \
--output DisplayPort-0 --off \
--output DisplayPort-1 --primary --mode 2560x1440 --rate 170 --pos 0x0 --rotate normal --set TearFree on \
--output DisplayPort-2 --off \
--output DisplayPort-3 --off \
--output DisplayPort-4 --off \
--output DisplayPort-5 --off
