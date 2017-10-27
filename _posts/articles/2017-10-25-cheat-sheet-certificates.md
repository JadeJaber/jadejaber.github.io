---
published: true
layout: post
excerpt: description
categories: articles
share: true
tags:
  - linux
  - certificates
  - openssl
  - keytool
---
## Import a private key and signed certificate to a jks file
```shell
# You need the certification chain, the signed certificate and the private key
# 1. Import them into a p12 store
openssl pkcs12 -export -in certificate.cer -inkey key.key -CAfile cacerts.pem > server.p12
# 2. Migrate the content of the p12 store to the jks store
keytool -importkeystore -srckeystore ./server.p12 -destkeystore keystore.jks -srcstoretype pkcs12 

## Modify an alias
```shell
keytool -changealias -alias 'old_alias' -destalias 'new_alias' -keystore keystore.jks
```


