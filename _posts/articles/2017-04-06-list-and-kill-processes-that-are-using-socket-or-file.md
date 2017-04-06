---
published: true
layout: post
excerpt: List and kill processes that are using specific socket or file
categories: articles
share: true
tags:
  - linux
  - shell
  - tips
  - cheat sheet
  - debug troubleshooting
  - lsof
  - fuser
---

**Kill all processes using port 80**
```shell
fuser -k -n tcp 80
```

**Kill all processes using this path pr file in any way**
```shell
fuser -k -n file -m /home
```

**List processes using specific sockets**	
```shell
lsof -i                 #all the TCP/UDP connections
lsof -i tcp             #all the TCP connections
lsof -i udp             #all the UDP connections
lsof -i tcp:80          #TCP connections on port 80
lsof -i @56.85.68.98    #Connection between my host and 56.85.68.98
```

**List all files opened by a process**
```shell
lsof -p 1456
```

**List of all network connections and all files opened by a processs**
```shell
lsof -i -p 1234
```

**List of all network connections used by a specific process**
```shell
#-a acts like an AND operator
lsof -i -a -p 1234
```

**List of all files opened by user toto or 500 or by process 1234 or by process 12345**
```shell
lsof -p 1234,12345 -u 500,toto
```
