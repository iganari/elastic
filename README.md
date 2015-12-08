# how to use



### cmd

+ es restart

```
# service 
```



### インストール方法

+ java

```
# wget --no-check-certificate --no-cookies - --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u45-b14/jdk-8u45-linux-x64.rpm
# rpm -Uhv jdk-8u45-linux-x64.rpm
```

```
# java -version
java version "1.8.0_45"
Java(TM) SE Runtime Environment (build 1.8.0_45-b14)
Java HotSpot(TM) 64-Bit Server VM (build 25.45-b02, mixed mode)
```

+++ es

```
# rpm -Uvh https://download.elasticsearch.org/elasticsearch/release/org/elasticsearch/distribution/rpm/elasticsearch/2.1.0/elasticsearch-2.1.0.rpm
# service elasticsearch start
# chkconfig elasticsearch on
```

+ 起動のチェック

```
# curl -X GET http://localhost:9200
{
  "name" : "Blind Justice",
  "cluster_name" : "elasticsearch",
  "version" : {
    "number" : "2.1.0",
    "build_hash" : "72cd1f1a3eee09505e036106146dc1949dc5dc87",
    "build_timestamp" : "2015-11-18T22:40:03Z",
    "build_snapshot" : false,
    "lucene_version" : "5.3.1"
  },
  "tagline" : "You Know, for Search"
}
```
