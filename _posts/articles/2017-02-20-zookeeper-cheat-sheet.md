---
published: false
---

## A quoi ca sert
Dans les fonctionnalités offertes par Zookeeper on trouve du Naming Service, de la gestion de configuration, de la synchronisation, Leader Election… Zookeeper est en fait comme une boîte à outils que vous pouvez utiliser dès que coordonner des process déployés sur plusieurs serveurs devient un casse-tête.

## Some commands
**Pour se connecter à Zookeeper**

Il faut préciser le quorum

```shell
/usr/hdp/current/zookeeper-client/bin/zkCli.sh -server opbdf0316.rouen.francetelecom.fr:2181,opbdf0516.rouen.francetelecom.fr:2181,opbdf0613.rouen.francetelecom.fr:2181

ls /hiveserver2
```

**Recursively delete a znode**

```shell
rmr /hiveserver2
```
