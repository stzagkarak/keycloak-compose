#!/bin/bash

mkdir -p ./../instance/nginx

docker compose down --remove-orphans
docker compose up