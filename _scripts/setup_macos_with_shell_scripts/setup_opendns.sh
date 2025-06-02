#!/bin/sh

networksetup -listallnetworkservices

# set OpenDNS FamilyShield DNS as the DNS servers for Wi-Fi
# ref: https://www.opendns.com/setupguide/#familyshield
sudo networksetup -setdnsservers "Wi-Fi" 208.67.222.123 208.67.220.123

# flush DNS cache
sudo dscacheutil -flushcache
sudo killall -HUP mDNSResponder
