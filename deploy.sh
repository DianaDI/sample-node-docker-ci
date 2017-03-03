#!/bin/bash
docker build -t dianadi13/sample-node .
docker push dianadi13/sample-node

ssh dianke402@104.199.12.162 << EOF
docker pull dianadi13/sample-node:latest
docker stop web || true
docker rm web || true
docker rmi dianadi13/sample-node:current || true
docker tag dianadi13/sample-node:latest dianadi13/sample-node:current
docker run -d --net app --restart always --name web -p 80:80 dianadi13/sample-node:current
EOF
