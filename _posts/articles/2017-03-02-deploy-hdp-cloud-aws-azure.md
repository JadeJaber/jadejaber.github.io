---
published: true 
layout: post
excerpt:  How to create my Hirtonworks CLuster on the CLoud with Amazon AWS or Microsoft Azure
categories: articles
share: true
tags:
  - hortonworks
  - hadoop
  - aws
  - cloud
  - azure
---

Intro : https://fr.hortonworks.com/blog/quickly-launch-hortonworks-data-platform-amazon-web-services/

Modop : http://hortonworks.github.io/hdp-aws/ 

Il faut sincsrire aux 2 service suivants : 

### Hortonworks Data Cloud - HDP Services
https://aws.amazon.com/marketplace/fulfillment?pricing=hourly&productId=1eeff3e2-5715-4e42-9ef0-023f823095af&ref_=dtl_psb_continue&region=us-east-1
=> Pour avoir la possiblité d'instancier une AMI (Aamazon Machine Image) de type HDP services

Next Steps:

 - You will receive an email once your subscription completes.
 - Once you've received the email, please refer to the Usage Instructions and click one of the "Launch with EC2 Console" buttons on the Launch Page to start an instance of this software.
 - You can also find and launch these AMIs by searching for the AMI IDs (shown below) in the "Community AMIs" tab of the EC2 Console Launch Wizard, or launch with the EC2 APIs.
 - You can view this information at a later time by visiting the Your Software page. For help, see step-by-step instructions for launching Marketplace AMIs from the AWS Console.
Return to launch page : https://aws.amazon.com/marketplace/fulfillment?productId=1eeff3e2-5715-4e42-9ef0-023f823095af&launch=manualLaunch 


### Hortonworks Data Cloud - Controller Service
https://aws.amazon.com/marketplace/pp/B01LXOQBOU?qid=1488444197744&sr=0-2&ref_=srh_res_product_title
=> Console qui permettra d'instancier des clusters

Dna sles étaps suivantes, bien vérifier de choisir la même région (Frankfurt) dans le menu heut à droite

Il faut assi réer ou importer une paire de clé privée publique sur cette page : https://eu-west-1.console.aws.amazon.com/ec2/v2/home?region=eu-west-1#KeyPairs:sort=keyName 



Aprés avoir souscrit aux 2 services ci-dessus et génrer la paire de clé, revenir sur la page "Controller Service" et 
cliquer sur  "Launch with CloudFormation Console"
Remplir les informations email, et laisser les options slectionnées par défaut. Au nvieau de remote access, mettre 0.0.0.0 si l'on veut pouvoir accéer à lal console depuis n'importe quelle IP
Passer la page option
Puis cliquer sur "Create" => La création du "Controller Service" peut prendre jusqu'à 15 min
 
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


################
### AZURE ######
################
Il faut avoir un compte Windows (Hotmail)
Modop Hortonworks : https://fr.hortonworks.com/hadoop-tutorial/deploying-hortonworks-sandbox-on-microsoft-azure/#find-hortonworks-sandbox-on-azure-marketplace 

Accéder à https://portal.azure.com/#create/hortonworks.hortonworks-sandboxsandbox25 

Créer un nouveau service de type HDP Sandbox 2.5 et remplir les formulaires.
J'ai sélectionné le Standard DS11 v2 au niveau du type de cluster*
Nommer le service et le resrouce groupe (MySandBox), mettre le login lié à la clé publique et copier la clé publique => Valider
A l'étape suivante, valider sans rien modifier

Une fois le cluster créé, il est visible sur ma page d'accueil : https://portal.azure.com/#

Je peux m'y connecter en ssh via la commande proposée au niveau de l'ongleet "Connect" qu'on trouve sur la page d'acccueil de nptre cluster (accédé en cliquant sur mon cluster visible sur l ma page d'accueil https://portal.azure.com/#) 

Il faut maintenant mettre en place un tunnel ssh pour pouvoir s'y connecter : https://fr.hortonworks.com/hadoop-tutorial/port-forwarding-azure-sandbox/
faire un vi ~/.ssh/config et copier/coller le bloc suivant en mettant bien l'IP publique de notre sandbox en 4ème ligne et le login de mon compte (jajab) en 3ème ligne

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

Il fau ensuite se connecter en ssh sur le serveur en tapant ssh azureSandbox
Et puis on peut accéder à la page d'accueil de la sandbox à l'adresse localhost:8888













