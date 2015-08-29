#!/bin/bash
#run tomcat
/opt/tomcat/bin/startup.sh
#run openssh server
/usr/sbin/sshd -D
