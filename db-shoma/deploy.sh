#!/bin/bash
docker-compose down --rmi all --volumes --remove-orphans

rm -r ./mysql
#docker build ./python -t shomaigu/program-pyrou:latest
#docker push shomaigu/program-pyrou:latest

docker-compose build
docker-compose up

