#!/bin/bash
### https://www.elastic.co/guide/en/elasticsearch/reference/2.3/_exploring_your_data.html

dl_url='https://github.com/bly2k/files/blob/master/accounts.zip?raw=true'

cd /tmp
wget ${dl_url} -O /tmp/accounts.zip
tar zxvf /tmp/accounts.zip 

curl -XPOST '192.168.33.22:9200/bank/account/_bulk?pretty' --data-binary "@/tmp/accounts.json"
curl '192.168.33.22:9200/_cat/indices?v'
