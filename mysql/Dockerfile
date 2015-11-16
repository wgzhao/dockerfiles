FROM centos:base
RUN rpm -ivh http://repo.percona.com/release/centos/6/RPMS/x86_64/percona-release-0.1-3.noarch.rpm
RUN yum install -y  Percona-Server-{server,shared,client}-56-*.rpm nginx php php-fpm php-mysql
RUN rm -rf /var/lib/mysql/*
RUN yum clean all
COPY run.sh /run.sh
COPY 0default.conf /etc/nginx/conf.d/0default.conf
COPY phpmyadmin.zip /var/www/html/
RUN  cd /var/www/html && unzip phpmyadmin.zip 
RUN chmod +x /run.sh
EXPOSE 3306 22
ENTRYPOINT /run.sh
