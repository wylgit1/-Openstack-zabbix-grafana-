#!/usr/bin/python
import urllib
import http.client
user_object = open('/usr/bin/username.txt')
user_list = user_object.read().split('\n')

vmm_object = open('/usr/bin/vmm_ip.txt')
vmm_list = vmm_object.read().split('\n')


password_object = open('/usr/bin/password.txt')
password_list = password_object.read().split('\n')
token_data = {'user_name':user_list[0],'password':password_list[0]}
token_data_urlencode = urllib.parse.urlencode(token_data)
requrl = "http://"+vmm_list[0]+"/cgi-bin/openstack/virtual_desktop_token.py"
headerdata = {"Host":vmm_list[0],"Connection":"Keep-Alive","Content-Type":"application/x-www-form-urlencoded"}
conn = http.client.HTTPConnection(vmm_list[0])
conn.request(method="POST",url= requrl,body=token_data_urlencode,headers=headerdata)
response = conn.getresponse()
res = response.read()
print (res.split()[0])
