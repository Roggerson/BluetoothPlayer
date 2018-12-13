#!/usr/bin/expect -f
#agent, pair, trust, connect


set time_out 5
set prompt "#"

set mac [lindex $argv 0];

spawn bluetoothctl

expect -re $prompt
send "agent KeyboardOnly\r"
sleep 1

expect -re $prompt
send "pair $mac\r"

expect {
        -re "Failed to pair: org.bluez.Error.AlreadyExists" {
		expect -re $prompt
		send_user "Exiting bluetoothctl, already paired with Device $mac\n"
		send "quit\r"
		expect eof
		exit -1
	}
	
	-re "Failed to pair: org.bluez.Error.AuthenticationFailed" {
                expect -re $prompt
                send_user "Exiting bluetoothct wrong passkey\n"
                send "quit\r"
                expect eof
                exit -1
        }
	-re "Device $mac not available" {
                expect -re $prompt
                send_user "Exiting bluetooth, either wrong Mac adress or Device has not been scanned detected by scan\n"
                send "quit\r"
                expect eof
                exit -1
        }

	-re "Enter passkey" {
		send_user "\nDevice available\n"
                sleep 10

                ##instead of user input directly in the console we read a file
                set f [open "/var/www/html/BluetoothPlayer/scripts/bash/passKey" "r"]
                set passKey [read -nonewline $f]
                close $f

                set f [open "/var/www/html/BluetoothPlayer/scripts/bash/passKey" "w"]
                puts $f ""
                close $f

                #user interaction directly in console
		#while 1 {
                #interact "\r" { send "\r";break}
                #}

                send_user "\n V Passkey is: $passKey V \n"
                send "$passKey\r"
		exp_continue	
	}
exp_continue
}

expect -re $prompt
send "trust $mac\r"
sleep 1

set outputFilename "/var/www/html/BluetoothPlayer/scripts/bash/trustedDevices.txt"
set outFileId [open $outputFilename "a"] 
puts $outFileId $mac
close $outFileId

expect -re $prompt
send "quit\r"
 
expect eof