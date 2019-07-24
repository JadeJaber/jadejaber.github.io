---
published: false
layout: post
excerpt: description
categories: articles
share: true
tags:
  - docker
  - springboot
  - swagger
  - docker-machine
  - minikube
---
## 1. Install Docker and VirtualBox

### 1.1 Install Docker
Download from https://hub.docker.com/editions/community/docker-ce-desktop-mac 

### 1.2 Install VirtualBox
```bash
brew cask install virtualbox
```

## 2.Infrastructure (choose one)

### 2.1 Instantiate a virtual machine With MiniKube (needs VirtualBox installation)

With minikube you can create a MONO node kubernetes cluster

```bash
minikube start
docker run hello-world
eval $(docker-machine env default)
docker default ps
minikube stop
```


### 2.2 Instantiate virtual machines With docker-machine (needs VirtualBox installation)

With docker-machine (installed wth Docker) you can create a MULTI node cluster

```bash
brew install docker-machine
docker-machine create [default]
docker-machine ls
docker-machine ip [default]
docker ssh [default]
docker run hello-world
eval $(docker-machine env default)
docker default ps
docker-machine stop default
```





##### Orchestration

##### docker-compose
To work with docker-compose you need to create an YAML file called docker-composer.yml where you describe which 
container you want to create and how they are linked between each other.

Exemple:
```yml
version: '2'
 
services:
   db:
     image: mysql:5.7
     volumes:
       - db_data:/var/lib/mysql
     restart: always
     environment:
       MYSQL_ROOT_PASSWORD: wordpress
       MYSQL_DATABASE: wordpress
       MYSQL_USER: wordpress
       MYSQL_PASSWORD: wordpress
 
   wordpress:
     depends_on:
       - db
     image: wordpress:latest
     ports:
       - "8000:80"
     restart: always
     environment:
       WORDPRESS_DB_HOST: db:3306
       WORDPRESS_DB_PASSWORD: wordpress
volumes:
    db_data:
```

##### Useful commands
This command runs all containers defined in your docker-compose file. If it is needed – rebuild and remove old unused containers.
```bash
docker-compose up -d --build --remove-orphans
```
















### Install kubectl
```bash
brew install kubectl
```

### Install Minikube
```bash
curl -Lo minikube https://storage.googleapis.com/minikube/releases/v0.27.0/minikube-darwin-amd64 &&\
      chmod +x minikube &&\
      sudo mv minikube /usr/local/bin/
```

### Action

#### Start Minikube
```bash
minikube start
```

#### Create a Kubernetes Deployment
```bash
kubectl run hello-minikube --image=k8s.gcr.io/echoserver:1.10 --port=8080
Output: deployment.apps/hello-minikube created$
```

#### Expose the Deployment as a Service
```bash
kubectl expose deployment hello-minikube --type=NodePort
```

#### Check if the Pod is up and running:
```bash
kubectl get pod
```

#### Get the URL of the exposed Service 
```bash
minikube service hello-minikube --url
http://192.168.99.103:32701
```

#### Delete the service
```bash
kubectl delete services hello-minikube
```

#### Delete the deployment
```bash
kubectl delete deployment hello-minikube
```

#### STOP and delete Minikube cluster
```bash
minikube stop
minikube delete
```




On peut lancer un cluster kube avec DockerDestop. A tester


### Troubleshooting : 

- If "Minikube start" hangs on "Starting cluster components..." then just uninstall and reinstall Minikube
```bash
    brew cask reinstall minikube
    minikube delete
    minikube start
````


docker-machine create \
    --driver=xhyve \
    --xhyve-experimental-nfs-share \
    my-machine