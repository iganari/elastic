# Tips

### swapを効かせなようにしたい

+ 現在のmemswapの優先度の確認
    + 0 ~ 100で設定が出来、あくまで"度合い"を示す数値
    + 0 = RAMを使いきるまでスワップしない
    + 100 = パフォーマンスに影響が出るほどスワップしまくる

```
# sysctl -a | grep swap
vm.swappiness = 60
```

+ サーバ再起動までの一時的な変更をしたい場合は以下のコマンド

```
# echo 1 > /proc/sys/vm/swappiness
#
# sysctl -a | grep swap
vm.swappiness = 1
```

+ 恒久的に設定を変更する場合

```
# vi /etc/sysctl.conf

+ vm.swappiness = 1
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
