#!/bin/bash

set -x 

apt_install_ansible()
{
  ### input grub-pc setting
  echo "set grub-pc/install_devices /dev/sda" | debconf-communicate
  
  ### update ubuntu
  apt-get install -f
  
  ### install ansible 
  # vivid is Ubuntu 15.4, wily is 15.10, xenial is 16.04 
  CODENAME='xenial'
  apt install -y software-properties-common
  apt-add-repository ppa:ansible/ansible
  apt update
  apt install -y ansible  
}

if [ "${1}" = 'local' ]; then
  ### install ansible
  apt_install_ansible

  ### ansible-playbook ssh
  playbook_dir='/opt/es-cluster/opsfiles/vagrant/playbook'
  ansible-playbook        -i ${playbook_dir}/local ${playbook_dir}/webserver-elasticsearch.yml

  # # Force restart mysql
  # sleep 30
  # echo -e "\n\n Force restart mysql \n\n"
  # /etc/init.d/mysql restart
  
elif [ "${1}" = 'staging' ]; then
  KEY='id_rsa-elasticsearch'
  chmod 600 ssh/${KEY}
  ansible-playbook  --private-key="ssh/${KEY}" -i staging playbook/webserver-elasticsearch.yml

  # # Force restart mysql
  # sleep 30
  # IP=`cat staging | sed -n 2P`
  # ssh -i ssh/${KEY} root@${IP} '/etc/init.d/mysql restart'

else
  echo 'you must type local or staging'
fi
