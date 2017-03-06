#!/bin/bash

docker push dianadi13/sample-node

ssh di_davletshin@130.211.88.69 << EOF
docker pull dianadi13/sample-node:latest
docker stop web || true
docker rm web || true
docker rmi dianadi13/sample-node:current || true
docker tag dianadi13/sample-node:latest dianadi13/sample-node:current
docker run -d --restart always --name web -p 80:80 dianadi13/sample-node:current
EOF
