#!/bin/bash
conts=$(docker ps -a |  awk '/datahub-frontend-react/||/schema-registry/ || /datahub-gms/ || /broker/ || /mysql/  ||  /zookeeper/  || /elasticsearch/ || /datahub/ || /yottadb/ { print $1}')
docker rm $conts
vols=$(docker volume ls | awk '$2 ~ /datahub/ { print $2 }')
docker volume rm $vols
net=$(docker network ls | awk '$2 ~ /datahub/ { print $1 }')
docker network rm $net

