#!/bin/sh
pactl load-module module-bluetooth-discover
xset -dpms
xset s off
xset s noblank

unclutter &
chromium-browser http://127.0.0.1/BluetoothPlayer/index.php --start-fullscreen --kiosk --incognito --noerrdialogs --disable-translate --no-first-run --fast --fast-start --disable-infobars --disk-cache-dir=/dev/null
