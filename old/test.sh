#!/usr/bin/expect -f
#agent, pair, trust, connect


set time_out 5
set prompt "#"

set mac [lindex $argv 0];

set outputFilename "trustedDevices.txt"

spawn bluetoothctl

expect -re $prompt
send "agent KeyboardOnly\r"
sleep 1

expect -re $prompt
send "pair $mac\r"

expect {
        -re "Failed" {
		expect -re $prompt
		send_user "Exiting bluetoothctl\n"
		send "quit\r"
		expect eof
		exit -1
	}
	-re "Enter passkey" {
		send_user "\nDevice available\n"
		while 1 {
                interact "\r" { send "\r";break}
                }

		exp_continue	
	}
exp_continue
}

send_user "\nSAFDAT\n"

expect {
        -re "Failed to pair:" {
                expect -re $prompt
                send_user "Exiting bluetoothctl\n"
                send "quit\r"
                expect eof
                exit -1
        }
        -re "Pairing successful" {
                exp_continue    
        }

}
expect {
        -re "Failed to pair:" {
                expect -re $prompt
                send_user "Exiting bluetoothctl\n"
                send "quit\r"
                expect eof
                exit -1
        }
        -re "Pairing successful" {
		 exp_continue    
        }
}

send_user "\nSAFDAT2\n"


expect -re $prompt
send "trust $mac\r"
sleep 1


set outFileId [open $outputFilename "a"] 
puts $outFileId $mac
close $outFileId


expect -re $prompt
send "quit\r"

expect eof


