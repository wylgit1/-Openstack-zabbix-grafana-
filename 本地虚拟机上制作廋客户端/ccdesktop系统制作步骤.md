# 一、ccdesktop脚本配置

``` 
准备工作：ubuntu18.04系统
将脚本文件移动至相应文件夹
/etc/下：
	vdlinux.remmina
	vdwin.remmina

	pcddiscon.sh
	pcdstartx
	
	pcd.sh
	test.sh
/usr/bin/下：
	input_mip.py
	vmm_ip.txt
	clientInfo.py
	user.py
	password.txt
	username.txt
	
	login_token.py
	login_hostlist.py
	loginip.txt
	logintype.txt

	login_ip.py
	login_type.py

开机自启动时，将test.sh文件移动到/etc/profile.d/目录下，并且关闭图形化界面，重启
关闭图形化界面：
	systemctl set-default multi-user.target
开启图形化界面：
	systemctl set-default graphical.target 

```

# 二、开机自动登录

``` 
ubuntu18.04已经不再使用initd管理系统,改用systemd了
所以之前的修改方式都没用了，可参考Centos7的设置。
tty配置文件在 /etc/systemd/system/getty.target.wants/getty@tty1.service
不过这个是软连接，连接到/lib/systemd/system/getty@.service
所以最好先备份一下/lib/systemd/system/getty@.service文件
修改/lib/systemd/system/getty@.service文件
注释掉此行 ExecStart=-/sbin/agetty -o '-p -- \\u' --noclear %I $TERM
添加:
ExecStart=-/sbin/agetty --autologin root --noclear %I $TERM
重启看看就可自动登录root账户
```



# 二、远程协议安装

```
下载最新的remmina(只有最新的remmina才有spice协议支持)
https://launchpad.net/~remmina-ppa-team/+archive/ubuntu/remmina-next
安装spice协议插件
```




####下面的操作需要借助树莓派进行，以下功能根据个人能力进行，可以不用实现

# 三、usb自动挂载

```
usbmount是一个完善的USB自动挂载卸载工具，只需要修改一些配置文件即可使用。但是NTFS格式的U盘需要做一些改动，将ntfs添加到usbmount。
（1）安装
	安装usbmount： sudo apt-get install usbmount
	安装NTFS驱动程序包ntfs-3g：sudo apt-get install ntfs-3g
（2）配置usbmount
	sudo vim /etc/usbmount/usbmount.conf
	有一行叫FILESYSTEMS=""。仅通过usbmount挂载此行中指定的文件系统，因此我们将其更改为：		    FILESYSTEMS="vfat ntfs fuseblk ext2 ext3 ext4 hfsplus" 如果要使用usbmount挂载NTFS文件系统，请确保将ntfs和fuseblk添加到该行。如果您未在配置中添加fuseblk，则拔出的NTFS设备将不会自动卸载。它们将保持挂载状态并保留其挂载文件夹，直到手动卸载。
	下一条是FS_MOUNTOPTIONS=""。在这里，指定应挂载哪些文件系统以及如何挂载它们。
	我们将其更改为： FS_MOUNTOPTIONS="-fstype=ntfs-3g,nls=utf8,umask=007,gid=46 -fstype=fuseblk,nls=utf8,umask=007,gid=46 -fstype=vfat,gid=1000,uid=1000,umask=007"
(3)保持NTFS挂载，直到拔出设备
	当已安装的NTFS驱动器只能访问几秒钟时，下面是该问题的解决方案。
	A.创建文件usbmount.rules在/etc/udev/rules.d/下，
		sudo vim /etc/udev/rules.d/usbmount.rules。
		内容如下：
KERNEL=="sd*", DRIVERS=="sbp2",         ACTION=="add",  PROGRAM="/bin/systemd-escape -p --template=usbmount@.service $env{DEVNAME}", ENV{SYSTEMD_WANTS}+="%c"
KERNEL=="sd*", SUBSYSTEMS=="usb",       ACTION=="add",  PROGRAM="/bin/systemd-escape -p --template=usbmount@.service $env{DEVNAME}", ENV{SYSTEMD_WANTS}+="%c"
KERNEL=="ub*", SUBSYSTEMS=="usb",       ACTION=="add",  PROGRAM="/bin/systemd-escape -p --template=usbmount@.service $env{DEVNAME}", ENV{SYSTEMD_WANTS}+="%c"
KERNEL=="sd*",                          ACTION=="remove",       RUN+="/usr/share/usbmount/usbmount remove"
KERNEL=="ub*",                          ACTION=="remove",       RUN+="/usr/share/usbmount/usbmount remove"
	B.创建usbmount@.service
		sudo vim /etc/systemd/system/usbmount@.service
	内容如下：
    [Unit]
    BindTo=%i.device
    After=%i.device

    [Service]
    Type=oneshot
    TimeoutStartSec=0
    Environment=DEVNAME=%I
    ExecStart=/usr/share/usbmount/usbmount add
    RemainAfterExit=yes
    
    现在就可以完美实现ntfs格式usb挂载
    注意：
    新版本的udev可能会遇到mount失效的问题，udev的rules运行于独立的文件空间上，与用户的文件空间不同，因此及时挂载上了，用户也无法访问。因此需要将udev的运行方式改为共享。
    修改方式如下：
        vim /lib/systemd/system/systemd-udevd.service
        // 修改
        MountFlags=shared 
```



