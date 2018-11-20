#!/bin/bash
volume=${BASH_ARGV[0]}
#wth apparently this set the correct Data Bus adress to the pi user volume, again me no kno how this do
DBUS_ADDRESS=`grep -z DBUS_SESSION_BUS_ADDRESS /proc/*/environ 2> /dev/null| sed 's/DBUS/\nDBUS/g' | tail -n 1`
if [ "x$DBUS_ADDRESS" != "x" ]; then
        export $DBUS_ADDRESS
        /usr/bin/amixer set Master $volume"%"
fi