#!/bin/bash

# $1 -> -d to run compose detached 
cd local-dev

mkdir -p instance/database/mbackups

docker-compose down --remove-orphans
docker-compose up $1