# 四、修改开机启动界面

``` 
	ubuntu启动时，会有一个ubuntu字样出现在屏幕，文字下方有闪烁的点，这时按ESC可以在动画和文字界面之间切换。这一步骤不属于lightdm，而是一个叫 plymouth 的进程在起作用。实际上，plymouth的意义就在于，在开机到图形桌面 (lightdm)起来这段时间里展示出一个动画，从而提高用户体验。
	Ubuntu的plymouth设定文件放在/lib/plymouth目录内，与主题相关的设定文件放置于/lib/plymouth/theme，设定主题样式文件为default.plymouth。其内容大致如下：
    [Plymouth Theme]

    Name=Ubuntu Logo

    Description=A theme that features a blank background with a logo.

    ModuleName=script


    [script]

    ImageDir=/lib/plymouth/themes/ubuntu-logo

    ScriptFile=/lib/plymouth/themes/ubuntu-logo/ubuntu-logo.script
第一部分[Plymouth Theme]中的 ModuleName指示plymouth载入它的script.so模组处理主题。基本上这一部分的内容是固定不变的。
第二部分[script]就是配合script.so模组的设定项目。

1、快速修改

如果你只是要简单的修改一下开机时的背景或者是ubuntu的logo，那只要找相应的图片，把它复制到/lib/plymouth/themes/ubuntu_logo目录下替换掉原先的ubuntu_logo.png即可（注意，一定要是png的图片格式，不然的话开机后可能什么都不显示），当然如果你想修改进入系统时下面加载的小圆点，也只要找来相对的两张图片替换掉原来的就可以了。

2、自定义修改

如果你想要自行设计开机动画，可以在/lib/plymouth/themes下建立一个子目录，比如my-theme，将ubuntu-logo/ubuntu-logo.plymouthu与ubuntu-logo-logo.script复制过去，在将你准备好的图片也复制过去。接着修改/etc/alternatives/defaute.plymouth的符号链接目标为你的plymouth.
```



# 五、系统中文乱码问题

``` 
用zhcon包来解决这个问题的办法
https://jingyan.baidu.com/article/14bd256e663254bb6d26120d.html
将zhcon  --utf8加在test.sh脚本的最后
```

# 六、自动部署以上功能

```
将“ccdesktop_init_源文件”中内容复制到需要制作启动镜像的Linux系统中，运行"ccdesktop_init.sh"脚本就可一键部署启动进行所需的功能。
```

