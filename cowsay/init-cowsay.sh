#!/bin/bash

docker build . -t bel/cowsay

if [ $PORT ] 
then
docker run -d -p 4001:$PORT bel/cowsay
else 
docker run -d -p 4001:8080 bel/cowsay
docker exec -it bel/cowsay bash
fi