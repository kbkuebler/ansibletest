#!/bin/bash

yum -y install python3
yum -y install python3-pip

yum -y install centos-release-ansible-29
yum -y install ansible
yum -y install vim

pip3 install purestorage

sleep 1

ansible-galaxy collection install purestorage.flasharray

#make sure that we change the interpreter to python3!
#this is from the testing branch
#added while testing is checked out
