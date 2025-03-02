环境：

> 系统环境：unbuntu 18.04 lts

##### 1.安装所需要的包（安装DHCP、TFTP、Syslinux、Initramfs-tools）

```
sudo apt-get install isc-dhcp-server tftpd-hpa syslinux nfs-kernel-server initramfs-tools
```

##### 2.配置tftp服务

```
sudo vim /etc/default/tftpd-hpa   #配置tftp服务

RUN_DAEMON="yes"
OPTIONS="-l -s /var/lib/tftpboot/"

#重启TFTPD服务
/etc/init.d/tftpd-hpa restart
/etc/init.d/tftpd-hpa start
```

##### 3.配置dhcp服务

```

vim /etc/dhcp/dhcpd.conf

allow booting;
allow bootp;
 
subnet 192.168.72.0 netmask 255.255.255.0 {    ###子网10.10.101.0   ////////////////////////////前三位要换成自己虚拟机的ip地址，即“192.168.72”需要进行更换，其他后面的数字不需要动
    range 192.168.72.220 192.168.72.240;        ###子网的范围
    option broadcast-address 192.168.72.255;     ###广播地址
    option routers 192.168.72.2;    ###子网网关
    filename "/pxelinux.0";
}


###重启DHCP服务
service isc-dhcp-server restart
service isc-dhcp-server start
```

############################################################################################################
以下是对上述代码的解释
###需要在NFS服务器上配置DHCP服务来允许使用/var/lib/tftpboot/pxelinux.0启动。
##这段代码是为 DHCP 服务器配置文件 dhcpd.conf 中的一个子网设置参数。它的作用包括：
##allow booting; 和 allow bootp;：允许客户端进行网络引导和 BOOTP（Bootstrap Protocol）请求。
##subnet 192.168.72.0 netmask 255.255.255.0 { ... }：定义了一个子网范围，IP 地址范围为 192.168.72.0/24。
##range 192.168.72.220 192.168.72.240;：指定 DHCP 服务器可以分配的 IP 地址范围。
##option broadcast-address 192.168.72.255;：设置广播地址。
##option routers 192.168.72.2;：指定默认网关的 IP 地址。
##filename "/pxelinux.0";：为启动的客户端指定一个引导程序文件，通常用于网络引导。
##这段配置帮助 DHCP 服务器为网络中的客户端提供 IP 地址，并支持网络引导功能。
############################################################################################################

##### 4.配置nfs服务器

```
#创建一个保存客户机根文件系统目录的文件夹。
mkdir /nfsroot

#设置NFS服务器导出客户机根文件系统。向/etc/exports添加以下行来实现。

vim /etc/exports

/nfsroot *(rw,sync,crossmnt,no_root_squash,no_subtree_check)

#运行下列命令来重新载入修改过的/etc/exports。
sudo exportfs -rv
#检查
sudo exportfs
```
#################################################################################################
以下是对上述命令的解释

#这些命令用于配置和管理 NFS（网络文件系统）服务器的导出设置。

#vim /etc/exports：

打开 /etc/exports 文件进行编辑。这个文件用于定义 NFS 服务器上哪些目录被导出给客户端以及访问权限。
/nfsroot *(rw,sync,crossmnt,no_root_squash,no_subtree_check)：

导出 /nfsroot 目录给所有客户端（*）。
rw：客户端具有读写权限。
sync：服务器同步写操作。
crossmnt：允许跨挂载点的文件系统挂载。
no_root_squash：客户端的 root 用户在服务器上也以 root 用户身份访问。
no_subtree_check：不检查子目录的变更。
exportfs -rv：

#exportfs 命令用于更新 NFS 导出表。-r 选项重新导出所有目录，-v 选项显示详细输出。
#exportfs：

显示当前导出的文件系统和它们的挂载点。可以用来检查 /etc/exports 的更改是否生效。
######################################################################################################333

##### 5.配置pxe引导文件，内核文件，启动镜像

###### 5.1配置pxe引导文件

```
#创建一个启动文件夹
sudo mkdir -p /var/lib/tftpboot/pxelinux.cfg

#复制引导程序镜像。
Ubuntu 14.04：
cp /usr/lib/syslinux/pxelinux.0 /tftpboot

Ubuntu 14.04 after:
apt install pxelinux
cp /usr/lib/PXELINUX/pxelinux.0 /var/lib/tftpboot
```

###### 5.2配置内核

```
#复制内核文件到tftp 服务器上
cp /boot/vmlinuz-5.4.0-42-generic  /var/lib/tftpboot/
cp /boot/initrd.img-5.4.0-42-generic /var/lib/tftpboot/                    //////////////////////////////initrd.img-4.15.0-156-generic   vmlinuz-4.15.0-156-generic
```
#############################################################################
以下是对上述命令的解释
vmlinuz-5.4.0-42-generic 是压缩过的内核映像文件。
initrd.img-5.4.0-42-generic 是初始化 RAM 磁盘映像文件，包含在系统启动时需要的驱动程序和工具。
###################################################################################
###### 5.3配置pxe启动菜单

