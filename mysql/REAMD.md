# mysql 5.6 说明
## 说明
mysql 5.6 使用[Percona](http://www.percona.com) 发型版本，当前使用的版本为`5.6.27-75.0`。并内置[phpmyadmin](http://www.phpmyadmin.net)管理界面。

## 运行

`docker run -tid -P dbaas:mysql5.6`
启动后，默认开启三个端口，分别为SSH端口(22)，数据库端口(3306)以及基于WEB的数据库管理端口(80)，类似如下：
`0.0.0.0:49163->22/tcp, 0.0.0.0:49164->3306/tcp, 0.0.0.0:49165->80/tcp`
数据库的管理密码可以通过运行时传递(下面描述),否则采取默认的密码为`dbaas123`

## 参数

启动该镜像是可以传递一些参数来改变状态，目前支持的环境变量参数有
- MYSQL_PASSWORD 指定MySQL的root帐号密码
- MYSQL_SLAVE 否则设置该MySQL服务为slave，如果设定了该参数，还需要设定下面的两个参数才有效
- MYSQL_MASTER_IP MySQL Master 服务器的IP地址
- MYSQL_MASTER_PORT MySQL Master 服务的端口，默认为3306

一个完整的例子为:

`docker run -tid MYSQL_MASTER_IP=192.168.1.100 MYSQL_MASTER_PORT=3307`
