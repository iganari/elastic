#!/bin/bash


cat << __EOF__ >> /etc/yum.repos.d/kibana.repo
[kibana-4.5]
name=Kibana repository for 4.5.x packages
baseurl=http://packages.elastic.co/kibana/4.5/centos
gpgcheck=1
gpgkey=http://packages.elastic.co/GPG-KEY-elasticsearch
enabled=1
__EOF__

yum install -y kibana

service kibana start
chkconfig --add kibana

echo "http://localhost:5601"
