#/bin/bash

cd /tmp
### wget ver 4.1.4 for elasticsearh ver1.7
# curl -L -O https://download.elastic.co/kibana/kibana/kibana-4.1.4-linux-x64.tar.gz
wget https://download.elastic.co/kibana/kibana/kibana-4.1.4-linux-x64.tar.gz
# git clone https://github.com/elasticsearch/kibana.git kibana
tar zxvf kibana-4.1.4-linux-x64.tar.gz
cp -ar kibana-4.1.4-linux-x64  /usr/share/kibana4
echo "bin/kibana"
echo "http://192.168.33.21:5601"
