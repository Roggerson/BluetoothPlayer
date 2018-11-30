#!/bin/bash
volume=${BASH_ARGV[0]}
#sets dbus adress to correct adress of your session if not already done with php
DBUS_ADDRESS=`grep -z DBUS_SESSION_BUS_ADDRESS /proc/*/environ 2> /dev/null| sed 's/DBUS/\nDBUS/g' | tail -n 1`
if [ "x$DBUS_ADDRESS" != "x" ]; then
        export $DBUS_ADDRESS
        /usr/bin/amixer set Master $volume"%"
fi
amixer set Master $volume"%"