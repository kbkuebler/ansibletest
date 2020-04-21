#!/bin/bash
#This is only to be used as a prep for the Pure Test Drive Environment
#Brian Kuebler 4/17/20

#Install necessary packages, only python2 installed

APACKG=( epel-release python3 python3-pip centos-release-ansible-29 ansible vim )
HNAME=$(hostname)


echo "####  Installing Python3 and Ansible  ####"

for pkg in "${APACKG[@]}";do
    if yum -q list installed "$pkg" > /dev/null 2&>1; then
        echo -e "$pkg is already installed"
    else
        yum install "$pkg" -y && echo "Successfully installed $pkg"
    fi
done



#Install SDK 

echo "####  Installing the Pure Storage SDK  ####"
pip3 install purestorage

#Install the Pure Storage collection

echo "#### Installing the Purestorage Ansible Collection  ####"

ansible-galaxy collection install purestorage.flasharray

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

#We need to change the hostname of this host. Note that it's "linux" on the FA
# and it's "Linux" on the host. 

echo "#### Changing hostname ####"

echo "linux" > /etc/hostname
systemctl restart systemd-hostnamed


for lname in 'linux';do
    if [ "$HNAME" = "$lname" ]; then
        echo "Hostname is linux, matches FlashArray."
    else
        echo "Hostname still needs to be changed!"
    fi
done
