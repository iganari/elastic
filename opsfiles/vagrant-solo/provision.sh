#!/bin/bash

set -x 

: "update yum" & {
yum upgrade -y
yum install -y epel-release
}

: "ansible install" & {
yum install -y ansible --enablerepo=epel-testing
}

: "ansible-playbook" & {
# : "ansible-playbook ssh" || {
PLAYBOOK_PATH='/opt/es-solo/opsfiles/vagrant-solo/playbook'
source ~/.bash_profile
/usr/bin/ansible-playbook  -i ${PLAYBOOK_PATH}/vagrant ${PLAYBOOK_PATH}/site.yml
}

# : "check serverspec" & {
: "check serverspec" || {
### dry-run
rake spec -n
rake spec -vt
}
