#!/bin/bash
cd /etc
clear
export SUDO_ASKPASS=./_PWD_TEMP_
rm -rf /usr/bin/username.txt
touch /usr/bin/username.txt
sudo -A ./pcd.sh
zhcon --utf8
