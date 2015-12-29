■ ESデータインサート

ヤフーだけとのことでしたが、ほかのも記載しました。
不明な点があれば連絡ください。


----------------------------------------------------------------------------------

● yauc
server : 192.168.2.145
data-dir : /data2/auction/data_es/【yyyymmdd】

● yauc-adult
server : 192.168.2.65
data-dir : /data2/auction/data_es/【yyyymmdd】

● rauc
server : 192.168.2.64
data-dir : /data2/auction/data_es/【yyyymmdd】

● mbok
server : 192.168.2.35
data-dir : /data2/auction/data_es/【yyyymmdd】


・上記よりデータファイル（gzされたファイル）を 192.168.101.27 に転送する。
・転送したファイル（192.168.101.27にコピーしたファイル）を gunzip する。
・192.168.101.27 にて、下記スクリプトで ES にインサートする

# ヤフーアダルトの場合

cd /var/www/cgi-bin/
perl ./es-bulk-insert.pl input-file-name 【ファイル名】 is-adult true

# ヤフーアダルト以外の場合

cd /var/www/cgi-bin/
perl ./es-bulk-insert.pl input-file-name 【ファイル名】 is-adult false

----------------------------------------------------------------------------------

● sekaimon

・192.168.2.249 にて 下記スクリプトを実行し、データ作成を行う

su -l aucfan
perl /home/aucfan/bin/es/es.insert.sekaimon.pl 【YYYYMM】 【出力ファイル名】

・出力したファイルを 192.168.101.27 へ転送する

・192.168.101.27 にて、下記スクリプトで ES にインサートする

cd /var/www/cgi-bin/
perl ./es-bulk-insert.pl input-file-name 【ファイル名】 is-adult false

----------------------------------------------------------------------------------

■ データ削除

・下記管理画面にアクセスする
http://192.168.101.27:9200/_plugin/head/

・削除したいインデックスの「Actions」ボタンをクリックして、「DELETE」を選択。

・表示された入力欄に「DELETE」を入力して「OK」をクリック


※ インデックス（RDBのデータベースのような物）の命名ルールは下記のようになっています。
下記を参考に、削除したいインデックスを探してください。
-------------------------------------------------
auction-results.bid.【サイト名】.【YYYYMM】.00000
-------------------------------------------------

---------------------------------------------------------------------------------- 
