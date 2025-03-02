#!/usr/bin/python
# encoding: utf-8

from subprocess import Popen, PIPE
import urllib
import http.client
import urllib.parse


def getNet():  # 获取ifconfig输出
    p = Popen(['ifconfig'], stdout=PIPE, stderr=PIPE)
    stdout, stderr = p.communicate()
    data = [i.decode('utf-8') for i in stdout.split(b'\n') if i]
    return data


def getIP(data):  # 提取ens相关的
    new_line = ''
    lines = []
    for line in data:
        if line[0].strip():
            lines.append(new_line)
            new_line = line + '\n'
        else:
            new_line += line + '\n'
    lines.append(new_line)
    return [i for i in lines if i and i.startswith('ens')]


def parseIP(data):  # 提取ip，mac，devname
    global devname
    global ipaddr
    global HWaddr
    devname = 0
    ipaddr = 0
    HWaddr = 0
    for devs in data:
        lines = devs.split('\n')
        # print lines[0]
        HWaddr = lines[3].split()[1]
        # print HWaddr
        # print "-----------"
        devname = lines[0].split()[0]
        # print devname
        ipaddr = lines[1].split()[1]
        # print ipaddr
    user = 'root'
    dic = {'devname': devname, 'ip': ipaddr, 'HWaddr': HWaddr, 'user' : user}

    return dic


def getuser(dic):
    vmm_object = open('/usr/bin/vmm_ip.txt')
    vmm_list = vmm_object.read().split('\n')

    dic = urllib.parse.urlencode(dic)    
    requrl = "http://" + vmm_list[0] + "/cgi-bin/openstack/virtual_desktop_clientInfo.py"
    headerdata = {"Host": vmm_list[0], "Connection": "Keep-Alive", "Content-Type": "application/x-www-form-urlencoded"}
    conn = http.client.HTTPConnection(vmm_list[0])
    conn.request(method="POST", url=requrl, body=dic, headers=headerdata)
    response = conn.getresponse()
    res = response.read()
    #print(res)
    conn.close()



data = getNet()
print("让我看一下本地客户端的ifconfig信息")
print(data)
data1 = getIP(data)
print("让我看一下提取ens的信息")
print(data1)
dic = parseIP(data1)
print("让我看一下的提取的设备名称，ip地址和子网掩码，用户信息")
print(dic)
getuser(dic)
