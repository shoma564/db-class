#!/bin/bash

docker-compose down
docker-compose down --rmi all --volumes --remove-orphans

rm -r mysql

docker build -t shomaigu/mysql-database-class:latest .
docker push shomaigu/mysql-database-class

docker-compose up
