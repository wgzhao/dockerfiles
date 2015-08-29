FROM centos:base
RUN yum install -y memcached
COPY run.sh /run.sh
RUN chmod +x /run.sh
EXPOSE 22 10001
ENTRYPOINT /run.sh
