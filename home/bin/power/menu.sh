#!/usr/bin/env bash
# Simple powerMenu made with rofi

power_off="⏻ Power Off"
reboot="⭘ Reboot"
log_out=" Logout"
lock=" Lock"
opts="$lock\n$power_off\n$reboot\n$log_out"
ch="$(echo -e "$opts" | rofi -dmenu)"
case $ch in
    "${lock}")
	    betterlockscreen -u "${HOME}/Pictures/wallpaper.jpg" -l "blur" -b "0.4"
	    ;;
    "${power_off}")
	    loginctl poweroff
	;;
    "${reboot}")
	    loginctl reboot
	;;
    "${log_out}")
	    bspc quit 0
        ;;
esac
