#!/bin/bash
#This is only to be used as a prep for the Pure Test Drive Environment
#Brian Kuebler 4/17/20

#Install necessary packages, only python2 installed
echo "####  Installing Python3 and Ansible  ####"
yum -y install epel-release
yum -y install python3
yum -y install python3-pip

yum -y install centos-release-ansible-29
yum -y install ansible
yum -y install vim
sleep 1

#Install SDK 
echo "####  Installing the Pure Storage SDK  ####"
pip3 install purestorage

#Install the Pure Storage collection

echo "#### Installing the Purestorage Ansible Collection  ####"

ansible-galaxy collection install purestorage.flasharray

<<<<<<< HEAD
echo "####  Making VIM feel right ####"
cat << 'EOF' >> ~/.vimrc
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
colo elflord                " set colorscheme
syntax on               " syntax highlighing on
set expandtab           " tabs are spaces
set softtabstop=4       " number of spaces in tab when editing
set tabstop=4           " number of visual spaces per TAB
EOF

=======
#make sure that we change the interpreter to python3!
#this is from the testing branch
#added while testing is checked out
>>>>>>> 715890b74b375ac3f35d277d0461c4499258cb85
