#!/bin/bash

# This is to demo

node_app=`docker ps -a | grep appnode | awk '{print $NF}'`
if [ $node_app=='nodeapp' ]; then
    echo "nodeapp is running, lets delete"
        docker rm -f nodeapp
fi

images=`docker images | grep vinod9782/ola | awk '{print $3}'`
docker rmi $images
docker run -d -p 8080:8080 --name nodeapp $1
