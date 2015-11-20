FROM centos:base
MAINTAINER  3x-data information techonology Co, Ltd. - wgzhao
RUN rpm -ivh http://repo.percona.com/release/centos/6/RPMS/x86_64/percona-release-0.1-3.noarch.rpm
RUN rpm -ivh https://mirror.webtatic.com/yum/el6/latest.rpm
RUN yum install -y  Percona-Server-{server,shared,client}-56-* php56w php56w-fpm php56w-mysqlnd php56w-mbstring nginx18
RUN rm -rf /var/lib/mysql/*
RUN yum clean all && rm -f /etc/nginx/conf.d/*.conf
COPY run.sh /run.sh
COPY 0default.conf /etc/nginx/conf.d/0default.conf
COPY phpmyadmin.zip /var/www/html/
RUN  cd /var/www/html && unzip phpmyadmin.zip && rm -f phpmyadmin.zip
RUN chmod +x /run.sh
EXPOSE 3306 22
ENTRYPOINT /run.sh
