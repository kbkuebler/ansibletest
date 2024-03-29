#!/usr/bin/env bash

# This is only to be used as a prep for the Pure Test Drive Environment
# It will install the most optimal Python3 version, as well as set up Ansible.
# Brian Kuebler 9/7/20

set -o errexit
set -o nounset
set -o pipefail

#Call for any external install files
kubesprayinstall="./installKubernetes.sh"     #get the most recent \
                                                #kubesprayinstall
ansibleinstall="./installAnsible.sh"
# Install necessary packages. Currently, only python2 installed.

echo " "
echo " "
echo "#############################################################"
echo " "
echo " "
function installPackages() {
  #install all required Linux packages
  APACKG=( epel-release
           python3 python3-pip
           centos-release-ansible-29
           ansible
           vim
           python2-jmespath )

  echo "##########################################"
  echo "####  Installing Python3 and Ansible  ####"
  echo "##########################################"
  echo " " 

  for pkg in "${APACKG[@]}";do
      if yum -q list installed "$pkg" > /dev/null 2>&1; then
          echo -e "$pkg is already installed"
      else
          yum install "$pkg" -y && echo "Successfully installed $pkg"
      fi
  done

#You don't need to use these, but they can help with less typing.

  echo "" >> ~/.bashrc
  echo "alias ap='ansible-playbook'" >> ~/.bashrc
  echo "alias P='cd ~/ansibletest/Playbooks'" >> ~/.bashrc

}

function installAnsible() {
  #statements
  if [[ -f $ansibleinstall ]]; then
    echo "will run file $ansibleinstall"
    $ansibleinstall
  else
    echo "Please check to make sure that $kubesprayinstall exists"
  fi
}



#Let's run everything
installPackages
installAnsible


sleep 3
echo " "
echo "Installation complete. Run 'source .bashrc'\
 in order to use new aliases."
echo " "
