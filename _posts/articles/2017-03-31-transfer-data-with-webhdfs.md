---
published: false
---

```shell 
for i in $(cat $1);
do echo $i;
curl  -k --location-trusted -u 'login:paaswd' -X GET "https://source_server:8443/gateway/default/webhdfs/v1${i}?op=OPEN" | curl -v -k -T - --location-trusted -u 'login:paaswd' -X PUT "https://target_server:8443/gateway/default/webhdfs/v1${i/z_lab_cia_hive_socle/z_app_ccbihadoop_hive_temp}?op=CREATE&overwrite=true" ;
done;
```
