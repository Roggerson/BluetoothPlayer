#!/usr/bin/expect -f

set timeout 2
set scanTime 20
set prompt "#"
set buff  ""

spawn bluetoothctl

expect -re $prompt
send "scan on\r"
sleep $scanTime

expect -re $prompt
send "safdat\r"

expect -re "safdat"
set buff $expect_out(buffer)

expect -re $prompt
send "scan off\r"
sleep 1


expect -re $prompt
send "quit\r"

expect eof

#send_user "\n\nOutput: Länge=[string length $buff]\n$buff\n"


set macPos 0
set mac ""
set namePos 0
set name ""
set j 0set 
set help 0

set outputFilename "scannedDevices.txt"
set outFileId [open $outputFilename "w"] 
puts $outFileId ""
close $outFileId

for { set i 0} {$i <= [string length $buff]} {incr i} {
	set j $i
	incr j 2

	if {[string index $buff $i] == "]" && [string index $buff $j] == "D" } {
		set macPos $i
		incr macPos 9
		set mac [string range $buff $macPos [incr macPos 16]]

		set namePos $macPos
		incr namePos 2

		set help $namePos
		incr help 3
		if {[string range $buff $namePos $help] == "RSSI" || [string range $buff $namePos $help] == "Manu"} { 
			##Do nothing
		} else { 
			set name [string range $buff $namePos [incr namePos 7] ]
			send_user "$mac ; $name\n"
			append name "#" ""
               		append mac ";" $name
                        set outFileId [open $outputFilename "a"] 
                        puts $outFileId $mac
                        close $outFileId

		}
  	}
}


