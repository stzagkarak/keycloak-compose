#!/bin/bash

# $1 -> -d to run compose detached 

cd local-dev

docker compose down --remove-orphans
docker compose up $1