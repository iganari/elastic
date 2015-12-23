# how to use




### インストール方法(elasticsearch 2)

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

### es

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



### Plugin

+ kibana

```
# /usr/share/elasticsearch/bin/plugin install elasticsearch/kibana
```


+ Shield(https://www.elastic.co/downloads/shield)

```
# usr/share/elasticsearch/bin/plugin install elasticsearch/license/latest
# /usr/share/elasticsearch/bin/plugin install elasticsearch/shield/latest
```



### kibana(https://www.elastic.co/thank-you?url=https://download.elastic.co/kibana/kibana/kibana-4.3.0-linux-x64.tar.gz)


```
# cd /var/tmp/

### ver 4.3.0
# wget https://download.elastic.co/kibana/kibana/kibana-4.3.0-linux-x64.tar.gz
### ver 4.1.3
### wget https://download.elastic.co/kibana/kibana/kibana-4.1.3-linux-x64.tar.gz

# tar zvxf kibana-4.3.0-linux-x64.tar.gz
# cp -ap kibana-4.3.0-linux-x64 /srv/kibana
# cd /srv
# chown root.root -R kibana
```

```
# rpm -ivh http://nginx.org/packages/centos/6/noarch/RPMS/nginx-release-centos-6-0.el6.ngx.noarch.rpm
# yum -y install nginx
# service nginx start
# chkconfig nginx on
```


+ yum repo

https://www.elastic.co/guide/en/elasticsearch/reference/current/setup-repositories.html


```
# sh -c "curl https://raw.githubusercontent.com/akabdog/scripts/master/kibana4_init > /etc/init.d/kibana"
# chmod 755 /etc/init.d/kibana
```


### 参考URL

+ Vagrantで複数台同時起動するマルチマシン設定
    + http://weblabo.oscasierra.net/vagrant-malti-machine/
