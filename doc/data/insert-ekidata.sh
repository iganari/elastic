#!/bin/bash

TMP_FILE='/tmp/ekidata.json'

rm -rf ${TMP_FILE} 

n=1
while [ "${n}" -ne 10 ]
  do
    rm -rf ${TMP_FILE} 
    curl http://www.ekidata.jp/api/p/${n}.json | sed -n 3P | awk -F= '{ print $2 }' | jq . > ${TMP_FILE}
    # curl -XPOST "http://192.168.33.31:9200/eki-0${n}/1" -d @${TMP_FILE}
    curl -XPOST "http://192.168.33.31:9200/eki/manabeshi" -d @${TMP_FILE}
    n=`expr ${n} + 1`
  done

while [ "${n}" -ne 48 ]
  do
    rm -rf ${TMP_FILE} 
    curl http://www.ekidata.jp/api/p/${n}.json | sed -n 3P | awk -F= '{ print $2 }' | jq . > ${TMP_FILE}
    # curl -XPOST "http://192.168.33.31:9200/eki-${n}/1" -d @${TMP_FILE}
    curl -XPOST "http://192.168.33.31:9200/eki/manabeshi" -d @${TMP_FILE}
    n=`expr ${n} + 1`
  done
exit 
