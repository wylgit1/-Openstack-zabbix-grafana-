#!/usr/bin/python
import os
print( "=================================")
vmm_ip = input("please input ip of manager : ")
print("\n")
with open("/usr/bin/vmm_ip.txt","w") as f0:
        f0.write(vmm_ip)

