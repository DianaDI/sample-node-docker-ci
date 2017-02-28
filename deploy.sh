#!/bin/bash
docker push dianadi13/sample-node

ssh deploy@35.187.30.81 << EOF
docker pull dianadi13/sample-node:latest
docker stop web || true
docker rm web || true
docker rmi dianadi13/sample-node:current || true
docker tag diamadi13/sample-node:latest dianadi13/sample-node:current
docker run -d --net app --restart always --name web -p 80:80 dianadi13/sample-node:current
EOF
