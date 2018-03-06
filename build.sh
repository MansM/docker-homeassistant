#!/bin/bash

HAVERSION=$(curl https://api.github.com/repos/home-assistant/home-assistant/releases/latest|jq -r .name)

sed -e "s/_HAVERSION_/${HAVERSION}/g" Dockerfile > Dockerfile-local

docker build --no-cache -f Dockerfile-local -t mansm/homeassistant:${HAVERSION} .
docker tag mansm/homeassistant:${HAVERSION} mansm/homeassistant:latest
