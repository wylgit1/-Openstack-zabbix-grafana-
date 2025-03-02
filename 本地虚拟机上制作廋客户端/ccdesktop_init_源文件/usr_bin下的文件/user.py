#!/usr/bin/python

import os
import getpass

size=os.path.getsize('/usr/bin/username.txt')
if size == 0:
        print( "=================================")
        username = input("please input your name : ")
        print ("\n")
        with open("/usr/bin/username.txt","w") as f1:
                f1.write(username)

print( "=================================")

password = getpass.getpass("please input your password : ")
print( "\n")
with open("/usr/bin/password.txt","w") as f2:
        f2.write(password)
