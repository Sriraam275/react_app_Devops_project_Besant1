#!/bin/bash

docker login -u $DOCKER_USERNAME -p $DOCKER_PASS
docker stop reactcontainer
docker rm reactcontainer

docker build -t reactappim .

docker run -itd --name reactcontainer -p 80:80 reactappim

docker tag reactappim sriraam275/reactappimcicd
docker push sriraam275/reactappimcicd

