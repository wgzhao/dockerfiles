FROM centos:base
COPY percona-server.tar /root/percona-server.tar
RUN yum install -y tar epel-release
RUN sed -i 's/^mirrorlist/#mirrorlist/g;s/#baseurl/baseurl/g;s/download.fedoraproject.org\/pub/mirrors.aliyun.com/g' /etc/yum.repos.d/epel.repo
RUN tar -xf /root/percona-server.tar -C /root
RUN yum localinstall -y  /root/Percona-Server-*.rpm
RUN rm -rf /var/lib/mysql/*
RUN rm -rf /root/Percona-Server-*.rpm /root/percona-server.tar
COPY run.sh /run.sh
RUN chmod +x /run.sh
EXPOSE 3306 22
ENTRYPOINT /run.sh
