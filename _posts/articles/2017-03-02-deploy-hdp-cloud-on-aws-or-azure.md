---
published: true
layout: post
excerpt: >-
  How to create my Hirtonworks CLuster on the CLoud with Amazon AWS or Microsoft
  Azure
categories: articles
share: true
tags:
  - hortonworks
  - hadoop
  - aws
  - cloud
  - azure
title: >-
  How to deploy my Hortonworks HDP cluster in the cloud with Amazon AWS and
  Microsoft Azure
---
## Azure vs AWS

The main differences in this article is that I'm using Azure to instantiate a single node HDP sandbox (for training) and I'm using AWS to instantiate a reale multi-node cluster (for real use cases). But you may also instantiate a real cluster using Azure.

## On Amazon AWS

Overview : [https://fr.hortonworks.com/blog/quickly-launch-hortonworks-data-platform-amazon-web-services/](https://fr.hortonworks.com/blog/quickly-launch-hortonworks-data-platform-amazon-web-services/)

Procedure : [http://hortonworks.github.io/hdp-aws/](http://hortonworks.github.io/hdp-aws/)

### Subscribe to HDP services and Controller Services
#### Hortonworks Data Cloud - Controller Service
Controller Service will let you instantiate AMI (Amazon Machine Image)
[Subscribe to Controller Services](https://aws.amazon.com/marketplace/pp/B01LXOQBOU?qid=1488444197744&sr=0-2&ref_=srh_res_product_title)

#### Hortonworks Data Cloud - HDP Services
The HDP services subscription will make the HDP AMI available
[Subscribe to HDP Services](https://aws.amazon.com/marketplace/fulfillment?pricing=hourly&productId=1eeff3e2-5715-4e42-9ef0-023f823095af&ref_=dtl_psb_continue&region=us-east-1)

In the following steps, be sure to select the same region on the top right corner.

First of all, you need to generate a key pair : [Generate my key pair](https://eu-west-1.console.aws.amazon.com/ec2/v2/home?region=eu-west-1#KeyPairs:sort=keyName) 

Once you have subscribed to both these services and generated the key pair you may:
1. Get back to your "Controller service" [Get back to Controller Service](https://aws.amazon.com/marketplace/pp/B01LXOQBOU?qid=1488444197744&sr=0-2&ref_=srh_res_product_title) and click on "Launch with CloudFormation Console"
2. Fill in the email field and keep the default options. Concerning the "remote access" you may input 0.0.0.0/0 to permit access to the cluster from any IP address.
3. Passer la page option
Puis cliquer sur "Create" => La création du "Controller Service" peut prendre jusqu'à 15 min
* 
Une fois crée, on clique sur output en bas de page et on récupère le lien pour accéder à l'interface du controller service. 

Ensuite on clique sur "Create Cluster", on nomme notre cluster : plus d'infos sur les conf ici http://hortonworks.github.io/hdp-aws/create/index.html 

J'ai sauvegardé un template qu'il est possibde de dupliquer désormais.

#### Utilisation du clsuter  ########

accéder  à https://aws.amazon.com/fr/
Mon compte > AWS Mangaement Console
Se loguer
Cliquer sur Service en haut à gauche puis cliquer sur EC2 piur arriver sur la liste de mes instances EC2
Cliquer sur CloudForamtion pour arriver sur la liste de mes clusters et de mes instance "Controller service"
 => En cochant sur la ligne Controller Service puis sur "Sorties" en bas de page je retrouve l'URL d'accès à mon "controller service" pour instancier de nouveaux cluster ou accéder aux clusters existants 
   =>En cliquant sur le bloc de mon cluster j'obtiens la lisre des urls de mes noeuds  et aussi les commandes SSH pour s'y connecter en ssh
 => En cochant sur le cluster puis sur "Sorties" j'obtiens l'URL d'ambari

Pour créer un nouveau cluter
Cliquer sur "Create cluster" à patir de ma page "Controller service"
Sélectionner le template
Sélectionner un mot de passe admin
Mettre un email pour recevoir la confirmation de création

### Billing

[Check your detailed reports](https://console.aws.amazon.com/billing/home#/costexplorer)
[Check your detailed bill](https://console.aws.amazon.com/billing/home#/bill?year=2017&month=3)


## AZURE 

**Prerequisities** : You needd to have a Micrsoft account (Outlook/Hotmail)

[Official procedure available here](https://fr.hortonworks.com/hadoop-tutorial/deploying-hortonworks-sandbox-on-microsoft-azure/#find-hortonworks-sandbox-on-azure-marketplace)

Go to to HortonWorks product in [Azure's Marketplace](https://portal.azure.com/#create/hortonworks.hortonworks-sandboxsandbox25) 

**Create** a new service "HDP Sandbox 2.5" using the button on the bottom of the page and fill in the form: 
- Name your service (ex: MySandbox)
- Select SSD disk type
- You may choose 2 types of authentication system (public/private key vs login/password). You should enter your local system username
- Name your resource group (ex: MySandbox)
- Validate the form

**Select** your machine type : **Standard DS11 v2** 

**Validate** the Network step without any modification

Once your cluster is created, it will be displayed on your [home page](https://portal.azure.com/#)

In order to connect to our machine, we need to [create a ssh funnel](https://fr.hortonworks.com/hadoop-tutorial/port-forwarding-azure-sandbox/) : 

You nee to edit your own ./.ssh/config file et put the public IP of your sandbox in the 4th line et your login in the 3rd line.
```shell
Host azureSandbox
  Port 22
  User azure
  HostName 137.116.198.44
  LocalForward 8080 127.0.0.1:8080
  LocalForward 8888 127.0.0.1:8888
  LocalForward 9995 127.0.0.1:9995
  LocalForward 9996 127.0.0.1:9996
  LocalForward 8886 127.0.0.1:8886
  LocalForward 10500 127.0.0.1:10500
  LocalForward 4200 127.0.0.1:4200
  LocalForward 2222 127.0.0.1:2222
```
###Reprendre ici
You may then connect to your host via ssh using the "Connect" tab. The login/password are the ones you've defined in the first form. 

Il faut ensuite se connecter en ssh sur le serveur en tapant ssh azureSandbox
Et puis on peut accéder à la page d'accueil de la sandbox à l'adresse localhost:8888