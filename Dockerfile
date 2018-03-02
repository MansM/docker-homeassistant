FROM debian:stretch-slim

ARG HAVERSION=_HAVERSION_

RUN apt update && apt upgrade -y && \
    apt install -y python3-dev python3-pip python3-venv

#RUN python3 -m venv /srv/homeassistant/ 

#WORKDIR /srv/homeassistant

#RUN  bash -c "source bin/activate && \
RUN  python3 -m pip install wheel && \
    python3 -m pip install homeassistant"
    
