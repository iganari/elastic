# 構成

hostname | IP | Es node role | web
:-:|:-:|:-:|:-:
deves01 | 192.168.33.21 | master | kibana(http://192.168.33.21:5601/)  
deves02 | 192.168.33.22 | search | Es(http://192.168.33.22:9200/)
deves03 | 192.168.33.23 | data   | -
deves04 | 192.168.33.24 | data   | -
deves05 | 192.168.33.25 | data   | -

### elasticsearch

```
http://192.168.33.22:9200/
```

### kibana

```
http://192.168.33.21:5601/
```

todo 

kibanaのdaemon化
