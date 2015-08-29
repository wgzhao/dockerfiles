#!/bin/bash
#mysql server
if [ -d /var/lib/mysql/mysql ];then
	#has initialized,run it directly
	/usr/share/percona-server/mysql.server start
else
	#create defualt my.cnf
	id=$(( $RANDOM  % 1024 ))
	echo """
[mysqld]
log-bin=mysql-bin
binlog_format = ROW
server-id	= $id
port	 = 3306
log-slave-updates = 1
gtid_mode = ON
enforce-gtid-consistency = 1
	""" >/etc/my.cnf
	
	#initilize first
	mysql_install_db  --user=mysql 
	/usr/share/percona-server/mysql.server start
	#create password
	if [ "x$MYSQL_SLAVE" = "x1" ] && [ "x$MYSQL_MASTER_IP" != 'x' ];then
		#create slave
		echo "create mysql slave"
		mysql -e "change master to master_user='repl',master_password='repl',master_host='$MYSQL_MASTER_IP',master_port=3306,master_auto_position=1"
		mysql -e "start slave"
	else
		mysql -e "create user 'root'@'%' identified by 'password';"
		mysql -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;"
		echo "your can login datbase with mysql -uroot -ppassword -h<host> -P<port>"
	fi
fi

# sshd
/usr/sbin/sshd -D