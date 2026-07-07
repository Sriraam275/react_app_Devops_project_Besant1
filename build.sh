#!/bin/bash

docker login -u $DOCKER_USERNAME -p $DOCKER_PASS
docker stop reactci-cdcontainer
docker rm reactci-cdcontainer

docker build -t reactappim .

docker run -itd --name reactcontainer -p 80:80 reactappim

docker tag reactappim sriraam275/reactappimCICD
docker push sriraam275/reactappimCICD

