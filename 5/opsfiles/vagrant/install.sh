#!/bin/bash

es_data='elasticsearch-5.0.2'

cd /var/lib
curl -L -O https://artifacts.elastic.co/downloads/elasticsearch/${es_data}.tar.gz
tar zxvf ${es_data}.tar.gz

cd ${es_data}
./bin/elasticsearch -p ./pid/elastic.pid &
echo "kill `cat ./pid/elastic.pid`"
