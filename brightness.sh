#!/bin/sh
getbright() {
	cat /sys/devices/platform/backlight/backlight/backlight/brightness
	exit 0
}

setbright() {
	if [ ! -w /sys/devices/platform/backlight/backlight/backlight/brightness ]; then
		if [ `id -u` -ne 0 ]; then
			echo "The brightness file is not writable.";
			echo "To make it writable, re-run this script as root.";
			exit 1;
		fi;
	fi

	if [ `id -u` -eq 0 ]; then
		chmod 666 /sys/devices/platform/backlight/backlight/backlight/brightness;
	fi

	if [ $1 -ge 0 ] && [ $1 -le 255 ]; then
		echo $1 > /sys/devices/platform/backlight/backlight/backlight/brightness;
	else
		echo "Brightness must be an integer between 0 and 255.";
		exit 1;
	fi

	exit 0;
}

if [ $# -eq 0 ] && [ $0 != 'sudo' ] ; then
	getbright;
elif [ $# -eq 1 ] && [ $0 = 'sudo' ] ; then
	getbright;
elif [ $# -eq 1 ]  && [ $0 != 'sudo' ] ; then
	setbright $1;
elif [ $# -eq 2 ] && [ $0 = 'sudo' ]; then
	setbright $2;
else
	echo "Too many arguments.";
	exit 1;
fi
