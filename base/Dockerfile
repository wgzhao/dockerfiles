FROM centos:base
FROM dl.dockerpool.com:5000/centos
RUN yum install -y epel-release
RUN sed -i 's/^mirrorlist/#mirrorlist/g;s/#baseurl/baseurl/g;s/download.fedoraproject.org\/pub/mirrors.aliyun.com/g' /etc/yum.repos.d/epel.repo
RUN yum install -y hostname net-tools unzip
COPY run.sh /run.sh
RUN chmod +x /run.sh
ENTRYPOINT /run.sh
