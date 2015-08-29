FROM centos:base
RUN yum install -y unzip
COPY apache-tomcat-7.0.64.zip /opt/apache-tomcat-7.0.64.zip
COPY jdk-7u80-linux-x64.rpm /root/jdk-7u80-linux-x64.rpm
RUN rpm -ivh /root/jdk-7u80-linux-x64.rpm
RUN cd /opt; unzip apache-tomcat-7.0.64.zip; ln -sf apache-tomcat-7.0.64 tomcat
RUN chmod +x /opt/tomcat/bin/*.sh
COPY run.sh /run.sh
RUN chmod +x /run.sh
EXPOSE 22 8080
ENTRYPOINT /run.sh
