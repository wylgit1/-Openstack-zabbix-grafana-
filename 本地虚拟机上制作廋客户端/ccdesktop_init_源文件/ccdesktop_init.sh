#!/bin/bash

echo "
##############################################################
#简介：ccdesktop部署
# File Name: ccdesktop_init.sh
# Version: V1.0
# Author: Biqiang
# Created Time : 2022-05-20 00:46:18
# Environment: ubuntu 18.04 
##############################################################
"

echo "开始安装必要的软件"
sleep 5
apt-get install zhcon usbmount ntfs-3g -y


read -p "请输入CCC管理台IP地址:" net
echo " $net " > usr_bin_file/vmm_ip.txt

echo "开始部署ccdesktop文件"
cp usr_bin_file/* /usr/bin/
chmod +x /usr/bin/login*
chmod +x /usr/bin/input_mip.py
chmod +x /usr/bin/clientInfo.py
chmod +x /usr/bin/user.py
cp etc_file/* /etc/
chmod +x /etc/pcddiscon.sh
chmod +x /etc/pcdstartx
chmod +x /etc/pcd.sh
chmod +x /etc/test.sh
chmod +x /etc/vdlinux.remmina
chmod +x /etc/vdwin.remmina
cp /etc/test.sh /etc/profile.d/
cp getty@.service /lib/systemd/system/getty@.service
cp usbmount.conf /etc/usbmount/usbmount.conf
cp usbmount.rules /etc/udev/rules.d/usbmount.rules
cp usbmount@.service /etc/systemd/system/usbmount@.service
cp systemd-udevd.service /lib/systemd/system/systemd-udevd.service


echo "关闭图形界面"
systemctl set-default multi-user.target


