#!/usr/bin/expect

set prompt "#"

spawn bluetoothctl
expect -re "prompt"
send "disconnect\r"

expect {
        -re "Missing device address argument" {
                send_user "No Devices Connected\n"
                expect $prompt
		send "quit\r"
                expect eof
                exit -1
        }
	-re "Connected: no" {
		send_user "Device succesfully disconnected\n"
		exp_continue
	}

	-re "Connection successful" {
                send_user "Already connected\n"
                exp_continue
        }
}
send "quit\r"
expect eof
