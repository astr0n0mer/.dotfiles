#!/bin/sh

set -e # INFO: fail on first error
set -x # INFO: print all commands before execution


if [[ "$(uname)" == "Darwin" ]]; then
	networksetup -listallnetworkservices

	# set OpenDNS FamilyShield DNS as the DNS servers for Wi-Fi
	# ref: https://www.opendns.com/setupguide/#familyshield
	sudo networksetup -setdnsservers "Wi-Fi" 208.67.222.123 208.67.220.123

	# flush DNS cache
	sudo dscacheutil -flushcache
	sudo killall -HUP mDNSResponder
	networksetup -getdnsservers "Wi-Fi"
fi
