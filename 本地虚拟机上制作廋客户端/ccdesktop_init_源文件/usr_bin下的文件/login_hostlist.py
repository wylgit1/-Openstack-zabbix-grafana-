#!/usr/bin/python
import urllib
import http.client

vmm_object = open('/usr/bin/vmm_ip.txt')
vmm_list = vmm_object.read().split('\n')

user_object = open('/usr/bin/username.txt')
user_list = user_object.read().split('\n')
user_data = {'user':user_list[0]}
user_data_urlencode = urllib.parse.urlencode(user_data)
requrl = "http://"+vmm_list[0]+"/cgi-bin/openstack/virtual_desktop_host.py"
headerdata = {"Host":vmm_list[0],"Connection":"Keep-Alive","Content-Type":"application/x-www-form-urlencoded"}
conn = http.client.HTTPConnection(vmm_list[0])
conn.request(method="POST",url= requrl,body=user_data_urlencode,headers=headerdata)
response = conn.getresponse()
res = response.read().decode('utf-8')
#print(res)
conn.close()
list = res.split()
if len(list) >= 1:
	print( "=========================================")
	for x,y in enumerate(list):
		print( "    [",x,"] ",y)
	print( "=========================================")
	i = int(input("please select the corresponding serial number: "))
	login_name = str(list[i])
else:
	print("没有给我这个用户分配虚拟机")
print( "\n")
print( "=========================================")
print("waiting.............")
loginip_data = {'login_name':login_name}
loginip_data_urlencode = urllib.parse.urlencode(loginip_data)
requrl1 = "http://"+vmm_list[0]+"/cgi-bin/openstack/virtual_desktop_hostip.py"
conn.request(method="POST",url= requrl1,body=loginip_data_urlencode,headers=headerdata)
response1 = conn.getresponse()
res1 = response1.read().decode('utf-8')

print(res1)
print("输入IP地址111111111111111111111")

with open("/usr/bin/loginip.txt","w") as f1:
	f1.write(res1.split()[0])
conn.close()

logintype_data_urlencode = urllib.parse.urlencode(loginip_data)
requrl2 = "http://"+vmm_list[0]+"/cgi-bin/openstack/virtual_desktop_hosttype.py"
conn.request(method="POST",url= requrl2,body=logintype_data_urlencode,headers=headerdata)
response2 = conn.getresponse()
res2 = response2.read().decode('utf-8')

print(res2)
print("输入虚拟机类型111111111111111111111111")

with open("/usr/bin/logintype.txt","w") as f2:
	f2.write(res2.split()[0])
conn.close()

