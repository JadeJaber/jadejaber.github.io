---
published: true
layout: post
excerpt: description
categories: articles
share: true
tags:
  - ethereum
  - crypto
  - smart contract
  - embark
---
# 1. Sources : 
- https://github.com/embark-framework/embark
- https://embark.readthedocs.io/en/2.6.6/
- https://ethereumdev.io/getting-started-with-embark-framework/
- https://embark.status.im/docs/index.html
- https://nodesource.com/blog/installing-node-js-tutorial-using-nvm-on-mac-os-x-and-ubuntu/


# 2. Introduction
Embark is a **framework** that allows you to easily **develop and deploy Decentralized Applications** (DApps).

A Decentralized Application is a serverless html5 application that uses one or more decentralized technologies.

Embark currently integrates with EVM blockchains (**Ethereum**), Decentralized Storages (**IPFS**), and Decentralized communication platforms (**Whisper** and **Orbit**). **Swarm** is supported for deployment.

With Embark you can:

**Blockchain (Ethereum)**
- Automatically deploy contracts and make them available in your JS code. Embark watches for changes, and if you update a contract, Embark will automatically redeploy the contracts (if needed) and the dapp.
- Contracts are available in JS with Promises.
- Do Test Driven Development with Contracts using Javascript.
- Keep track of deployed contracts; deploy only when truly needed.
- Manage different chains (e.g testnet, private net, livenet)
- Easily manage complex systems of interdependent contracts.


**Decentralized Storage (IPFS)**
- Easily Store & Retrieve Data on the DApp through EmbarkJS. Including uploading and retrieving files.
- Deploy the full application to IPFS or Swarm.

Decentralized Communication (Whisper, Orbit)
- Easily send/receive messages through channels in P2P through Whisper or Orbit.

**Web Technologies**
- Integrate with any web technology including React, Foundation, etc..
- Use any build pipeline or tool you wish, including grunt, gulp and webpack.

# 3. Installation
## 3.1 Prerequisites

**Node Version Manager**

[Install nvm (Node Version Manager)](https://nodesource.com/blog/installing-node-js-tutorial-using-nvm-on-mac-os-x-and-ubuntu/)
```shell
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
nvm --version ## Check installation
```

**Install Node Long Term Support**
```shell
nvm install --lts
nvm use --lts
```

## 3.2 Installation
### 3.2.1 Install embark
```shell
$ npm -g install embark --python=/usr/bin/python2.7
$ embark --version #to check installation
```
> Python v2.5<v<v3.0 is needed. If your default python is not appropriate you may set a different path using --python

### 3.2.2 With Ethereum Support

If you want to use Embark with Ethereum and want embark to run a node for you (with the embark blockchain command), then you need to install [Go-Ethrereum 1.6.7 or higher](https://geth.ethereum.org/).
```shell
$ brew tap ethereum/ethereum
$ brew install ethereum
```
Go Ethereum will be installed in /usr/local/Cellar 

### 3.2.3 With IPFS support

#### 3.2.3.1 IPFS Installation
To use IPFS you need first to install a IPFS node and run it. There two available, go-ipfs and js-ipfs. We will go with go-ipfs.

1. [Get the tarball](https://dist.ipfs.io/go-ipfs/v0.4.17/go-ipfs_v0.4.17_darwin-amd64.tar.gz)
2. Untar and install it. Ipfs binary will be moved to /usr/local

```shell
tar -xvzf ./go-ipfs_v0.4.17_darwin-amd64.tar.gz
cd go-ipfs
./install.sh
/usr/local/bin/ipfs #check installation
```

#### 3.2.3.2 Getting started with IPFS

Source : https://ipfs.io/docs/getting-started/

**Init**
```shell
> ipfs init
initializing IPFS node at /Users/jadejaber/.ipfs
generating 2048-bit RSA keypair...done
peer identity: QmNPUynBD5Dvg698rAqNeb6EtBVGY3iEZFUB8qJwgeZALM
to get started, enter:

> ipfs cat /ipfs/QmS4ustL54uo8FzR9455qaxZwuMiUhyvMcX9Ba8nUH4uVv/readme
> ipfs cat /ipfs/QmS4ustL54uo8FzR9455qaxZwuMiUhyvMcX9Ba8nUH4uVv/quick-start
```

**Going online**

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

IPFS Web UI and API: http://localhost:5001/

IPFS gateway: http://localhost:8080/ipfs/QmS4ustL54uo8FzR9455qaxZwuMiUhyvMcX9Ba8nUH4uVv/ (the hash used here is the one generated after the ipfs init command)

**Private notes**

- ipfs ls  /ipfs/QmS4ustL54uo8FzR9455qaxZwuMiUhyvMcX9Ba8nUH4uV (init hash)
- ipfs cat  /ipfs/QmZULkCELmmk5XNfCgTnCyFgAVxBRBXyDHGGMVoLFLiXEN (first put file test)















