---
published: true
layout: post
excerpt: description
categories: articles
share: true
tags:
  - blockchain
  - distributed
  - storage
  - ipfs
---
Source : [https://ipfs.io/docs/getting-started/](https://ipfs.io/docs/getting-started/)

# 1. Installation``

1. [Get the tarball](https://dist.ipfs.io/go-ipfs/v0.4.17/go-ipfs_v0.4.17_darwin-amd64.tar.gz)
2. Untar and install it. IPFS binary will be moved to /usr/local

```shell
tar -xvzf ./go-ipfs_v0.4.17_darwin-amd64.tar.gz
cd go-ipfs
./install.sh
/usr/local/bin/ipfs #check installation
```

# 2. Init
```shell
> ipfs init
initializing IPFS node at /Users/jadejaber/.ipfs
generating 2048-bit RSA keypair...done
peer identity: QmNPUynBD5Dvg698rAqNeb6EtBVGY3iEZFUB8qJwgeZALM
to get started, enter:

> ipfs cat /ipfs/QmS4ustL54uo8FzR9455qaxZwuMiUhyvMcX9Ba8nUH4uVv/readme
> ipfs cat /ipfs/QmS4ustL54uo8FzR9455qaxZwuMiUhyvMcX9Ba8nUH4uVv/quick-start
```

Check the quick-start file bellow to get started.

# 3. Going online

Once you’re ready to take things online, run the daemon in another terminal
```shell
> ipfs daemon
Initializing daemon...
Successfully raised file descriptor limit to 2048.
Swarm listening on /ip4/127.0.0.1/tcp/4001
Swarm listening on /ip4/192.168.1.72/tcp/4001
Swarm listening on /ip6/::1/tcp/4001
Swarm listening on /p2p-circuit/ipfs/QmNPUynBD5Dvg698rAqNeb6EtBVGY3iEZFUB8qJwgeZALM
Swarm announcing /ip4/127.0.0.1/tcp/4001
Swarm announcing /ip4/192.168.1.72/tcp/4001
Swarm announcing /ip4/86.74.223.122/tcp/41331
Swarm announcing /ip6/::1/tcp/4001
API server listening on /ip4/127.0.0.1/tcp/5001
Gateway (readonly) server listening on /ip4/127.0.0.1/tcp/8080
Daemon is ready
```

# 4. IPFS gateway

You may access every file/dir (local or external) using its hash as http://localhost:8080/[hash].

You may also use this generic gateway: https://gateway.ipfs.io/ipfs/[hash].

ex : http://localhost:8080/ipfs/QmS4ustL54uo8FzR9455qaxZwuMiUhyvMcX9Ba8nUH4uVv/ (this hash is the one generated after the ipfs init command)


# 5. Node Web UI and API

[http://localhost:5001/webui](http://localhost:5001/webui)

Lets you manage your IPFS node. 
- access data on the network using the DAG tab and copy/pasting the target hash
- add files to the MFS (Mutable FS) (ie: ipfs files cp/read/...) using the Files tab. For info, files added within the webUI are flushed on disk by default.
- list all peers to which you are connected (ie: ipfs swarm peers)

# 6. MFS

MFS stands for Mutable File System which are files located locally and that can be modified. The commands to interact with MFS are 
```shell
ipfs files [command]
```

By default, the files on MFS are flushed to disk. To avoid auto-flush add "--flush:=false" to your MFS commands. If the daemon is restarted/crashed without flushing, your data is lost.

You may copy/get between IPFS <=> local FS
```shell
ipfs add -r ./test                                                       # local FS => IPFS
ipfs get /ipfs/QmS4ustL54uo8FzR9455qaxZwuMiUhyvMcX9Ba8nUH4uVv 			 # IPFS => local FS
```
and copy from IPFS/MFS to MFS
```shell
ipfs files cp /ipfs/QmS4ustL54uo8FzR9455qaxZwuMiUhyvMcX9Ba8nUH4uVv /       # IPFS => MFS
ipfs files cp --flush=false  /folder/test.txt /folder_unflushed/test.txt   # MFS => MFS
```

# 7. Pinning

Pininnng ensures your data to be persisted localy. When you "ipfs add" content, it is pinned by default. If you do not pin your content, it will be garabage collected and not be available anymore.
