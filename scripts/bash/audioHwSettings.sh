#!/bin/bash
mac=${BASH_ARGV[0]}

sudo hciconfig hci0 piscan

mac=$(tr ':' '_' <<< "$mac")

sink="alsa_output.platform-soc_audio.analog-stereo"
source="bluez_source.$mac.a2dp_source"

pactl load-module module-loopback source=$source sink=$sink
amixer cset numid=3 1
amixer set Master 100%

echo "Linked Audio Source from $mac to radio sink"