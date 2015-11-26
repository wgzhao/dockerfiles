FROM centos:6.6
MAINTAINER  3x-data information techonology Co, Ltd. - wgzhao
RUN yum install -y epel-release
RUN sed -i 's/^mirrorlist/#mirrorlist/g;s/#baseurl/baseurl/g;s/download.fedoraproject.org\/pub/mirrors.aliyun.com/g;s/mirror.centos.org/mirrors.aliyun.com/g' /etc/yum.repos.d/epel.repo
RUN yum clean all && yum install -y hostname net-tools sudo unzip wget openssh-server
RUN echo 'root:3xdata123' |chpasswd
#setting sshd
RUN sed -i 's/PermitRootLogin no/PermitRootLogin yes/g;s/^#PermitRootLogin/PermitRootLogin/g' /etc/ssh/sshd_config
# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd
# create necessary key
RUN ssh-keygen -q -t rsa -f /etc/ssh/ssh_host_rsa_key -C '' -N ''
RUN ssh-keygen -q -t rsa1 -f /etc/ssh/ssh_host_key -C '' -N ''
RUN ssh-keygen -q -t dsa  -f /etc/ssh/ssh_host_dsa_key -C '' -N ''

COPY run.sh /run.sh
RUN chmod +x /run.sh
EXPOSE 22
ENTRYPOINT /run.sh
