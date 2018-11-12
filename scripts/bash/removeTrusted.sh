#!/usr/bin/expect -f
#agent, pair, trust, connect


set time_out 5
set prompt "#"

set outputFilename "trustedDevices.txt"

spawn bluetoothctl

expect -re $prompt
send ""
sleep 1

set outFileId [open $outputFilename "w"] 
puts $outFileId ""
close $outFileId


expect -re $prompt
send "remove *\r"
send_user "Removed all Paired and trusted Devices\n"

expect -re $prompt
send  "quit \r"
expect eof


