#!/bin/bash

### memo
# the stable distribution of Fluentd, called td-agent


# install td-agent from cli
curl -L https://toolbelt.treasuredata.com/sh/install-redhat-td-agent2.sh | sh

service   td-agent start
chkconfig td-agent on



### insstall plugin of elasticsearch
/opt/td-agent/embedded/bin/fluent-gem install fluent-plugin-elasticsearch
