#!/bin/bash
# Set random wallpaper
files=(/home/woomy/Pictures/wallpapers/*)
num=${#files[@]}
wall="${files[RANDOM % num]}"
feh --bg-fill "${wall}"
