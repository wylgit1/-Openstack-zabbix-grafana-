#!/usr/bin/python
import urllib
import httplib
mac_object = open('/usr/bin/mac.txt')
mac_list = mac_object.read().split('\n')
mac_data = {'mac':mac_list[0]}
mac_data_urlencode = urllib.urlencode(mac_data)
requrl = "http://192.168.1.60/cgi-bin/openstack/virtual_desktop_host_type.py"
headerdata = {"Host":"192.168.1.60","Connection":"Keep-Alive","Content-Type":"application/x-www-form-urlencoded"}
conn = httplib.HTTPConnection("192.168.1.60")
conn.request(method="POST",url= requrl,body=mac_data_urlencode,headers=headerdata)
response = conn.getresponse()
res = response.read()
print res.strip()
