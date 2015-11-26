# 基本系统
基本系统基于官方`centos:6.6`做了一下修改

## 增加的软件包

- hostname
- net-tools
- sudo
- unzip
- wget
- openssh-server

## 增加创建帐号给你

运行该镜像，创建的root帐号设置了默认密码为`3xdata123`。另外，可以在运行时传递下面三个参数来创建一个具有`sudo`权限的帐号
- MY_USER  账号名
- MY_PASSWORD 密码
- MY_KEY 帐号的公钥

其中`MY_KEY`和`MY_PASSWORD`是可选参数。

## 增加SSH远程登录功能

为了方便管理，增加了SSH远程登录功能，且默认允许`root` 帐号登录
