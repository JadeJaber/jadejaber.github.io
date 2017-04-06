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

## 1. FUSER
**Kill all processes using port 80**
```shell
fuser -k -n tcp 80
```

**Kill all processes using this path pr file in any way**
```shell
fuser -k -n file -m /home
```
## 2. LSOF
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

## 3. NETSTAT
There's a few parameters to netstat that are useful for this :
-l or --listening : Shows only the sockets currently listening for incoming connection.
-a or --all : Shows all sockets currently in use.
-t or --tcp : Shows the tcp sockets.
-u or --udp : Shows the udp sockets.
-n or --numeric : Shows the hosts and ports as numbers, instead of resolving in dns and looking in /etc/services.
-p or --program : Shows the PID and name of the program to which each socket belongs
You use a mix of these to get what you want. To know which port numbers are currently in use, use one of these:
```shell
netstat -atn           # For tcp
netstat -aun           # For udp
netstat -atun          # For both
netstat -nlapute | grep LISTEN | grep 11000
```

