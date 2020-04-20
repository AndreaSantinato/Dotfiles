#!/bin/sh

# Restore The Choosen Wallpaper
nitrogen --restore &

# Start the Picom Compositor Process
picom --config ~/.config/picom/picom.conf &
