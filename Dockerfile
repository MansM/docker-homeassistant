FROM debian:stretch-slim

ARG HAVERSION=_HAVERSION_

#installing python
RUN apt update && apt upgrade -y && \
    apt install -y --no-install-recommends python3-dev python3-pip python3-setuptools libudev-dev build-essential && \
    apt clean all && rm -rf /var/cache/apt/*

#installing hass and dependency wheel
RUN python3 -m pip install wheel && \
    python3 -m pip install homeassistant==_HAVERSION_

#Installing additional pip modules (extracting the versions from the components)
COPY install.py /install.py
COPY modules.txt /modules.txt
  
RUN python3 /install.py && rm -rf /root/.cache/pip

RUN groupadd homeassistant && \
    useradd \
      --create-home \
      -g homeassistant \
      homeassistant

USER homeassistant
CMD hass