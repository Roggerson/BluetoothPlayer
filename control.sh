#!/bin/bash
#Purpose of this script is to extract the  player number from org.bluez
#since this number may change upon new connections
#Thus with the aquired play number we can play pause skip songs through a simple command
#given you provided the correct parameters (Mac of Bluetooth device and Command)

mac=${BASH_ARGV[1]};
command=${BASH_ARGV[0]};

mac=$(tr ':' '_' <<< "$mac")
path=$(qdbus --system org.bluez)
dev="dev_$mac/player"
find="dev_$mac/player"

rest=${path#*$find}
pos=$(( ${#path} - ${#rest} - ${#find} ))
playerNumber="${path:$pos+28:1}"

#Execute command and store possible output of command like .Track
info=$(qdbus --system org.bluez  /org/bluez/hci0/"$dev$playerNumber" org.bluez.MediaPlayer1.$command)
if [ $command == "Track" ] || [ $command == "Position" ]
then
echo $info
fi

