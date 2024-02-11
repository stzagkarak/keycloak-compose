#!/bin/bash

# $1 -> -d to run compose detached 
cd deployment

mkdir -p instance/database/mbackups
mkdir -p instance/nginx

docker-compose down --remove-orphans
docker-compose up $1