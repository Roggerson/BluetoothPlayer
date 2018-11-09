#!/usr/bin/expect -f

set prompt "#"

spawn sudo bluetoothctl

expect -re $prompt
send "scan on\r"

sleep 5

expect -re $prompt
send "quit\r"

sleep 2
puts "Buffer: $expect_out(buffer)"
