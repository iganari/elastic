# Tips

### memryを使い切る場合

```
# sysctl -a | grep swap
vm.swappiness = 60
```

これを以下のように変更

```
# echo 11 > /proc/sys/vm/swappiness
```

```text:/etc/sysctl.conf
vm.swappiness = 1
```

```text:反映
# sysctl -p
```



[スワップされて困っちゃうのでswappinessを設定する](http://qiita.com/ikuwow/items/f0b4d1f509a0b83b5d7e)
