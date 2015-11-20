FROM centos:base
RUN wget -O /opt/apache-tomcat-7.0.65.zip http://apache.fayea.com/tomcat/tomcat-7/v7.0.65/bin/apache-tomcat-7.0.65.zip
RUN yum install -y https://mirror.its.sfu.ca/mirror/CentOS-Third-Party/NSG/common/x86_64/jdk-8u66-linux-x64.rpm
RUN cd /opt; unzip apache-tomcat-7.0.65.zip; ln -sf apache-tomcat-7.0.65 tomcat
RUN chmod +x /opt/tomcat/bin/*.sh
COPY run.sh /run.sh
RUN chmod +x /run.sh
EXPOSE 22 8080
ENTRYPOINT /run.sh
