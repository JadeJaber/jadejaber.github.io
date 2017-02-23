---
published: true
layout: post
excerpt: Nifi api heat sheet
categories: articles
share: true
tags:
  - hortonworks
  - hadoop
  - data processing
  - streaming
  - data ingestion
  - cheat sheet
  - nifi
  - api
---
Source : [https://nifi.apache.org/docs/nifi-docs/rest-api/](https://nifi.apache.org/docs/nifi-docs/rest-api/)
 

## Get A token 
```shell
/root/curl/bin/curl -u admin:#####  -k -i  -d "username=admin&password=#####" -X  POST https://[hostname]:9091/nifi-api/access/token 
```
=> This token is then use on the next API calls

## Get cluster info (node ids...) 
```shell
/root/curl/bin/curl -k -i -X GET https://[hostname]:9091/nifi-api/controller/cluster -H 'Authorization: Bearer [TOKEN]'
```

## Get process group info 
Here we're getting the root processor group info
```shell
/root/curl/bin/curl -k -i -X GET https://[hostname]:9091/nifi-api/process-groups/root  -H 'Authorization: Bearer [TOKEN]'
```

## Get sub process groups of a process group 
Here we're getting the root processor group's sub processors info
```shell
/root/curl/bin/curl -k -i -X GET https://[hostname]:9091/nifi-api/process-groups/root/process-groups -H 'Authorization: Bearer TOKEN'
``` 

## List all processors of a node 
Here we're getting all the processor od the node_id= 7c84501d-d10c-407c-b9f3-1d80e38fe36a
```shell
/root/curl/bin/curl -k -i -X GET https://[hostname]:9091/nifi-api/process-groups/7c84501d-d10c-407c-b9f3-1d80e38fe36a/processors -H 'Authorization: Bearer TOKEN'
```

## Stop a processor 
Here we are stopping the processor_id = 87dcf945-0159-1000-ffff-ffffd9f4c984
```shell
/root/curl/bin/curl -k -i -H "Content-Type: application/json" -H 'Authorization: Bearer TOKEN'  -d '{"revision":{"clientId":"[name of user]","version":"[version number]"},"component":{"id":"87dcf945-0159-1000-ffff-ffffd9f4c984","state":"STOPPED"}}' -X PUT https://[hostname]:9091/nifi-api/processors/87dcf945-0159-1000-ffff-ffffd9f4c984
```

## Delete a node (not disconnecting, which is different)
Here we're a deleting the node_id = 9116d192-184e-4538-9986-0dc68a04c119
```shell
/root/curl/bin/curl -k -i -X DELETE https://[hostname]:9091/nifi-api/controller/cluster/nodes/9116d192-184e-4538-9986-0dc68a04c119 -H 'Authorization: Bearer TOKEN'
```

## Send data to a HandleHttpRequest processor
```shell
curl -v -X POST -k -d "coucou" http://[hostname]:3000  --header "Content-Type:text/xml"
```

## Get all groups (users/groups)
```shell
/root/curl/bin/curl -k -i -X DELETE https://[hostname]/nifi-api/tenants/user-groups -H 'Authorization: Bearer TOKEN'
```
