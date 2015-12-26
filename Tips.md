# Tips

### memryを使い切る場合

```
# sysctl -a | grep swap
vm.swappiness = 60
```

+ これを以下のように変更

```
# echo 1 > /proc/sys/vm/swappiness
```

+ /etc/sysctl.conf

```
vm.swappiness = 1
```

+ 反映

```
# sysctl -p
```



[スワップされて困っちゃうのでswappinessを設定する](http://qiita.com/ikuwow/items/f0b4d1f509a0b83b5d7e)

sudo bin/plugin install analysis-icu
sudo bin/plugin install analysis-kuromoji


cd /usr/share/elasticsearch
sudo bin/plugin install license
sudo bin/plugin install marvel-agent


bin/plugin list



# doc
https://www.elastic.co/guide/en/beats/libbeat/current/getting-started.html#kibana-installation
