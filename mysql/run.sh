#!/bin/bash
#mysql server
if [ -n "$MYSQL_PASSWORD" ];then
    passwd=$MYSQL_PASSWORD
else
    passwd='dbaas123'
fi
if [ -d /var/lib/mysql/mysql ];then
        #has initialized,run it directly
        #/usr/share/percona-server/mysql.server start
    service mysql start
else
    #create defualt my.cnf
    id=$(( $RANDOM  % 1024 ))
    echo """[mysqld]
log-bin=mysql-bin
binlog_format = ROW
server-id       = $id
port     = 3306
log-slave-updates = 1
gtid_mode = ON
enforce-gtid-consistency = 1
    """ >/etc/my.cnf

    #initilize first
    mysql_install_db  --user=mysql
    #/usr/share/percona-server/mysql.server start
    service mysql start
    #create password
    if [ "x$MYSQL_SLAVE" = "x1" ] && [ "x$MYSQL_MASTER_IP" != 'x' ];then
            #create slave
						if [ -n "$MYSQL_MASTER_PORT "];then
							mysql_master_port = $MYSQL_MASTER_PORT
						else
							mysql_master_port = 3306
						fi
						#set the instance is read-only
						echo "read_only  = 1 " >>/etc/my.cnf
            echo "create mysql slave"
						mysql -e "set @@global.read_only = 1"
            mysql -e "change master to master_user='repl',master_password='repl123',master_host='$MYSQL_MASTER_IP',master_port=$mysql_master_port,master_auto_position=1"
            mysql -e "start slave"
    else
			#create default replication account
			mysql -e "grant replication on *.* to 'repl'@'%' identified by 'repl123';"
      mysql -e "delete from mysql.user where User = ''"
      mysql -e "update mysql.user set Password = password('$passwd');flush privileges;"
    fi
fi


# php-fpm
service php-fpm start

# nginx
service nginx start

# sshd
/usr/sbin/sshd -D
