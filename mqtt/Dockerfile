FROM debian:stretch-slim

RUN apt update && apt upgrade -y && \
    apt install -y --no-install-recommends mosquitto mosquitto-clients && \
    apt clean all && rm -rf /var/cache/apt/*

# Expose MQTT port


CMD mosquitto