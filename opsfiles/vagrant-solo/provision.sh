#!/bin/bash

set -x 

# : "update apt" & {
: "update apt" || {
apt-get -y update
apt-get -y upgrade
}


# : "ansible update" & {
: "ansible update" || {
apt-get -y install software-properties-common
apt-add-repository -y ppa:ansible/ansible
apt-get -y update
apt-get -y remove ansible
apt-get -y install ansible
}

: "ansible-playbook ssh" & {
# : "ansible-playbook ssh" || {
chmod 600 ssh/id_rsa-elasticsearch
ansible-playbook --private-key='ssh/id_rsa-elasticsearch' -i playbook/vagrant playbook/site.yml
# ansible-playbook -vvv --private-key='ssh/id_rsa-elasticsearch' -i playbook/vagrant playbook/site.yml
}

: "check serverspec" & {
# : "check serverspec" || {
### dry-run
rake spec -n
rake spec -vt
}





