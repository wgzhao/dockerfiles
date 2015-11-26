#!/bin/bash
if [ -n "$MY_USER" ];then
  #create normal user
  useradd $MY_USER
  #add it to sudoer
  echo "$MY_USER        ALL=(ALL)       NOPASSWD: ALL" >/etc/sudoers.d/$MY_USER
  if [ -n "$MY_PASSWORD" ];then
    echo "$MY_USER:$MY_PASSWORD" |chpasswd
  fi
  if [ -n "$MY_KEY" ];then
    #add ssh key
    d=$(getent  passwd $MY_USER  |cut -d: -f6)
    mkdir $d/.ssh
    chmod 700 $d/.ssh
    echo $MY_KEY > $d/.ssh/authorized_keys
    chmod 600 $d/.ssh/authorized_keys
    chown -R $MY_USER:$MY_USER $d/.ssh
  fi
fi
#run openssh server
/usr/sbin/sshd -D
