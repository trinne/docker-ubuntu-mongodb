FROM  ubuntu:trusty

MAINTAINER  Tuomas Rinne <torinne@gmail.com>

# Installation:
# Import MongoDB public GPG key AND create a MongoDB list file
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
RUN echo "deb http://repo.mongodb.org/apt/ubuntu "$(lsb_release -sc)"/mongodb-org/3.2 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-3.2.list

# Update apt-get sources AND install MongoDB
RUN apt-get update && apt-get install -y mongodb-org=3.2.0 mongodb-org-server=3.2.0 mongodb-org-shell=3.2.0 mongodb-org-mongos=3.2.0 mongodb-org-tools=3.2.0

# Pin a specific version of MongoDB
RUN echo "mongodb-org hold" | dpkg --set-selections
RUN echo "mongodb-org-server hold" | dpkg --set-selections
RUN echo "mongodb-org-shell hold" | dpkg --set-selections
RUN echo "mongodb-org-mongos hold" | dpkg --set-selections
RUN echo "mongodb-org-tools hold" | dpkg --set-selections

# Create the MongoDB data directory
RUN mkdir -p /data/db

# Create the MongoDB log directory
RUN mkdir -p /logs/mongodb

# Create the MongoDB config directory
RUN mkdir -p /config/mongodb

# Copy the configuration to the container
COPY ./mongod.conf /config/mongodb/

# Expose port 27017 from the container to the host
EXPOSE 27017

ENTRYPOINT ["/usr/bin/mongod", "--config", "/config/mongodb/mongod.conf"]