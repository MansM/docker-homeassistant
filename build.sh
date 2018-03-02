#!/bin/bash

HAVERSION=$(curl https://api.github.com/repos/home-assistant/home-assistant/releases/latest|jq -r .name)

sed -e "s/_HAVERSION_/${HAVERSION}/g" Dockerfile
