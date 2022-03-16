FROM --platform=amd64 centos:7

RUN yum install -y krb5-workstation krb5-server && yum clean all

EXPOSE 88

CMD ["/usr/sbin/krb5kdc", "-P", "/var/run/krb5kdc.pid", "-w", "32"]
