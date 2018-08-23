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

### 3.1.1 Node Version Manager

[Install nvm (Node Version Manager)](https://nodesource.com/blog/installing-node-js-tutorial-using-nvm-on-mac-os-x-and-ubuntu/)
```shell
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
nvm --version ## Check installation
```

### 3.1.2 Install Node Long Term Support
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

To use IPFS you need first to install a IPFS node and run it. There two available, go-ipfs and js-ipfs. We will go with go-ipfs.

1. [Get the tarball](https://dist.ipfs.io/go-ipfs/v0.4.17/go-ipfs_v0.4.17_darwin-amd64.tar.gz)
2. Untar and install it. Ipfs binary will be moved to /usr/local

```shell
tar -xvzf ./go-ipfs_v0.4.17_darwin-amd64.tar.gz
cd go-ipfs
./install.sh
/usr/local/bin/ipfs #check installation
```

More on IPFS here : [Getting started with IPFS]({% post_url 2018-08-23-getting-started-with-ipfs.md %})

