#!/bin/bash

BASEPATH=$(cd `dirname $0`; pwd)

### install java
wget --no-check-certificate --no-cookies - --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u45-b14/jdk-8u45-linux-x64.rpm
# cd /develop/dev.es
rpm -Uhv jdk-8u45-linux-x64.rpm

### sleep 5
### 
### ### check version java
### java -version
 
### Download and install the public signing key
rpm --import https://packages.elastic.co/GPG-KEY-elasticsearch

file='/etc/yum.repos.d/es.repo'
touch ${file}

cat << __EOF__ >> ${file}
[elasticsearch-1.7]
name=Elasticsearch repository for 1.7.x packages
baseurl=http://packages.elastic.co/elasticsearch/1.7/centos
gpgcheck=1
gpgkey=http://packages.elastic.co/GPG-KEY-elasticsearch
enabled=1 
__EOF__


### install elasticsearch
yum install -y elasticsearch
service        elasticsearch start
chkconfig      elasticsearch on

sleep 15

curl -X GET http://localhost:9200


exit
