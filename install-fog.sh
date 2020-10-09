#!/usr/bin/expect -d

spawn /home/vagrant/fogproject-1.5.9/bin/installfog.sh
expect "Installing LSB_Release as needed"
expect "2) Debian Based Linux"
send "2\r"

expect "  Starting Debian based Installation"
