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
## 1. Create a certificate 
### 1.1 Open-SSL
To create a quick self-signed certificate for the server, use the following OpenSSL command:
```shell
openssl req -new -text -out server.req
```

Fill out the information that openssl asks for. Make sure you enter the local host name as "Common Name"; the challenge password can be left blank. The program will generate a key that is passphrase protected; it will not accept a passphrase that is less than four characters long. 

To remove the passphrase (as you must if you want automatic start-up of the server), run the commands:
```shell
openssl rsa -in privkey.pem -out server.key
rm privkey.pem
```
Enter the old passphrase to unlock the existing key. Now do:
```shell
openssl req -x509 -in server.req -text -key server.key -out server.crt
```
to turn the certificate into a self-signed certificate and to copy the key and certificate to where the server will look for them. Finally do:
```shell
chmod og-rwx server.key
```
because the server will reject the file if its permissions are more liberal than this. For more details on how to create your server private key and certificate, refer to the OpenSSL documentation.

A self-signed certificate can be used for testing, but a certificate signed by a certificate authority (CA) (either one of the global CAs or a local one) should be used in production so that clients can verify the server's identity. If all the clients are local to the organization, using a local CA is recommended.

### 1.2 Keytool

A public/private key may be generated into a jks store with such a command  : 
```shell
keytool -genkey -keyalg RSA -alias ssl -keystore keystore.jks -validity 360 -storepass changeit -keypass changeit -dname "cn=hostname, ou=test, o=test, c=XX"
```

**Options definitions** :
- keyalg : Crypting proptocol
- alias : The alias of your certificate.
- keystore : The store in which your private/public key pair will securiely saved
- validity : valdity of you public/private key pair
- storepass : password to read/modify/access your keystore
- keypass : Password to access your key pair
- dname : distinguished name associated to your key pair (these info are supposed to identify you as a unique server/person)


## 2 Certificate manipulation

### 2.1 Import a private key and signed certificate to a jks file
```shell
# You need the certification chain, the signed certificate and the private key
# 1. Import them into a p12 store 
openssl pkcs12 -export -in certificate.cer -inkey key.key -CAfile cacerts.pem > server.p12
# 2. Migrate the content of the p12 store to the jks store
keytool -importkeystore -srckeystore ./server.p12 -destkeystore keystore.jks -srcstoretype pkcs12 
```

### 2.2 Modify an alias
```shell
keytool -changealias -alias 'old_alias' -destalias 'new_alias' -keystore keystore.jks
```
