# Docker - Ubuntu - MongoDB

With this Docker container you can easily run MongoDB on Ubuntu.

This Dockerfile and documentation is based on the MongoDB example on [docs.docker.com](https://docs.docker.com/engine/examples/mongodb/).


## Building the MongoDB Docker image
```bash
$ docker build --tag my/repo .
```

## Using the MongoDB image
With the MongoDB image you can run MongoDB instances as daemon processes.
Below is the example from [docs.docker.com](https://docs.docker.com/engine/examples/mongodb/).
```bash
# Basic way
# Usage: docker run --name <name for container> -d <user-name>/<repository>
$ docker run -p 27017:27017 --name mongo_instance_001 -d my/repo

# Dockerized MongoDB, lean and mean!
# Usage: docker run --name <name for container> -d <user-name>/<repository> --noprealloc --smallfiles
$ docker run -p 27017:27017 --name mongo_instance_001 -d my/repo --smallfiles

# Checking out the logs of a MongoDB container
# Usage: docker logs <name for container>
$ docker logs mongo_instance_001

# Playing with MongoDB
# Usage: mongo --port <port you get from `docker ps`>
$ mongo --port 27017

# If using docker-machine
# Usage: mongo --port <port you get from `docker ps`>  --host <ip address from `docker-machine ip VM_NAME`>
$ mongo --port 27017 --host 192.168.59.103
```
