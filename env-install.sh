#!/bin/bash

### define
BASEPATH=$(cd `dirname $0`; pwd)
SCRPATH='/develop/dev.es'
JDKFILE='jdk-8u45-linux-x64.rpm'

### install java
if [ -f ${SCRPATH}/${JDKFILE} ]; then
  ### when jdk exicts in local
  echo 'wget skip'
else
  ### when jdk does not exist in local
  wget --no-check-certificate --no-cookies - --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u45-b14/jdk-8u45-linux-x64.rpm
  cp -f /home/vagrant/${JDKFILE} ${SCRPATH}/opsfiles/jdk/
  ### /home/vagrantに保存される

fi

rpm -Uhv ${JDKFILE}



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


### install plugin
cd /usr/share/elasticsearch

array=(
       'mobz/elasticsearch-head'
       'elasticsearch/elasticsearch-analysis-kuromoji/2.7.0'
       'royrusso/elasticsearch-HQ'
       )

for i in ${array[@]}
  do
    bin/plugin -install ${i}
  done

service elasticsearch restart

exit
