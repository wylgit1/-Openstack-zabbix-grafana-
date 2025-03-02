#!/bin/bash
#

echo "================================================================="
echo "================================================================="
echo "================= Virtual Cloud Desktop ========================"
echo "================================================================="
echo "================================================================="

num=3
for i in `seq $num`
do
	/usr/bin/python3 /usr/bin/input_mip.py
	read vmm_ip < /usr/bin/vmm_ip.txt
	ping -c 1 $vmm_ip > /dev/null && break
	if [ $i -eq $num ]; then
		echo "starting reboot"
		#reboot
	else
		echo -e "\n*** Please make sure the manager is reachable and try again ***\n"
	fi
done

/usr/bin/python3 /usr/bin/clientInfo.py
sleep 1

num=3
for i in `seq $num`
do
	/usr/bin/python3 /usr/bin/user.py
	pcd_token=`/usr/bin/python3 /usr/bin/login_token.py`
        sleep 5s
        if [ "$pcd_token" == "fail" ] ; then
		if [ $i -eq $num ]; then
                        echo "starting reboot"
			echo -n > /usr/bin/username.txt
			reboot
                else
                        echo "Authentication failed and try again"
                fi
        else
                break
        fi
done
#/usr/bin/python3 /usr/bin/student_data.py
#sshpass -p 111111 scp /usr/bin/student_name.txt root@192.168.1.160:/usr/bin
#sshpass -p 111111 scp /usr/bin/student_password.txt root@192.168.1.160:/usr/bin

python3 /usr/bin/login_hostlist.py
sleep 10s

echo -e "\n"
read login_ip < /usr/bin/loginip.txt
read login_type < /usr/bin/logintype.txt

if [ "$login_type" == "linux" ] ; then 
	cfile=vdlinux.remmina
	sed -i "s/server.*/server=$login_ip/g" /etc/$cfile
	sed -i "s/ssh_server.*/ssh_server=/g" /etc/$cfile
	remmina -c /etc/vdlinux.remmina
	#/bin/bash /etc/pcddiscon.sh &
	#/bin/bash /etc/pcdstartx -c /etc/$cfile
elif [ "$login_type" == "windows" ] ; then
	cfile=vdwin.remmina
	sed -i "s/server.*/server=$login_ip/g" /etc/$cfile
	sed -i "s/ssh_server.*/ssh_server=/g" /etc/$cfile
	/bin/bash /etc/pcddiscon.sh &
	/bin/bash /etc/pcdstartx -c /etc/$cfile
else
	echo "  --> starting pcd service error, starting reboot !!!! "
	reboot
fi

exit 0

