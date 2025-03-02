#!/bin/bash

function writeLog()
{
	echo `date` $1 >> /var/log/pcddiscon.log
}
	
echo -n > /var/log/pcddiscon.log

#init_wait_time=`grep "init_wait_time" /etc/pcddiscon.conf | awk -F= '{print $2}'`
#check_interval=`grep "check_interval" /etc/pcddiscon.conf | awk -F= '{print $2}'`
read login_type < /usr/bin/logintype.txt
read login_ip < /usr/bin/loginip.txt

#sleep $init_wait_time
sleep 15

if [ "$login_type" == "linux" ] ; then
	msg=`netstat -at | grep -c "$login_ip:590*"`
	if [ $? == 1 ] ; then
		writeLog "Initial connecting failed after $init_wait_time seconds. Rebooting linux ..."
		reboot
	else
		writeLog "Linux connection established. $msg"
		while :
		do
			#sleep $check_interval
			sleep 6
			msg=`netstat -at | grep -c "$login_ip:590*"`
			if [ $? == 0 ] ; then
				#writeLog "Linux connection checking ...   $msg"
				echo $msg | grep -i -E "WAIT|CLOSE"
				if [ $? == 0 ] ; then
					writeLog "Linux connection closing ...  $msg"
					break
				else
					#writeLog "Linux connection keeps alive."
					continue
				fi
			else 
				writeLog "Linux connection closed."
				break
			fi
		done
		#/usr/bin/python /usr/bin/delete.py
		#sleep 6
		writeLog "Shutting down linux ......"
		clear
		#killall -9 /bin/bash /etc/pcddiscon.sh
		#killall -9 /usr/bin/remmina
		shutdown -h now
	fi
else 
        msg=`netstat -at | grep -c "$login_ip:3389*"`
        if [ $? == 1 ] ; then
                writeLog "Initial connecting failed after $init_wait_time seconds. Rebooting windows ..."
                reboot
        else
                writeLog "Windows connection established. $msg"
                while :
                do
                        #sleep $check_interval
			sleep 6
                        msg=`netstat -at | grep -c "$login_ip:3389*"`
                        if [ $? == 0 ] ; then
                                #writeLog "Windows connection checking ...   $msg"
                                echo $msg | grep -i -E "WAIT|CLOSE"
                                if [ $? == 0 ] ; then
                                        writeLog "Windows connection closing ...  $msg"
                                        break
                                else
                                        #writeLog "Windows connection keeps alive."
                                        continue
                                fi
                        else
                                writeLog "Windows connection closed."
                                break
                        fi
                done
		#/usr/bin/python /usr/bin/delete.py
		#sleep 6
		writeLog "Shutting down windows ......"
                clear
                #killall -9 /bin/bash /etc/pcddiscon.sh
                #killall -9 /usr/bin/remmina
                #shutdown -h now
        fi
fi
