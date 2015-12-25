#!/bin/bash

PRIVATEIP=`cat /etc/sysconfig/network-scripts/ifcfg-eth1 | grep "IPADDR" | cut -d\= -f2`


yum install -y unzip
wget https://github.com/stormpython/Elasticsearch-datasets/archive/master.zip
unzip master.zip
cd Elasticsearch-datasets-master/

curl -XPOST ${PRIVATEIP}:9200/test_index
curl -XPUT  ${PRIVATEIP}:9200/test_index/2013/_mapping -d @mappings/nfl_mapping.json
curl -XPOST ${PRIVATEIP}:9200/test_index/2013/_bulk --data-binary @datasets/nfl_2013.json > /dev/null

cd ../
rm -rf master.zip
rm -rf Elasticsearch-datasets-master
