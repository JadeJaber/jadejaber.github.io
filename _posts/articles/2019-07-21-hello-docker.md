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
---

This is a quick tutorial to run your springboot application with a swagger (already packaged) in a Docker container on MAC OS. 

## 1. Install Docker
Download from https://hub.docker.com/editions/community/docker-ce-desktop-mac 

## 2. Deploy SpringBootApplication on Docker
1. Launch Docker by starting the Docker Desktop application (MacOS)
2. Test docker with 
```bash
docker run hello-world
``` 
3. Create a folder containing the jar and a Dockerfile 
```bash
FROM java:8
WORKDIR /
ADD springboot.demo.rest.api-1.0-SNAPSHOT.jar springboot.demo.rest.api-1.0-SNAPSHOT.jar
EXPOSE 8080
CMD java -jar springboot.demo.rest.api-1.0-SNAPSHOT.jar
```
4. Build the image
```bash
docker build -t IMAGE_NAME . 
``` 
5. To list all images 
```bash
docker images
OR
docker image ls
```
6. To launch the container: 
```bash
docker run [-d] -p CONTAINER_PORT:APPLICATION_PORT IMAGE_NAME
docker run -d -p 4000:8080 demorest
```
7. To list all the running container or past ones
```bash
docker container ls --all
```
8. To kill your container
```bash
docker container stop CONTAINER_ID
```

## 3. Share your image
Dockerhub is a free and public registry that contains repositories. Repositories contain docker images. Let's share our first image.

1. Login to dockerhub (you need to have an account). Docker will by default use dockerhub registry. But there are others and you may have your private registry.
```bash
docker login [registry]
```

2. Tag your image
```bash
docker tag IMAGE USERNAME/REPOSITORY:TAG
docker tag demorest legabz/hellokube:swagger
``` 

3. Publish your image
```bash
docker push USERNAME/REPO_NAME:TAG
docker push legabz/hellokube:swagger
```  
 
4. Run your image from anywhere
```bash
docker run username/repository:tag
docker run -p 4000:80 legabz/hellokube:swagger
```

## 4. Cheat sheet 
```bash
docker build -t friendlyhello .  # Create image using this directory's Dockerfile
docker run -p 4000:80 friendlyhello  # Run "friendlyhello" mapping port 4000 to 80
docker run -d -p 4000:80 friendlyhello         # Same thing, but in detached mode
docker container ls                                # List all running containers
docker container ls -a             # List all containers, even those not running
docker container stop <hash>           # Gracefully stop the specified container
docker container kill <hash>         # Force shutdown of the specified container
docker container rm <hash>        # Remove specified container from this machine
docker container rm $(docker container ls -a -q)         # Remove all containers
docker image ls -a                             # List all images on this machine
docker image rm <image id>            # Remove specified image from this machine
docker image rm $(docker image ls -a -q)   # Remove all images from this machine
docker login             # Log in this CLI session using your Docker credentials
docker tag <image> username/repository:tag  # Tag <image> for upload to registry
docker push username/repository:tag            # Upload tagged image to registry
docker run username/repository:tag                   # Run image from a registry
````





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