```
#像下面这样创建一个默认启动配置文件。
vim /var/lib/tftpboot/pxelinux.cfg/default
长度
default vesamenu.c32
display boot.msg
timeout 600
prompt 1
menu background splash.png
menu title Please select the version of the system you want to boot without a disk
menu color border 0 #ffffffff #00000000


label centos-7.6.1810
kernel vmlinuz-3.10.0-1062.el7.x86_64
append initrd=initramfs-3.10.0-1062.el7.x86_64.img root=nfs:192.168.72.132:/pxeserver/models/work selinux=0 ip=dhcp rw nomodeset  vga=0x314    #要更换成自己真实的ip地址。
                                                                                                                                               # 即"192.168.72.132需要全部更换

LABEL Ubuntu-18.04 LTS
KERNEL vmlinuz-5.4.0-42-generic
APPEND root=/dev/nfs initrd=initrd.img-5.4.0-42-generic  nfsroot=192.168.72.139:/nfsroot ip=dhcp rw                                      #要更换成自己真实的ip地址。
                                                                                                                                        # 即"192.168.72.132需要全部更换



####"root=/dev/nfs"表示服务器上的网络文件系统（不需要修改）。
####"initrd=initrd.img"是一个用于系统启动的启动脚本。
####"nfsroot=10.10.101.1/nfsroot"指明了服务器的IP地址以及NFS共享文件夹的名称。用你的服务器地址来替换掉IP地址。
####"ip=dhcp"表示客户端电脑使用DHCP寻址方案。
####"rw"表示NFS共享是可读/可写的。

############################################################################################################
以下是对上述内容的详细解释
这段配置文件的作用是为 PXE 网络启动设置菜单。具体功能包括：

default vesamenu.c32：指定默认的启动菜单界面。
display boot.msg：显示 boot.msg 文件中的信息。
timeout 600：设置菜单显示时间为 600 秒（10 分钟）。
prompt 1：启用提示用户选择启动选项。
menu background splash.png：设置菜单背景图片为 splash.png。
menu title Please select the version of the system you want to boot without a disk：设置菜单标题。
这些配置选项用于定制 PXE 启动菜单的外观和行为。

LABEL Ubuntu-18.04 LTS：定义了一个启动菜单项的名称或标签，用户在启动菜单中选择此项时将启动 Ubuntu 18.04。
KERNEL vmlinuz-5.4.0-42-generic：指定内核映像文件的位置。
APPEND root=/dev/nfs initrd=initrd.img-5.4.0-42-generic：指定初始化 RAM 磁盘映像文件的位置，并将根文件系统设为 NFS。
nfsroot=192.168.72.139:/nfsroot：指定根文件系统的位置，通过 NFS 从 192.168.72.139 服务器的 /nfsroot 目录加载。
ip=dhcp：使用 DHCP 自动配置网络设置。
rw：以读写模式挂载根文件系统。
总结
这段代码用于 PXE 网络启动配置文件，允许系统通过网络从指定服务器加载操作系统。label 定义了启动菜单中的选项，kernel 和 initrd 指定了内核和初始化 RAM 磁盘文件的位置，append 则用于附加启动参数，如 NFS 根文件系统的路径和网络设置。
###############################################################################################################

#复制以下文件至/var/lib/tftpboot
ldlinux.c32 splash.png libcom32.c32 vesamenu.c32 libutil.c32#####这些文件在/usr/lib/syslinux/modules/bios目录下
```


##### 6.配置客户端操作系统，文件系统

```
mkdir /nfsroot
#使用debootstrap制作基本系统
sudo debootstrap --arch=amd64 bionic '/nfsroot' http://mirrors.tuna.tsinghua.edu.cn/ubuntu
#进入文件夹系统
sudo chroot /nfsroot
#修改软件源，基本系统默认只包含一个main软件源，日常使用的话还需要添加其他软件源如universe等。编辑/etc/apt/sources.list添加软件源：

vim /etc/apt/sources.list
=================sources.list==================

deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal main restricted universe multiverse

deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal main restricted universe multiverse

deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-updates main restricted universe multiverse

deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-updates main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-backports main restricted universe multiverse

deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-backports main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-security main restricted universe multiverse

deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-security main restricted universe multiverse




#安装内核，目前我们的无盘系统是通过chroot运行在当前操作系统内核的，因此我们还需要构建自己的内核，提供给网络启动

apt dist-upgrade
apt install linux-image-generic


#Grub无法安装，Yes即可

#修改initramfs配置，此时我们需要修改initramfs配置文
件，配置其使用nfs方式加载根文件系统


vim /etc/initramfs-tools/initramfs.conf

NFSROOT=192.168.72.139:/nfsroot
                                                                              //////////需要更换成自己真实的IP地址

#然后执行更新initramfs命令：
update-initramfs -u

#fstab是linux系统加载时自动挂载文件系统的配置文件。配置此文件以自动挂载根文件系统。
##修改为以下配置：#
vim /etc/fstab

proc /proc proc defaults 0 0
192.168.72.139:/nfsroot / nfs defaults,rw 0 0    
                                                               //////////需要更换成自己真实的IP地址

#修改hostname
vim /etc/hostname

#修改/boot权限
##无盘系统的linux内核文件放在/boot文件夹，其中内核文件(vmlinuz-xxx)的权限默认为700，即非root用户不可读。如果将其配置到pxe启动，可能会因为权限不足无法读取而导致无法启动。因此建议将权限改为755
chmod 755 /boot -R

#配置root密码
##如果不配置root密码，可能导致无法进入系统，因为一般不允许空密码登录
passwd

#设置时区：
tzselect

#安装桌面环境
apt install ubuntu-desktop

#添加用户 -
groupadd admin
useradd -g admin -m guoshaosong
passwd guoshaosong

#设置语言
export LC_ALL=C
perl -e 'print "hello angus"'
exit

chmod -R 777 /var/lib/tftpboot
```

