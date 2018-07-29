#!/bin/bash

HAVERSION=$(curl https://api.github.com/repos/home-assistant/home-assistant/releases/latest|jq -r .name)

#rm Dockerfile-local
sed -e "s/_HAVERSION_/${HAVERSION}/g" homeassistant/Dockerfile |tee homeassistant/Dockerfile-local

docker build -f homeassistant/Dockerfile-local -t mansm/homeassistant:${HAVERSION} homeassistant/
docker tag mansm/homeassistant:${HAVERSION} mansm/homeassistant:latest

docker build -t mansm/mqtt:latest mqtt/

docker push mansm/homeassistant:${HAVERSION}
docker push mansm/homeassistant:latest
