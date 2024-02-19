#!/bin/bash
if [ "$EUID" -ne 0 ]; then
    echo "Please run this script with sudo or as root."
    exit 1
fi

echo "Executing commands as root..."
new_repo1="deb http://deb.debian.org/debian bullseye main contrib non-free"
new_repo2="deb http://deb.debian.org/debian bullseye-updates main contrib non-free"
new_repo3="deb http://deb.debian.org/debian bullseye-backports main contrib non-free"
new_repo4="deb http://security.debian.org/debian-security/ bullseye-security main contrib non-free"
cp /etc/apt/sources.list /etc/apt/sources.list.bak
echo "$new_repo1" > /etc/apt/sources.list
echo "$new_repo2" >> /etc/apt/sources.list
echo "$new_repo3" >> /etc/apt/sources.list
echo "$new_repo4" >> /etc/apt/sources.list
apt update
echo "Hello you are using a script from Vertirose."
echo "I hope you can use this script freely and without having to think about some configurations."
echo "Running bind9 and dnsutils installations at the same time."
apt install bind9 dnsutils -y
mv /etc/bind /etc/bind-backup
mv bind/ /etc
chmod rwxr-sr-x /etc/bind
echo "Congratulations, the bind9 configuration is complete, just a few steps left."
echo "nameserver 192.168.1.100" > /etc/resolv.conf
echo "Script execution completed."