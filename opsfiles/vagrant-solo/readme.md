# 構成

hostname | IP | web
:-:|:-:|:-:
deves | 192.168.33.31 | Es(http://192.168.33.31:9200/)<br>kibana(http://192.168.33.31:5601/)<br>td-agentのendpoint(作成中) 


# hosts

```
### iganari/elasticsearch

192.168.33.31 elasticsearch.hejda.org   <== vagrant top
192.168.33.31            es.hejda.org
192.168.33.31        kibana.hejda.org
```

# Elasticsearch

```
http://192.168.33.31:9200/
http://es.hejda.org
```

+ head plugin

```
http://192.168.33.31:9200/_plugin/head
http://es.hejda.org/_plugin/head
```


# kibana

```
http://192.168.33.31:5601/
http://kibana.hejda.org
```

+ marvel

```
http://192.168.33.31:5601/app/marvel
http://kibana.hejda.org/app/marvel
```

+ sense

```
http://192.168.33.31:5601/app/sense
```

test query

`GET /_cluster/health?pretty=true`



# td-agent

```
作成中
```

# Serverspec

```
$ rake spec
```






test
