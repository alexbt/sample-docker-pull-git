#!/bin/bash

# Delete all containers
docker rm $(docker ps -a -q)

# Delete all without child
docker rmi $(docker images -aq -f dangling=true)

# Delete all images
docker rmi $(docker images -q)

# try again - # Delete all without child
docker rmi $(docker images -aq -f dangling=true)
