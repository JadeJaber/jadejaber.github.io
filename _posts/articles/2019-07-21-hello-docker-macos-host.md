---
published: true
layout: post
excerpt: description
categories: articles
share: true
tags:
  - docker
  - springboot
  - swagger
title: Hello docker on your local MacOS host
---

This is a quick tutorial to run your springboot application with a swagger (already packaged) in a Docker container on MAC OS. 

You can package this Maven project if you do not have your own : [https://github.com/JadeJaber/spring-templates/tree/master/srpingboot.rest.api](https://github.com/JadeJaber/spring-templates/tree/master/srpingboot.rest.api)

## 1. Install Docker
Download from [docker.com](https://hub.docker.com/editions/community/docker-ce-desktop-mac)

## 2. Deploy SpringBootApplication on Docker
Launch Docker by starting the Docker Desktop application (MacOS)

Test docker with 

```bash
docker run hello-world
``` 

Create a folder containing the jar and a Dockerfile (vim Dockerfile)

```bash
FROM java:8
WORKDIR /
ADD springboot.demo.rest.api-1.0-SNAPSHOT.jar springboot.demo.rest.api-1.0-SNAPSHOT.jar
EXPOSE 8080
CMD java -jar springboot.demo.rest.api-1.0-SNAPSHOT.jar
```

> "EXPOSE port" will expose the specific port on the contaienr, it will be mapped with a host port at runtime.  

Build and tag the image.

```bash
docker build -t USERNAME/REPOSITORY:TAG . 
docker build -t legabz/hellokube:swagger .
``` 

To list all images 

```bash
docker images
OR
docker image ls
```

To launch the container: 

```bash
docker run [-d] -p HOST_PORT:CONTAINER_PORT TAG
docker run -d -p 4000:8080 legabz/hellokube:swagger
```

> -p port:port maps the exposed port to a host port

To list all the running container or past ones

```bash
docker container ls --all
```

To kill your container

```bash
docker container stop CONTAINER_ID
```

## 3. Share your image
Dockerhub is a free and public registry that contains repositories. Repositories contain docker images. Let's share our first image.

Login to dockerhub (you need to have an account). Docker will by default use dockerhub registry. But there are others and you may have your private registry.

```bash
docker login [registry]
```

Publish your image

```bash
docker push USERNAME/REPO_NAME:TAG
docker push legabz/hellokube:swagger
```  
 
Run your image from anywhere

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
```
