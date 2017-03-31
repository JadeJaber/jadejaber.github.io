---
published: true
layout: post
excerpt: Transfer data with webhdfs
categories: articles
share: true
tags:
  - hortonworks
  - hadoop
  - tips
  - transfer data
  - webhdfs
---
### Write the following script transferFromCluster1ToCluster2.sh

```shell 
for i in $(cat $1);
do echo $i;
curl  -k --location-trusted -u 'login:passwd' -X GET "https://web_hdfs_of_source_cluster:8443/gateway/default/webhdfs/v1${i}?op=OPEN" | curl -v -k -T - --location-trusted -u 'login:passwd' -X PUT "https://web_hdfs_of_target_cluster:8443/gateway/default/webhdfs/v1${i}?op=CREATE&overwrite=true" ;
done;
```

### Launch your script with 
```shell
./transferFromCluster1ToCluster2.sh ./[file_which_contains_files_transfer.txt]
```

