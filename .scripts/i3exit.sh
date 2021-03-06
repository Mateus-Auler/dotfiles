#!/bin/bash

case "$1" in
	lock)
		i3lock --color "#222222"
		;;
	exit)
		i3-msg exit
		;;
	suspend)
		i3exit lock
		sleep 1
		systemctl suspend
		;;
	hibernate)
		i3exit lock
		sleep 1
		systemctl hibernate
		;;
	reboot)
		i3exit exit
		systemctl reboot
		;;
	poweroff)
		i3exit exit
		systemctl poweroff
		;;
	*)
		echo "Wrong usage"
		exit 1
esac
